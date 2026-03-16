# IconHub - Technical Specification

## 1. Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                        FRONTEND                              │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐  │
│  │   Next.js   │  │    React    │  │   Tailwind CSS     │  │
│  │   (App)     │  │   Query     │  │   + shadcn/ui      │  │
│  └─────────────┘  └─────────────┘  └─────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                         API LAYER                            │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐  │
│  │  Next.js    │  │   API       │  │    WebSocket       │  │
│  │  Route      │  │   Routes    │  │    (real-time)     │  │
│  └─────────────┘  └─────────────┘  └─────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                      BACKEND/SERVER                          │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐  │
│  │  Supabase   │  │   Redis     │  │    Cloudinary       │  │
│  │  (Postgres)│  │  (Cache)    │  │  (Image Transform)  │  │
│  └─────────────┘  └─────────────┘  └─────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                       STORAGE                               │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐  │
│  │   R2/S3     │  │   CDN       │  │    Object Storage   │  │
│  │  (Icons)    │  │ (Cloudflare)│  │    (Backups)        │  │
│  └─────────────┘  └─────────────┘  └─────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

---

## 2. Technology Stack

### Frontend
| Technology | Version | Purpose |
|------------|---------|---------|
| Next.js | 14+ | Framework (App Router) |
| React | 18+ | UI Library |
| TypeScript | 5+ | Type safety |
| Tailwind CSS | 3.4+ | Styling |
| shadcn/ui | latest | Component library |
| Framer Motion | 11+ | Animations |
| React Query | 5+ | Data fetching |

### Backend
| Technology | Version | Purpose |
|------------|---------|---------|
| Supabase | Free tier | Database + Auth + Storage |
| Next.js API | - | Server-side logic |
| Upstash Redis | Free tier | Caching & Rate limiting |

### Infrastructure
| Technology | Plan | Purpose |
|------------|------|---------|
| Vercel | Free | Hosting & CDN |
| Cloudflare R2 | Free (10GB) | Object storage |
| Cloudflare | Free | DNS & DDoS protection |
| Resend | Free | Email (transactional) |

---

## 3. Database Schema

### Tables

#### 3.1 users (Creators)
```sql
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  email VARCHAR(255) UNIQUE NOT NULL,
  username VARCHAR(50) UNIQUE NOT NULL,
  display_name VARCHAR(100),
  avatar_url TEXT,
  bio TEXT,
  website VARCHAR(255),
  social_links JSONB DEFAULT '{}',
  role VARCHAR(20) DEFAULT 'creator', -- 'admin', 'creator', 'user'
  is_verified BOOLEAN DEFAULT FALSE,
  total_downloads INTEGER DEFAULT 0,
  total_icons INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
```

#### 3.2 icons
```sql
CREATE TABLE icons (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  creator_id UUID REFERENCES users(id) ON DELETE CASCADE,
  name VARCHAR(100) NOT NULL,
  slug VARCHAR(120) UNIQUE NOT NULL,
  description TEXT,
  svg_content TEXT NOT NULL, -- Original SVG
  preview_url TEXT NOT NULL,
  category_id UUID REFERENCES categories(id),
  style VARCHAR(50) DEFAULT 'outline', -- 'outline', 'filled', 'gradient', '3d'
  tags TEXT[] DEFAULT '{}',
  colors JSONB DEFAULT '["#000000"]',
  is_premium BOOLEAN DEFAULT FALSE,
  is_featured BOOLEAN DEFAULT FALSE,
  view_count INTEGER DEFAULT 0,
  download_count INTEGER DEFAULT 0,
  like_count INTEGER DEFAULT 0,
  status VARCHAR(20) DEFAULT 'active', -- 'active', 'pending', 'rejected'
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Indexes
CREATE INDEX idx_icons_category ON icons(category_id);
CREATE INDEX idx_icons_creator ON icons(creator_id);
CREATE INDEX idx_icons_tags ON icons USING GIN(tags);
CREATE INDEX idx_icons_status ON icons(status);
CREATE INDEX idx_icons_popular ON icons(download_count DESC);
```

