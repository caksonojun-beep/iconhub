-- IconHub Database Schema
-- Run this in Supabase SQL Editor

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Users table (extends Supabase auth.users)
CREATE TABLE public.profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  username VARCHAR(50) UNIQUE NOT NULL,
  display_name VARCHAR(100),
  avatar_url TEXT,
  bio TEXT,
  website VARCHAR(255),
  social_links JSONB DEFAULT '{}',
  role VARCHAR(20) DEFAULT 'creator',
  is_verified BOOLEAN DEFAULT FALSE,
  total_downloads INTEGER DEFAULT 0,
  total_icons INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes for profiles
CREATE INDEX idx_profiles_username ON public.profiles(username);
CREATE INDEX idx_profiles_role ON public.profiles(role);

-- Categories table
CREATE TABLE public.categories (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name VARCHAR(50) NOT NULL,
  slug VARCHAR(50) UNIQUE NOT NULL,
  icon VARCHAR(50),
  description TEXT,
  icon_count INTEGER DEFAULT 0,
  parent_id UUID REFERENCES categories(id),
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Icons table
CREATE TABLE public.icons (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  creator_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  name VARCHAR(100) NOT NULL,
  slug VARCHAR(120) UNIQUE NOT NULL,
  description TEXT,
  svg_content TEXT NOT NULL,
  preview_url TEXT NOT NULL,
  category_id UUID REFERENCES public.categories(id),
  style VARCHAR(50) DEFAULT 'outline',
  tags TEXT[] DEFAULT '{}',
  colors JSONB DEFAULT '["#000000"]',
  is_premium BOOLEAN DEFAULT FALSE,
  is_featured BOOLEAN DEFAULT FALSE,
  view_count INTEGER DEFAULT 0,
  download_count INTEGER DEFAULT 0,
  like_count INTEGER DEFAULT 0,
  status VARCHAR(20) DEFAULT 'active',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Indexes for icons
CREATE INDEX idx_icons_category ON public.icons(category_id);
CREATE INDEX idx_icons_creator ON public.icons(creator_id);
CREATE INDEX idx_icons_tags ON public.icons USING GIN(tags);
CREATE INDEX idx_icons_status ON public.icons(status);
CREATE INDEX idx_icons_popular ON public.icons(download_count DESC);
CREATE INDEX idx_icons_created ON public.icons(created_at DESC);

-- Icon downloads table
CREATE TABLE public.icon_downloads (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  icon_id UUID REFERENCES public.icons(id) ON DELETE CASCADE,
  user_id UUID REFERENCES public.profiles(id),
  format VARCHAR(20) NOT NULL,
  size VARCHAR(20),
  ip_address VARCHAR(45),
  referrer TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_downloads_icon ON public.icon_downloads(icon_id);
CREATE INDEX idx_downloads_date ON public.icon_downloads(created_at);

-- Icon likes table
CREATE TABLE public.icon_likes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  icon_id UUID REFERENCES public.icons(id) ON DELETE CASCADE,
  user_id UUID REFERENCES public.profiles(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(icon_id, user_id)
);

-- Collections table
CREATE TABLE public.collections (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  cover_url TEXT,
  is_public BOOLEAN DEFAULT TRUE,
  icon_count INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Collection icons junction table
CREATE TABLE public.collection_icons (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  collection_id UUID REFERENCES public.collections(id) ON DELETE CASCADE,
  icon_id UUID REFERENCES public.icons(id) ON DELETE CASCADE,
  position INTEGER DEFAULT 0,
  added_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(collection_id, icon_id)
);

-- Trigger function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ language 'plpgsql';

-- Add triggers for updated_at
CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON public.profiles
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_icons_updated_at BEFORE UPDATE ON public.icons
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_collections_updated_at BEFORE UPDATE ON public.collections
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Insert default categories
INSERT INTO public.categories (name, slug, icon, sort_order) VALUES
  ('User Interface', 'user-interface', 'layout', 1),
  ('Social Media', 'social-media', 'share-2', 2),
  ('Business', 'business', 'briefcase', 3),
  ('Finance', 'finance', 'dollar-sign', 4),
  ('E-commerce', 'e-commerce', 'shopping-cart', 5),
  ('Communication', 'communication', 'message-circle', 6),
  ('Travel', 'travel', 'map-pin', 7),
  ('Food & Drink', 'food-drink', 'coffee', 8),
  ('Health & Fitness', 'health-fitness', 'heart', 9),
  ('Technology', 'technology', 'cpu', 10),
  ('Weather', 'weather', 'cloud', 11),
  ('Arrows & Direction', 'arrows-direction', 'arrow-up', 12);

-- Enable Row Level Security
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.icons ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.icon_downloads ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.icon_likes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.collections ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.collection_icons ENABLE ROW LEVEL SECURITY;

-- RLS Policies for profiles
CREATE POLICY "Public profiles are viewable by everyone" ON public.profiles
  FOR SELECT USING (true);

CREATE POLICY "Users can update own profile" ON public.profiles
  FOR UPDATE USING (auth.uid() = id);

-- RLS Policies for icons
CREATE POLICY "Active icons are viewable by everyone" ON public.icons
  FOR SELECT USING (status = 'active');

CREATE POLICY "Creators can insert own icons" ON public.icons
  FOR INSERT WITH CHECK (creator_id = auth.uid());

CREATE POLICY "Creators can update own icons" ON public.icons
  FOR UPDATE USING (creator_id = auth.uid());

CREATE POLICY "Creators can delete own icons" ON public.icons
  FOR DELETE USING (creator_id = auth.uid());

-- RLS Policies for categories
CREATE POLICY "Categories are viewable by everyone" ON public.categories
  FOR SELECT USING (true);

-- RLS Policies for collections
CREATE POLICY "Public collections are viewable by everyone" ON public.collections
  FOR SELECT USING (is_public = true);

CREATE POLICY "Users can manage own collections" ON public.collections
  FOR ALL USING (user_id = auth.uid());
