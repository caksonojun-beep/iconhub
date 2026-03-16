import Link from 'next/link';
import { Navbar } from '@/components/layout/navbar';
import { Footer } from '@/components/layout/footer';
import { Search, Filter, Grid, List } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';

export default function IconsPage() {
  // Mock data - will be replaced with Supabase data
  const icons = [
    { id: '1', name: 'home', slug: 'home', previewUrl: '/icons/home.svg', downloads: 1234, style: 'outline' },
    { id: '2', name: 'settings', slug: 'settings', previewUrl: '/icons/settings.svg', downloads: 987, style: 'outline' },
    { id: '3', name: 'user', slug: 'user', previewUrl: '/icons/user.svg', downloads: 876, style: 'outline' },
    { id: '4', name: 'mail', slug: 'mail', previewUrl: '/icons/mail.svg', downloads: 765, style: 'outline' },
    { id: '5', name: 'search', slug: 'search', previewUrl: '/icons/search.svg', downloads: 654, style: 'outline' },
    { id: '6', name: 'heart', slug: 'heart', previewUrl: '/icons/heart.svg', downloads: 543, style: 'filled' },
    { id: '7', name: 'star', slug: 'star', previewUrl: '/icons/star.svg', downloads: 432, style: 'filled' },
    { id: '8', name: 'download', slug: 'download', previewUrl: '/icons/download.svg', downloads: 321, style: 'outline' },
  ];

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
              Showing <span className="font-medium text-foreground">1-20</span> of{' '}
              <span className="font-medium text-foreground">5,000+</span> icons
            </p>
            <select className="px-3 py-2 border rounded-md bg-background">
              <option>Most Popular</option>
              <option>Newest</option>
              <option>Most Downloads</option>
            </select>
          </div>

          <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4">
            {icons.map((icon) => (
              <Link
                key={icon.id}
                href={`/icons/${icon.slug}`}
                className="group relative aspect-square border rounded-xl hover:border-blue-500 hover:shadow-lg transition-all bg-white dark:bg-slate-900 p-4 flex items-center justify-center"
              >
                <div className="w-16 h-16 flex items-center justify-center">
                  {/* Placeholder icon */}
                  <div className="w-12 h-12 bg-slate-200 dark:bg-slate-700 rounded-lg flex items-center justify-center text-slate-500">
                    <span className="text-xs">{icon.name}</span>
                  </div>
                </div>
                <div className="absolute bottom-2 left-2 right-2 flex justify-between items-center opacity-0 group-hover:opacity-100 transition-opacity">
                  <span className="text-xs font-medium truncate">{icon.name}</span>
                  <span className="text-xs text-muted-foreground">{icon.downloads}</span>
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