#### 3.3 categories
```sql
CREATE TABLE categories (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name VARCHAR(50) NOT NULL,
  slug VARCHAR(50) UNIQUE NOT NULL,
  icon VARCHAR(50), -- Icon name from library
  description TEXT,
  icon_count INTEGER DEFAULT 0,
  parent_id UUID REFERENCES categories(id),
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT NOW()
);
```

#### 3.4 icon_downloads
```sql
CREATE TABLE icon_downloads (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  icon_id UUID REFERENCES icons(id) ON DELETE CASCADE,
  user_id UUID REFERENCES users(id),
  format VARCHAR(20) NOT NULL, -- 'svg', 'png', 'eps'
  size VARCHAR(20), -- For PNG: '16x16', '32x32', etc.
  ip_address VARCHAR(45),
  referrer TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_downloads_icon ON icon_downloads(icon_id);
CREATE INDEX idx_downloads_date ON icon_downloads(created_at);
```

#### 3.5 icon_likes
```sql
CREATE TABLE icon_likes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  icon_id UUID REFERENCES icons(id) ON DELETE CASCADE,
  user_id UUID REFERENCES users(id),
  created_at TIMESTAMP DEFAULT NOW(),
  UNIQUE(icon_id, user_id)
);
```

#### 3.6 collections
```sql
CREATE TABLE collections (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  cover_url TEXT,
  is_public BOOLEAN DEFAULT TRUE,
  icon_count INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
```

#### 3.7 collection_icons
```sql
CREATE TABLE collection_icons (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  collection_id UUID REFERENCES collections(id) ON DELETE CASCADE,
  icon_id UUID REFERENCES icons(id) ON DELETE CASCADE,
  position INTEGER DEFAULT 0,
  added_at TIMESTAMP DEFAULT NOW(),
  UNIQUE(collection_id, icon_id)
);
```

---

## 4. API Endpoints

### Public APIs

#### Icons
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /api/icons | List icons (paginated) |
| GET | /api/icons/[slug] | Get icon detail |
| GET | /api/icons/search | Search icons |
| GET | /api/icons/featured | Get featured icons |
| GET | /api/icons/trending | Get trending icons |

#### Categories
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /api/categories | List all categories |
| GET | /api/categories/[slug] | Get category with icons |

#### Creators
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /api/creators/[username] | Get creator profile |
| GET | /api/creators/[username]/icons | Get creator's icons |

#### Download
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /api/download/[iconId] | Download icon (track stats) |

### Creator APIs (Authenticated)

#### Upload
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | /api/creator/upload | Upload single icon |
| POST | /api/creator/upload/batch | Batch upload (ZIP) |

#### Dashboard
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /api/creator/dashboard | Get creator stats |
| GET | /api/creator/icons | List creator's icons |
| PUT | /api/creator/icons/[id] | Update icon metadata |
| DELETE | /api/creator/icons/[id] | Delete icon |

#### Profile
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /api/creator/profile | Get own profile |
| PUT | /api/creator/profile | Update profile |

---

## 5. File Storage Structure

```
icons/
├── original/
│   └── [creator_id]/
│       └── [icon_slug].svg
├── preview/
│   └── [icon_id]/
│       └── preview.svg
├── png/
│   └── [icon_id]/
│       ├── 16.png
│       ├── 24.png
│       ├── 32.png
│       ├── 64.png
│       ├── 128.png
│       ├── 256.png
│       └── 512.png
└── thumbnails/
    └── [icon_id]/
        └── thumb.jpg
```

---

## 6. Key Features Implementation

### 6.1 SVG Optimization
```typescript
// lib/svg-optimize.ts
import { optimize } from 'svgo';

export async function optimizeSVG(svgContent: string): Promise<string> {
  const result = optimize(svgContent, {
    multipass: true,
    plugins: [
      'preset-default',
      'removeDimensions',
      'removeXMLNS',
      'sortAttrs',
    ],
  });
  return result.data;
}
```

