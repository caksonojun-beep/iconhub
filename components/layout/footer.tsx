import Link from 'next/link';
import { Github, Twitter } from 'lucide-react';

export function Footer() {
  return (
    <footer className="border-t bg-slate-50 dark:bg-slate-900/50">
      <div className="container px-4 py-12 mx-auto">
        <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
          {/* Brand */}
          <div className="col-span-2 md:col-span-1">
            <Link href="/" className="text-xl font-bold text-blue-600">
              IconHub
            </Link>
            <p className="mt-2 text-sm text-muted-foreground">
              Free icons for everyone. No attribution required.
            </p>
          </div>

          {/* Browse */}
          <div>
            <h3 className="font-semibold mb-4">Browse</h3>
            <ul className="space-y-2 text-sm">
              <li>
                <Link href="/icons" className="text-muted-foreground hover:text-foreground">
                  All Icons
                </Link>
              </li>
              <li>
                <Link href="/categories" className="text-muted-foreground hover:text-foreground">
                  Categories
                </Link>
              </li>
              <li>
                <Link href="/icons?style=outline" className="text-muted-foreground hover:text-foreground">
                  Outline Icons
                </Link>
              </li>
              <li>
                <Link href="/icons?style=filled" className="text-muted-foreground hover:text-foreground">
                  Filled Icons
                </Link>
              </li>
            </ul>
          </div>

          {/* Creators */}
          <div>
            <h3 className="font-semibold mb-4">Creators</h3>
            <ul className="space-y-2 text-sm">
              <li>
                <Link href="/creator/register" className="text-muted-foreground hover:text-foreground">
                  Join as Creator
                </Link>
              </li>
              <li>
                <Link href="/creator/dashboard" className="text-muted-foreground hover:text-foreground">
                  Creator Dashboard
                </Link>
              </li>
              <li>
                <Link href="/creator/guidelines" className="text-muted-foreground hover:text-foreground">
                  Submission Guidelines
                </Link>
              </li>
            </ul>
          </div>

          {/* Company */}
          <div>
            <h3 className="font-semibold mb-4">Company</h3>
            <ul className="space-y-2 text-sm">
              <li>
                <Link href="/about" className="text-muted-foreground hover:text-foreground">
                  About
                </Link>
              </li>
              <li>
                <Link href="/contact" className="text-muted-foreground hover:text-foreground">
                  Contact
                </Link>
              </li>
              <li>
                <Link href="/privacy" className="text-muted-foreground hover:text-foreground">
                  Privacy Policy
                </Link>
              </li>
              <li>
                <Link href="/terms" className="text-muted-foreground hover:text-foreground">
                  Terms of Service
                </Link>
              </li>
            </ul>
          </div>
        </div>

        <div className="flex flex-col md:flex-row justify-between items-center mt-8 pt-8 border-t">
          <p className="text-sm text-muted-foreground">
            &copy; {new Date().getFullYear()} IconHub. All rights reserved.
          </p>
          <div className="flex space-x-4 mt-4 md:mt-0">
            <a href="#" className="text-muted-foreground hover:text-foreground">
              <Github className="h-5 w-5" />
            </a>
            <a href="#" className="text-muted-foreground hover:text-foreground">
              <Twitter className="h-5 w-5" />
            </a>
          </div>
        </div>
      </div>
    </footer>
  );
}
