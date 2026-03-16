import type { Metadata } from 'next';
import { Inter } from 'next/font/google';
import './globals.css';
import { cn } from '@/lib/utils';

const inter = Inter({ subsets: ['latin'] });

export const metadata: Metadata = {
  title: 'IconHub - Free Icons for Everyone',
  description: 'Download free SVG icons in outline, filled, and more styles. Perfect for designers and developers.',
  keywords: ['icons', 'free icons', 'svg icons', 'icon library', 'download icons'],
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={cn(inter.className, 'min-h-screen bg-background antialiased')}>
        {children}
      </body>
    </html>
  );
}
