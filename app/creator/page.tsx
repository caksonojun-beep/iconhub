import Link from 'next/link';
import { Navbar } from '@/components/layout/navbar';
import { Footer } from '@/components/layout/footer';
import { Button } from '@/components/ui/button';
import { Upload, BarChart3, Users, DollarSign } from 'lucide-react';

export default function CreatorPage() {
  return (
    <div className="min-h-screen flex flex-col">
      <Navbar />

      <main className="flex-1">
        {/* Hero Section */}
        <div className="bg-gradient-to-b from-blue-50 to-white dark:from-blue-950/20 dark:to-background py-20">
          <div className="container px-4 mx-auto text-center">
            <h1 className="text-5xl font-bold mb-6">
              Share Your Icons,{' '}
              <span className="text-blue-600">Earn Recognition</span>
            </h1>
            <p className="text-xl text-muted-foreground mb-8 max-w-2xl mx-auto">
              Join our community of creators. Upload your icons and get them in front of
              thousands of designers and developers worldwide.
            </p>
            <div className="flex gap-4 justify-center">
              <Link href="/creator/register">
                <Button size="lg" className="bg-blue-600 hover:bg-blue-700">
                  <Upload className="w-5 h-5 mr-2" />
                  Start Creating
                </Button>
              </Link>
              <Link href="/creator/dashboard">
                <Button size="lg" variant="outline">
                  <BarChart3 className="w-5 h-5 mr-2" />
                  Creator Dashboard
                </Button>
              </Link>
            </div>
          </div>
        </div>

        {/* Benefits */}
        <div className="container px-4 mx-auto py-16">
          <h2 className="text-3xl font-bold text-center mb-12">Why Become a Creator?</h2>
          <div className="grid md:grid-cols-3 gap-8">
            <div className="text-center p-8">
              <div className="w-16 h-16 mx-auto mb-6 bg-blue-100 dark:bg-blue-900/30 rounded-2xl flex items-center justify-center">
                <Users className="w-8 h-8 text-blue-600" />
              </div>
              <h3 className="text-xl font-semibold mb-3">Global Audience</h3>
              <p className="text-muted-foreground">
                Your icons will be seen by thousands of designers and developers every day.
              </p>
            </div>
            <div className="text-center p-8">
              <div className="w-16 h-16 mx-auto mb-6 bg-blue-100 dark:bg-blue-900/30 rounded-2xl flex items-center justify-center">
                <BarChart3 className="w-8 h-8 text-blue-600" />
              </div>
              <h3 className="text-xl font-semibold mb-3">Detailed Analytics</h3>
              <p className="text-muted-foreground">
                Track downloads, views, and engagement with our comprehensive dashboard.
              </p>
            </div>
            <div className="text-center p-8">
              <div className="w-16 h-16 mx-auto mb-6 bg-blue-100 dark:bg-blue-900/30 rounded-2xl flex items-center justify-center">
                <DollarSign className="w-8 h-8 text-blue-600" />
              </div>
              <h3 className="text-xl font-semibold mb-3">Earn Rewards</h3>
              <p className="text-muted-foreground">
                Top creators earn badges, featured spots, and future monetization opportunities.
              </p>
            </div>
          </div>
        </div>

        {/* How It Works */}
        <div className="bg-slate-50 dark:bg-slate-900/50 py-16">
          <div className="container px-4 mx-auto">
            <h2 className="text-3xl font-bold text-center mb-12">How It Works</h2>
            <div className="grid md:grid-cols-4 gap-8">
              <div className="text-center">
                <div className="w-12 h-12 mx-auto mb-4 bg-blue-600 text-white rounded-full flex items-center justify-center text-xl font-bold">
                  1
                </div>
                <h3 className="font-semibold mb-2">Sign Up</h3>
                <p className="text-sm text-muted-foreground">
                  Create your free creator account in seconds
                </p>
              </div>
              <div className="text-center">
                <div className="w-12 h-12 mx-auto mb-4 bg-blue-600 text-white rounded-full flex items-center justify-center text-xl font-bold">
                  2
                </div>
                <h3 className="font-semibold mb-2">Upload</h3>
                <p className="text-sm text-muted-foreground">
                  Upload your SVG icons individually or in batches
                </p>
              </div>
              <div className="text-center">
                <div className="w-12 h-12 mx-auto mb-4 bg-blue-600 text-white rounded-full flex items-center justify-center text-xl font-bold">
                  3
                </div>
                <h3 className="font-semibold mb-2">Tag & Categorize</h3>
                <p className="text-sm text-muted-foreground">
                  Add tags and choose categories for discoverability
                </p>
              </div>
              <div className="text-center">
                <div className="w-12 h-12 mx-auto mb-4 bg-blue-600 text-white rounded-full flex items-center justify-center text-xl font-bold">
                  4
                </div>
                <h3 className="font-semibold mb-2">Go Live</h3>
                <p className="text-sm text-muted-foreground">
                  Your icons are instantly available to the world
                </p>
              </div>
            </div>
          </div>
        </div>

        {/* CTA */}
        <div className="container px-4 mx-auto py-16 text-center">
          <h2 className="text-3xl font-bold mb-6">Ready to share your work?</h2>
          <p className="text-muted-foreground mb-8">
            Join 100+ creators who are already sharing their icons on IconHub
          </p>
          <Link href="/creator/register">
            <Button size="lg" className="bg-blue-600 hover:bg-blue-700">
              Become a Creator - It's Free
            </Button>
          </Link>
        </div>
      </main>

      <Footer />
    </div>
  );
}
