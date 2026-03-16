import Link from 'next/link';
import { notFound } from 'next/navigation';
import { Navbar } from '@/components/layout/navbar';
import { Footer } from '@/components/layout/footer';
import { createClient } from '@supabase/supabase-js';
import { Download, Eye, Heart, Share2, ArrowLeft } from 'lucide-react';
import { Button } from '@/components/ui/button';

function getSupabase() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL || '',
    process.env.SUPABASE_SERVICE_ROLE_KEY || ''
  );
}

async function getIcon(slug: string) {
  const supabase = getSupabase();
  const { data: icon } = await supabase
    .from('icons')
    .select('*')
    .eq('slug', slug)
    .eq('status', 'active')
    .single();
  return icon;
}

async function getRelatedIcons(categoryId: string, excludeSlug: string) {
  const supabase = getSupabase();
  const { data: icons } = await supabase
    .from('icons')
    .select('*')
    .eq('category_id', categoryId)
    .neq('slug', excludeSlug)
    .eq('status', 'active')
    .limit(6);
  return icons || [];
}

export default async function IconDetailPage({ params }: { params: { slug: string } }) {
  const icon = await getIcon(params.slug);

  if (!icon) {
    notFound();
  }

  const relatedIcons = await getRelatedIcons(icon.category_id, icon.slug);

  return (
    <div className="min-h-screen flex flex-col">
      <Navbar />

      <main className="flex-1">
        {/* Breadcrumb */}
        <div className="bg-slate-50 dark:bg-slate-900/50 py-4">
          <div className="container px-4 mx-auto">
            <Link href="/icons" className="inline-flex items-center text-sm text-muted-foreground hover:text-foreground">
              <ArrowLeft className="w-4 h-4 mr-2" />
              Back to Icons
            </Link>
          </div>
        </div>

        {/* Icon Detail */}
        <div className="container px-4 mx-auto py-12">
          <div className="grid md:grid-cols-2 gap-12">
            {/* Preview */}
            <div className="flex items-center justify-center bg-slate-100 dark:bg-slate-800 rounded-2xl p-12">
              <div
                className="w-48 h-48 flex items-center justify-center"
                dangerouslySetInnerHTML={{ __html: icon.svg_content || '' }}
              />
            </div>

            {/* Info */}
            <div>
              <h1 className="text-3xl font-bold mb-2">{icon.name}</h1>
              <p className="text-muted-foreground mb-6">{icon.description}</p>

              {/* Stats */}
              <div className="flex gap-6 mb-6">
                <div className="flex items-center gap-2">
                  <Eye className="w-5 h-5 text-muted-foreground" />
                  <span className="text-sm">{icon.view_count || 0} views</span>
                </div>
                <div className="flex items-center gap-2">
                  <Download className="w-5 h-5 text-muted-foreground" />
                  <span className="text-sm">{icon.download_count || 0} downloads</span>
                </div>
                <div className="flex items-center gap-2">
                  <Heart className="w-5 h-5 text-muted-foreground" />
                  <span className="text-sm">{icon.like_count || 0} likes</span>
                </div>
              </div>

              {/* Tags */}
              <div className="flex flex-wrap gap-2 mb-8">
                <span className="px-3 py-1 bg-slate-100 dark:bg-slate-800 rounded-full text-sm">
                  {icon.style}
                </span>
                {icon.tags?.map((tag: string) => (
                  <span key={tag} className="px-3 py-1 bg-blue-100 dark:bg-blue-900/30 text-blue-700 dark:text-blue-300 rounded-full text-sm">
                    {tag}
                  </span>
                ))}
              </div>

              {/* Download Buttons */}
              <div className="space-y-3">
                <Button className="w-full h-12 bg-blue-600 hover:bg-blue-700">
                  <Download className="w-5 h-5 mr-2" />
                  Download SVG
                </Button>
                <Button variant="outline" className="w-full h-12">
                  Download PNG
                </Button>
              </div>

              {/* Share */}
              <div className="mt-6 flex items-center gap-4">
                <span className="text-sm text-muted-foreground">Share:</span>
                <Button variant="ghost" size="icon">
                  <Share2 className="w-5 h-5" />
                </Button>
              </div>
            </div>
          </div>

          {/* Related Icons */}
          {relatedIcons.length > 0 && (
            <div className="mt-16">
              <h2 className="text-2xl font-bold mb-6">Related Icons</h2>
              <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4">
                {relatedIcons.map((related: any) => (
                  <Link
                    key={related.id}
                    href={`/icons/${related.slug}`}
                    className="group relative aspect-square border rounded-xl hover:border-blue-500 hover:shadow-lg transition-all bg-white dark:bg-slate-900 p-4 flex items-center justify-center"
                  >
                    <div
                      className="w-12 h-12 flex items-center justify-center"
                      dangerouslySetInnerHTML={{ __html: related.svg_content || '' }}
                    />
                  </Link>
                ))}
              </div>
            </div>
          )}
        </div>
      </main>

      <Footer />
    </div>
  );
}
