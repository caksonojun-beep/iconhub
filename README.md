# IconHub

A free, open-source icon platform for designers and developers. Built with Next.js, Supabase, and Tailwind CSS.

## Features

- **Browse & Search** - Discover thousands of free icons
- **Multiple Formats** - Download SVG and PNG
- **Creator Dashboard** - Upload and manage your icons
- **Categories** - Browse icons by category
- **Free** - No attribution required

## Tech Stack

- **Framework**: Next.js 14 (App Router)
- **Language**: TypeScript
- **Styling**: Tailwind CSS + shadcn/ui
- **Database**: Supabase (PostgreSQL)
- **Auth**: Supabase Auth
- **Storage**: Cloudflare R2

## Getting Started

### Prerequisites

- Node.js 18+
- npm or yarn
- Supabase account
- Cloudflare account (for R2 storage)

### Installation

```bash
# Clone the repository
git clone https://github.com/your-username/iconhub.git
cd iconhub

# Install dependencies
npm install

# Copy environment variables
cp .env.example .env.local

# Edit .env.local with your credentials

# Run the development server
npm run dev
```

### Database Setup

1. Create a new Supabase project
2. Run the SQL migrations in `supabase/migrations/001_initial_schema.sql`
3. Configure your environment variables

### Environment Variables

```env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_service_role_key
R2_ACCESS_KEY_ID=your_r2_access_key
R2_SECRET_ACCESS_KEY=your_r2_secret
R2_BUCKET_NAME=icons
NEXT_PUBLIC_APP_URL=http://localhost:3000
```

## Project Structure

```
iconhub/
├── app/                    # Next.js App Router
│   ├── icons/             # Icon browse & detail pages
│   ├── categories/        # Category pages
│   ├── creator/           # Creator dashboard & auth
│   └── api/               # API routes
├── components/            # React components
│   ├── ui/               # shadcn components
│   └── layout/           # Layout components
├── lib/                   # Utilities
├── supabase/             # Database migrations
└── public/               # Static assets
```

## Roadmap

See [ROADMAP.md](ROADMAP.md) for the full development plan.

## Contributing

Contributions are welcome! Please read our contributing guidelines before submitting PRs.

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with ❤️ by the IconHub team
