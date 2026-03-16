import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';

function getSupabase() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL || '',
    process.env.SUPABASE_SERVICE_ROLE_KEY || ''
  );
}

export async function GET(
  request: NextRequest,
  { params }: { params: { slug: string } }
) {
  const { searchParams } = new URL(request.url);
  const format = searchParams.get('format') || 'svg';

  const supabase = getSupabase();

  // Get icon from database
  const { data: icon, error } = await supabase
    .from('icons')
    .select('*')
    .eq('slug', params.slug)
    .eq('status', 'active')
    .single();

  if (error || !icon) {
    return NextResponse.json({ error: 'Icon not found' }, { status: 404 });
  }

  // Track download
  await supabase.from('icon_downloads').insert({
    icon_id: icon.id,
    format: format,
    ip_address: request.headers.get('x-forwarded-for') || 'unknown',
  });

  // Update download count
  await supabase
    .from('icons')
    .update({ download_count: (icon.download_count || 0) + 1 })
    .eq('id', icon.id);

  // Return SVG content directly
  if (format === 'svg') {
    return new NextResponse(icon.svg_content, {
      headers: {
        'Content-Type': 'image/svg+xml',
        'Content-Disposition': `attachment; filename="${icon.slug}.svg"`,
      },
    });
  }

  // For PNG, we would need to convert SVG to PNG
  // For now, return SVG with a message
  return NextResponse.redirect(new URL(`/icons/${icon.slug}`, request.url));
}
