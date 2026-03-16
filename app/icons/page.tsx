import Link from 'next/link';
import { Navbar } from '@/components/layout/navbar';
import { Footer } from '@/components/layout/footer';
import { Search, Filter, Grid, List } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { createClient } from '@supabase/supabase-js';

// Server-side Supabase client
function getSupabase() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL || '',
    process.env.SUPABASE_SERVICE_ROLE_KEY || ''
  );
}

async function getIcons() {
  const supabase = getSupabase();
  const { data: icons } = await supabase
    .from('icons')
    .select('*')
    .eq('status', 'active')
    .order('created_at', { ascending: false })
    .limit(20);
  return icons || [];
}

async function getTotalCount() {
  const supabase = getSupabase();
  const { count } = await supabase
    .from('icons')
    .select('*', { count: 'exact', head: true })
    .eq('status', 'active');
  return count || 0;
}

export default async function IconsPage() {
  const icons = await getIcons();
  const totalCount = await getTotalCount();

  return (
    <div className="min-h-screen flex flex-col">
      <Navbar />

      <main className="flex-1">
        {/* Page Header */}
        <div className="bg-slate-50 dark:bg-slate-900/50 py-12">
          <div className="container px-4 mx-auto">
            <h1 className="text-4xl font-bold mb-4">Browse Icons</h1>
            <p className="text-muted-foreground text-lg">
              Discover thousands of free icons in multiple styles
            </p>
          </div>
        </div>

        {/* Search and Filters */}
        <div className="container px-4 mx-auto py-6">
          <div className="flex flex-col md:flex-row gap-4">
            <div className="relative flex-1">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
              <Input
                type="search"
                placeholder="Search icons by name or tag..."
                className="pl-10 h-12 text-lg"
              />
            </div>
            <div className="flex gap-2">
              <Button variant="outline" className="h-12">
                <Filter className="w-4 h-4 mr-2" />
                Filters
              </Button>
              <div className="flex border rounded-md">
                <Button variant="ghost" size="icon" className="rounded-r-none">
                  <Grid className="h-4 w-4" />
                </Button>
                <Button variant="ghost" size="icon" className="rounded-l-none">
                  <List className="h-4 w-4" />
                </Button>
              </div>
            </div>
          </div>

          {/* Filter Tags */}
          <div className="flex flex-wrap gap-2 mt-4">
            <Button variant="secondary" size="sm" className="rounded-full">
              All
            </Button>
            <Button variant="outline" size="sm" className="rounded-full">
              Outline
            </Button>
            <Button variant="outline" size="sm" className="rounded-full">
              Filled
            </Button>
            <Button variant="outline" size="sm" className="rounded-full">
              Gradient
            </Button>
            <Button variant="outline" size="sm" className="rounded-full">
              3D
            </Button>
          </div>
        </div>

        {/* Icons Grid */}
        <div className="container px-4 mx-auto py-8">
          <div className="flex justify-between items-center mb-6">
            <p className="text-muted-foreground">
              Showing <span className="font-medium text-foreground">1-{icons.length}</span> of{' '}
              <span className="font-medium text-foreground">{totalCount}+</span> icons
            </p>
            <select className="px-3 py-2 border rounded-md bg-background">
              <option>Most Popular</option>
              <option>Newest</option>
              <option>Most Downloads</option>
            </select>
          </div>

          <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4">
            {icons.map((icon: any) => (
              <Link
                key={icon.id}
                href={`/icons/${icon.slug}`}
                className="group relative aspect-square border rounded-xl hover:border-blue-500 hover:shadow-lg transition-all bg-white dark:bg-slate-900 p-4 flex items-center justify-center"
              >
                <div className="w-16 h-16 flex items-center justify-center text-slate-700 dark:text-slate-300"
                     dangerouslySetInnerHTML={{ __html: icon.svg_content || '' }}
                />
                <div className="absolute bottom-2 left-2 right-2 flex justify-between items-center opacity-0 group-hover:opacity-100 transition-opacity bg-white/90 dark:bg-slate-900/90 rounded px-2 py-1">
                  <span className="text-xs font-medium truncate">{icon.name}</span>
                  <span className="text-xs text-muted-foreground">{icon.download_count || 0}</span>
                </div>
              </Link>
            ))}
          </div>

          {/* Load More */}
          <div className="flex justify-center mt-12">
            <Button variant="outline" size="lg">
              Load More Icons
            </Button>
          </div>
        </div>
      </main>

      <Footer />
    </div>
  );
}
