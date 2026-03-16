import Link from 'next/link';
import { Navbar } from '@/components/layout/navbar';
import { Footer } from '@/components/layout/footer';

export default function CategoriesPage() {
  const categories = [
    { name: 'User Interface', slug: 'user-interface', iconCount: 1250, icon: 'Layout' },
    { name: 'Social Media', slug: 'social-media', iconCount: 890, icon: 'Share2' },
    { name: 'Business', slug: 'business', iconCount: 756, icon: 'Briefcase' },
    { name: 'Finance', slug: 'finance', iconCount: 620, icon: 'DollarSign' },
    { name: 'E-commerce', slug: 'e-commerce', iconCount: 540, icon: 'ShoppingCart' },
    { name: 'Communication', slug: 'communication', iconCount: 480, icon: 'MessageCircle' },
    { name: 'Travel', slug: 'travel', iconCount: 420, icon: 'MapPin' },
    { name: 'Food & Drink', slug: 'food-drink', iconCount: 380, icon: 'Coffee' },
    { name: 'Health & Fitness', slug: 'health-fitness', iconCount: 320, icon: 'Heart' },
    { name: 'Technology', slug: 'technology', iconCount: 290, icon: 'Cpu' },
    { name: 'Weather', slug: 'weather', iconCount: 180, icon: 'Cloud' },
    { name: 'Arrows & Direction', slug: 'arrows-direction', iconCount: 156, icon: 'ArrowUp' },
  ];

  return (
    <div className="min-h-screen flex flex-col">
      <Navbar />

      <main className="flex-1">
        {/* Page Header */}
        <div className="bg-slate-50 dark:bg-slate-900/50 py-12">
          <div className="container px-4 mx-auto">
            <h1 className="text-4xl font-bold mb-4">Categories</h1>
            <p className="text-muted-foreground text-lg">
              Browse icons by category to find what you need
            </p>
          </div>
        </div>

        {/* Categories Grid */}
        <div className="container px-4 mx-auto py-12">
          <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
            {categories.map((category) => (
              <Link
                key={category.slug}
                href={`/categories/${category.slug}`}
                className="group p-6 border rounded-xl hover:border-blue-500 hover:shadow-lg transition-all bg-white dark:bg-slate-900"
              >
                <div className="w-12 h-12 bg-blue-100 dark:bg-blue-900/30 rounded-xl flex items-center justify-center mb-4 group-hover:bg-blue-600 group-hover:text-white transition-colors">
                  <span className="text-xl">{category.icon}</span>
                </div>
                <h3 className="font-semibold text-lg mb-1">{category.name}</h3>
                <p className="text-sm text-muted-foreground">
                  {category.iconCount.toLocaleString()} icons
                </p>
              </Link>
            ))}
          </div>
        </div>
      </main>

      <Footer />
    </div>
  );
}
