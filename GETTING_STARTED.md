# IconHub - Getting Started

## Quick Start

```bash
# 1. Clone project
git clone https://github.com/your-username/iconhub.git
cd iconhub

# 2. Install dependencies
npm install

# 3. Setup environment
cp .env.example .env.local

# 4. Run database migrations (Supabase)
# Run SQL scripts in /supabase/migrations/

# 5. Run development server
npm run dev
```

## Project Structure

```
iconhub/
├── app/                    # Next.js App Router
│   ├── (public)/         # Public pages
│   │   ├── page.tsx     # Homepage
│   │   ├── icons/       # Icon pages
│   │   └── categories/  # Category pages
│   ├── creator/         # Creator dashboard
│   │   ├── dashboard/
│   │   ├── upload/
│   │   └── profile/
│   ├── api/             # API routes
│   │   ├── icons/
│   │   ├── upload/
│   │   └── download/
│   ├── layout.tsx
│   └── globals.css
├── components/
│   ├── ui/              # shadcn components
│   ├── icons/           # Icon-specific components
│   └── layout/          # Layout components
├── lib/
│   ├── supabase.ts      # Supabase client
│   ├── utils.ts
│   └── icon-utils.ts    # Icon processing
├── supabase/
│   └── migrations/      # Database migrations
├── public/
│   └── images/
├── .env.example
├── next.config.js
├── tailwind.config.ts
└── package.json
```

## Tech Stack Summary

| Layer | Technology |
|-------|------------|
| Framework | Next.js 14 |
| Language | TypeScript |
| Styling | Tailwind CSS + shadcn/ui |
| Database | Supabase (PostgreSQL) |
| Auth | Supabase Auth |
| Storage | Cloudflare R2 |
| Hosting | Vercel |

## Key Files

| File | Purpose |
|------|---------|
| [app/page.tsx](app/page.tsx) | Homepage |
| [app/icons/[slug]/page.tsx](app/icons/[slug]/page.tsx) | Icon detail |
| [app/creator/dashboard/page.tsx](app/creator/dashboard/page.tsx) | Creator dashboard |
| [lib/supabase.ts](lib/supabase.ts) | Database client |
| [lib/icon-utils.ts](lib/icon-utils.ts) | Icon processing |

## Database

Run the migrations in `supabase/migrations/` to set up tables:
- users
- icons
- categories
- icon_downloads
- icon_likes
- collections

## Environment Variables

```env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_service_role_key
R2_ACCESS_KEY_ID=your_r2_access_key
R2_SECRET_ACCESS_KEY=your_r2_secret
R2_BUCKET_NAME=icons
NEXT_PUBLIC_APP_URL=http://localhost:3000
```

## Commands

```bash
npm run dev          # Development
npm run build        # Production build
npm run start        # Start production
npm run lint         # Lint code
```

---

**Status:** Ready to start development
**Next Step:** Run setup commands above