### 6.2 PNG Generation (On-demand)
```typescript
// lib/png-generator.ts
// Using sharp for PNG generation
import sharp from 'sharp';

const SIZES = [16, 24, 32, 64, 128, 256, 512];

export async function generatePNG(svgBuffer: Buffer, size: number): Promise<Buffer> {
  return sharp(svgBuffer)
    .resize(size, size)
    .png()
    .toBuffer();
}
```

### 6.3 Search Implementation
```typescript
// Full-text search using PostgreSQL
// Enable pg_trgm extension for fuzzy search
```

### 6.4 Download Tracking
- Track every download with IP, referrer, format
- Rate limiting: 100 downloads/IP/hour
- Store in separate table for analytics

---

## 7. Performance Optimization

### Caching Strategy
| Data | Cache Duration | Method |
|------|-----------------|--------|
| Homepage icons | 5 min | ISR (Incremental Static Regeneration) |
| Category pages | 10 min | ISR |
| Icon details | 1 hour | ISR |
| Search results | 30 sec | Redis cache |
| Creator stats | 5 min | Redis cache |

### Image Optimization
- Use Cloudflare Images or similar
- Serve WebP/AVIF where supported
- Lazy load with blur placeholder
- CDN for all static assets

### Database Optimization
- Connection pooling via Supabase
- Query pagination (20 items default)
- Indexes on frequently queried columns
- Separate read replicas if needed

---

## 8. Security Measures

### File Upload Security
```typescript
// Allowed file types
const ALLOWED_MIME_TYPES = ['image/svg+xml'];
const MAX_FILE_SIZE = 1024 * 1024; // 1MB

// Validation
- Check file extension (.svg only)
- Validate SVG content (no script tags)
- Virus scan uploaded files
- Sanitize SVG (remove potentially dangerous elements)
```

### Rate Limiting
```typescript
// Per-IP limits
- API calls: 100/minute
- Downloads: 100/hour
- Upload: 10/minute
```

### Authentication
- JWT via Supabase Auth
- Secure password requirements
- 2FA (optional, future)

---

## 9. Environment Variables

```env
# Database (Supabase)
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=

# Storage (Cloudflare R2)
R2_ACCESS_KEY_ID=
R2_SECRET_ACCESS_KEY=
R2_BUCKET_NAME=
R2_PUBLIC_URL=

# Auth
NEXTAUTH_SECRET=
NEXTAUTH_URL=

# Analytics
NEXT_PUBLIC_GA_MEASUREMENT_ID=

# Misc
NEXT_PUBLIC_APP_URL=
```

---

## 10. Deployment

### Vercel (Recommended)
```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
vercel --prod
```

### Environment: Production
- Branch: main
- Auto-deploy: Yes
- Build command: `next build`
- Output directory: `.next`

---

## 11. Monitoring & Analytics

### Metrics to Track
| Metric | Tool | Purpose |
|--------|------|---------|
| Page views | Google Analytics | Traffic |
| User journey | GA4 | Conversion |
| API errors | Sentry | Debugging |
| Uptime | UptimeRobot | Availability |
| Search queries | Custom | Product insights |

### Logs
- API request logs (for debugging)
- Error logs (Sentry)
- Access logs (CDN)

---

## 12. Development Phases

### Phase 1: Foundation (Week 1-2)
- [ ] Setup Next.js project
- [ ] Configure Supabase
- [ ] Create database schema
- [ ] Setup authentication

### Phase 2: Core Features (Week 3-4)
- [ ] Icon upload system
- [ ] Icon listing & search
- [ ] Icon detail page
- [ ] Download functionality

### Phase 3: Creator Features (Week 5-6)
- [ ] Creator dashboard
- [ ] Creator profile
- [ ] Stats & analytics

### Phase 4: Polish (Week 7-8)
- [ ] UI/UX improvements
- [ ] Performance optimization
- [ ] SEO optimization
- [ ] Testing & bug fixes

---

**Document Version:** 1.0
**Last Updated:** 2026-03-16
