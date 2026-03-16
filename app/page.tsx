import Link from 'next/link';
import { Search, Download, Zap, Users } from 'lucide-react';

export default function Home() {
  return (
    <main className="min-h-screen">
      {/* Hero Section */}
      <section className="relative overflow-hidden bg-gradient-to-b from-blue-50 to-white dark:from-blue-950/20 dark:to-background">
        <div className="container px-4 py-24 mx-auto">
          <div className="max-w-3xl mx-auto text-center">
            <h1 className="text-5xl font-bold tracking-tight mb-6">
              Free Icons for{' '}
              <span className="text-blue-600 dark:text-blue-400">Everyone</span>
            </h1>
            <p className="text-xl text-muted-foreground mb-8">
              Download thousands of free SVG icons in multiple styles.
              No attribution required. Made for designers and developers.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <Link
                href="/icons"
                className="inline-flex items-center justify-center px-6 py-3 text-lg font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 transition-colors"
              >
                <Search className="w-5 h-5 mr-2" />
                Browse Icons
              </Link>
              <Link
                href="/creator/register"
                className="inline-flex items-center justify-center px-6 py-3 text-lg font-medium text-blue-600 bg-blue-50 dark:bg-blue-900/20 rounded-lg hover:bg-blue-100 dark:hover:bg-blue-900/40 transition-colors"
              >
                <Zap className="w-5 h-5 mr-2" />
                Become a Creator
              </Link>
            </div>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section className="container px-4 py-16 mx-auto">
        <div className="grid md:grid-cols-3 gap-8">
          <div className="text-center p-6">
            <div className="w-14 h-14 mx-auto mb-4 bg-blue-100 dark:bg-blue-900/30 rounded-xl flex items-center justify-center">
              <Download className="w-7 h-7 text-blue-600" />
            </div>
            <h3 className="text-xl font-semibold mb-2">Free Download</h3>
            <p className="text-muted-foreground">
              Download unlimited icons in SVG and PNG formats. No subscription required.
            </p>
          </div>
          <div className="text-center p-6">
            <div className="w-14 h-14 mx-auto mb-4 bg-blue-100 dark:bg-blue-900/30 rounded-xl flex items-center justify-center">
              <Zap className="w-7 h-7 text-blue-600" />
            </div>
            <h3 className="text-xl font-semibold mb-2">Multiple Styles</h3>
            <p className="text-muted-foreground">
              Choose from outline, filled, gradient, and 3D styles to match your design.
            </p>
          </div>
          <div className="text-center p-6">
            <div className="w-14 h-14 mx-auto mb-4 bg-blue-100 dark:bg-blue-900/30 rounded-xl flex items-center justify-center">
              <Users className="w-7 h-7 text-blue-600" />
            </div>
            <h3 className="text-xl font-semibold mb-2">Creator Community</h3>
            <p className="text-muted-foreground">
              Join our community of creators. Share your icons and earn recognition.
            </p>
          </div>
        </div>
      </section>

      {/* Stats Section */}
      <section className="bg-slate-50 dark:bg-slate-900/50 py-16">
        <div className="container px-4 mx-auto">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8 text-center">
            <div>
              <div className="text-4xl font-bold text-blue-600 mb-2">5,000+</div>
              <div className="text-muted-foreground">Free Icons</div>
            </div>
            <div>
              <div className="text-4xl font-bold text-blue-600 mb-2">100+</div>
              <div className="text-muted-foreground">Creators</div>
            </div>
            <div>
              <div className="text-4xl font-bold text-blue-600 mb-2">50k+</div>
              <div className="text-muted-foreground">Downloads</div>
            </div>
            <div>
              <div className="text-4xl font-bold text-blue-600 mb-2">10k+</div>
              <div className="text-muted-foreground">Monthly Users</div>
            </div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="container px-4 py-16 mx-auto text-center">
        <h2 className="text-3xl font-bold mb-4">Ready to get started?</h2>
        <p className="text-muted-foreground mb-8 max-w-xl mx-auto">
          Join thousands of designers and developers who use IconHub for their projects.
          It's free and no attribution required.
        </p>
        <div className="flex gap-4 justify-center">
          <Link
            href="/icons"
            className="px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
          >
            Browse All Icons
          </Link>
          <Link
            href="/categories"
            className="px-6 py-3 border border-input bg-background rounded-lg hover:bg-accent transition-colors"
          >
            View Categories
          </Link>
        </div>
      </section>
    </main>
  );
}
