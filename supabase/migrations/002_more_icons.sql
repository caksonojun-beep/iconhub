-- Insert more sample icons to make the platform look attractive
-- Icons will be distributed across different categories

-- First, check existing icons to avoid duplicates
-- Then insert new icons for various categories

-- User Interface Icons (more)
INSERT INTO public.icons (creator_id, name, slug, description, svg_content, preview_url, category_id, style, tags, colors, status)
VALUES
(NULL, 'Menu', 'menu', 'Hamburger menu icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="4" x2="20" y1="12" y2="12"/><line x1="4" x2="20" y1="6" y2="6"/><line x1="4" x2="20" y1="18" y2="18"/></svg>',
'preview_menu.svg', (SELECT id FROM public.categories WHERE slug = 'user-interface'), 'outline', ARRAY['menu', 'hamburger', 'navigation'], '["#000000"]', 'active'),

(NULL, 'Grid', 'grid', 'Grid layout icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="7" height="7" x="3" y="3" rx="1"/><rect width="7" height="7" x="14" y="3" rx="1"/><rect width="7" height="7" x="14" y="14" rx="1"/><rect width="7" height="7" x="3" y="14" rx="1"/></svg>',
'preview_grid.svg', (SELECT id FROM public.categories WHERE slug = 'user-interface'), 'outline', ARRAY['grid', 'layout', 'apps'], '["#000000"]', 'active'),

(NULL, 'List', 'list', 'List icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="8" x2="21" y1="6" y2="6"/><line x1="8" x2="21" y1="12" y2="12"/><line x1="8" x2="21" y1="18" y2="18"/><line x1="3" x2="3.01" y1="6" y2="6"/><line x1="3" x2="3.01" y1="12" y2="12"/><line x1="3" x2="3.01" y1="18" y2="18"/></svg>',
'preview_list.svg', (SELECT id FROM public.categories WHERE slug = 'user-interface'), 'outline', ARRAY['list', 'menu', 'todo'], '["#000000"]', 'active'),

(NULL, 'Bell', 'bell', 'Notification bell icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 8a6 6 0 0 1 12 0c0 7 3 9 3 9H3s3-2 3-9"/><path d="M10.3 21a1.94 1.94 0 0 0 3.4 0"/></svg>',
'preview_bell.svg', (SELECT id FROM public.categories WHERE slug = 'user-interface'), 'outline', ARRAY['bell', 'notification', 'alert'], '["#000000"]', 'active'),

(NULL, 'Calendar', 'calendar', 'Calendar icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="18" height="18" x="3" y="4" rx="2" ry="2"/><line x1="16" x2="16" y1="2" y2="6"/><line x1="8" x2="8" y1="2" y2="6"/><line x1="3" x2="21" y1="10" y2="10"/></svg>',
'preview_calendar.svg', (SELECT id FROM public.categories WHERE slug = 'user-interface'), 'outline', ARRAY['calendar', 'date', 'schedule'], '["#000000"]', 'active'),

(NULL, 'Clock', 'clock', 'Time clock icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>',
'preview_clock.svg', (SELECT id FROM public.categories WHERE slug = 'user-interface'), 'outline', ARRAY['clock', 'time', 'schedule'], '["#000000"]', 'active'),

(NULL, 'Bookmark', 'bookmark', 'Bookmark icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"/></svg>',
'preview_bookmark.svg', (SELECT id FROM public.categories WHERE slug = 'user-interface'), 'outline', ARRAY['bookmark', 'save', 'favorite'], '["#000000"]', 'active'),

(NULL, 'Folder', 'folder', 'Folder directory icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 20a2 2 0 0 0 2-2V8a2 2 0 0 0-2-2h-7.9a2 2 0 0 1-1.69-.9L9.6 3.9A2 2 0 0 0 7.93 3H4a2 2 0 0 0-2 2v13a2 2 0 0 0 2 2h16Z"/></svg>',
'preview_folder.svg', (SELECT id FROM public.categories WHERE slug = 'user-interface'), 'outline', ARRAY['folder', 'directory', 'file'], '["#000000"]', 'active'),

(NULL, 'File', 'file', 'File document icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7Z"/><path d="M14 2v4a2 2 0 0 0 2 2h4"/></svg>',
'preview_file.svg', (SELECT id FROM public.categories WHERE slug = 'user-interface'), 'outline', ARRAY['file', 'document', 'paper'], '["#000000"]', 'active'),

(NULL, 'Image', 'image', 'Image photo icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="18" height="18" x="3" y="3" rx="2" ry="2"/><circle cx="9" cy="9" r="2"/><path d="m21 15-3.086-3.086a2 2 0 0 0-2.828 0L6 21"/></svg>',
'preview_image.svg', (SELECT id FROM public.categories WHERE slug = 'user-interface'), 'outline', ARRAY['image', 'photo', 'picture'], '["#000000"]', 'active'),

(NULL, 'Camera', 'camera', 'Camera icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14.5 4h-5L7 7H4a2 2 0 0 0-2 2v9a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2h-3l-2.5-3z"/><circle cx="12" cy="13" r="3"/></svg>',
'preview_camera.svg', (SELECT id FROM public.categories WHERE slug = 'user-interface'), 'outline', ARRAY['camera', 'photo', 'capture'], '["#000000"]', 'active'),

(NULL, 'Video', 'video', 'Video camera icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m22 8-6 4 6 4V8Z"/><rect width="14" height="12" x="2" y="6" rx="2" ry="2"/></svg>',
'preview_video.svg', (SELECT id FROM public.categories WHERE slug = 'user-interface'), 'outline', ARRAY['video', 'movie', 'record'], '["#000000"]', 'active'),

(NULL, 'Play', 'play', 'Play button icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="5 3 19 12 5 21 5 3"/></svg>',
'preview_play.svg', (SELECT id FROM public.categories WHERE slug = 'user-interface'), 'outline', ARRAY['play', 'video', 'media'], '["#000000"]', 'active'),

(NULL, 'Pause', 'pause', 'Pause button icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="4" height="16" x="6" y="4"/><rect width="4" height="16" x="14" y="4"/></svg>',
'preview_pause.svg', (SELECT id FROM public.categories WHERE slug = 'user-interface'), 'outline', ARRAY['pause', 'media', 'control'], '["#000000"]', 'active'),

(NULL, 'Volume', 'volume', 'Volume speaker icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="11 5 6 9 2 9 2 15 6 15 11 19 11 5"/><path d="M15.54 8.46a5 5 0 0 1 0 7.07"/><path d="M19.07 4.93a10 10 0 0 1 0 14.14"/></svg>',
'preview_volume.svg', (SELECT id FROM public.categories WHERE slug = 'user-interface'), 'outline', ARRAY['volume', 'sound', 'audio'], '["#000000"]', 'active'),

-- Social Media Icons
(NULL, 'Facebook', 'facebook', 'Facebook social icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"/></svg>',
'preview_facebook.svg', (SELECT id FROM public.categories WHERE slug = 'social-media'), 'outline', ARRAY['facebook', 'social', 'fb'], '["#000000"]', 'active'),

(NULL, 'Twitter', 'twitter', 'Twitter X icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 4s-.7 2.1-2 3.4c1.6 10-9.4 17.3-18 11.6 2.2.1 4.4-.6 6-2C3 15.5.5 9.6 3 5c2.2 2.6 5.6 4.1 9 4-.9-4.2 4-6.6 7-3.8 1.1 0 3-1.2 3-1.2z"/></svg>',
'preview_twitter.svg', (SELECT id FROM public.categories WHERE slug = 'social-media'), 'outline', ARRAY['twitter', 'x', 'social'], '["#000000"]', 'active'),

(NULL, 'Instagram', 'instagram', 'Instagram social icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="20" height="20" x="2" y="2" rx="5" ry="5"/><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"/><line x1="17.5" x2="17.51" y1="6.5" y2="6.5"/></svg>',
'preview_instagram.svg', (SELECT id FROM public.categories WHERE slug = 'social-media'), 'outline', ARRAY['instagram', 'social', 'camera'], '["#000000"]', 'active'),

(NULL, 'LinkedIn', 'linkedin', 'LinkedIn social icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"/><rect width="4" height="12" x="2" y="9"/><circle cx="4" cy="4" r="2"/></svg>',
'preview_linkedin.svg', (SELECT id FROM public.categories WHERE slug = 'social-media'), 'outline', ARRAY['linkedin', 'social', 'work'], '["#000000"]', 'active'),

(NULL, 'Youtube', 'youtube', 'YouTube video icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M2.5 17a24.12 24.12 0 0 1 0-10 2 2 0 0 1 1.4-1.4 49.56 49.56 0 0 1 16.2 0A2 2 0 0 1 21.5 7a24.12 24.12 0 0 1 0 10 2 2 0 0 1-1.4 1.4 49.55 49.55 0 0 1-16.2 0A2 2 0 0 1 2.5 17"/><path d="m10 15 5-3-5-3z"/></svg>',
'preview_youtube.svg', (SELECT id FROM public.categories WHERE slug = 'social-media'), 'outline', ARRAY['youtube', 'video', 'media'], '["#000000"]', 'active'),

(NULL, 'Message Circle', 'message-circle', 'Chat message icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M7.9 20A9 9 0 1 0 4 16.1L2 22Z"/></svg>',
'preview_message_circle.svg', (SELECT id FROM public.categories WHERE slug = 'social-media'), 'outline', ARRAY['message', 'chat', 'comment'], '["#000000"]', 'active'),

(NULL, 'Thumbs Up', 'thumbs-up', 'Thumbs up like icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M7 10v12"/><path d="M15 5.88 14 10h5.83a2 2 0 0 1 1.92 2.56l-2.33 8A2 2 0 0 1 17.5 22H4a2 2 0 0 1-2-2v-8a2 2 0 0 1 2-2h2.76a2 2 0 0 0 1.79-1.11L12 2h0a3.13 3.13 0 0 1 3 3.88Z"/></svg>',
'preview_thumbs_up.svg', (SELECT id FROM public.categories WHERE slug = 'social-media'), 'outline', ARRAY['thumbs up', 'like', 'approve'], '["#000000"]', 'active'),

(NULL, 'Share', 'share', 'Share icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="18" cy="5" r="3"/><circle cx="6" cy="12" r="3"/><circle cx="18" cy="19" r="3"/><line x1="8.59" x2="15.42" y1="13.51" y2="17.49"/><line x1="15.41" x2="8.59" y1="6.51" y2="10.49"/></svg>',
'preview_share.svg', (SELECT id FROM public.categories WHERE slug = 'social-media'), 'outline', ARRAY['share', 'send', 'forward'], '["#000000"]', 'active'),

-- Business Icons
(NULL, 'Briefcase', 'briefcase', 'Business briefcase icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="20" height="14" x="2" y="7" rx="2" ry="2"/><path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"/></svg>',
'preview_briefcase.svg', (SELECT id FROM public.categories WHERE slug = 'business'), 'outline', ARRAY['briefcase', 'business', 'work'], '["#000000"]', 'active'),

(NULL, 'Building', 'building', 'Building office icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="16" height="20" x="4" y="2" rx="2" ry="2"/><path d="M9 22v-4h6v4"/><path d="M8 6h.01"/><path d="M16 6h.01"/><path d="M12 6h.01"/><path d="M12 10h.01"/><path d="M12 14h.01"/><path d="M16 10h.01"/><path d="M16 14h.01"/><path d="M8 10h.01"/><path d="M8 14h.01"/></svg>',
'preview_building.svg', (SELECT id FROM public.categories WHERE slug = 'business'), 'outline', ARRAY['building', 'office', 'company'], '["#000000"]', 'active'),

(NULL, 'Users', 'users', 'Users group icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>',
'preview_users.svg', (SELECT id FROM public.categories WHERE slug = 'business'), 'outline', ARRAY['users', 'team', 'group'], '["#000000"]', 'active'),

(NULL, 'Target', 'target', 'Target goal icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><circle cx="12" cy="12" r="6"/><circle cx="12" cy="12" r="2"/></svg>',
'preview_target.svg', (SELECT id FROM public.categories WHERE slug = 'business'), 'outline', ARRAY['target', 'goal', 'aim'], '["#000000"]', 'active'),

(NULL, 'Trending Up', 'trending-up', 'Trending up growth icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"/><polyline points="17 6 23 6 23 12"/></svg>',
'preview_trending_up.svg', (SELECT id FROM public.categories WHERE slug = 'business'), 'outline', ARRAY['trending', 'growth', 'chart'], '["#000000"]', 'active'),

(NULL, 'Award', 'award', 'Award trophy icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="8" r="6"/><path d="M15.477 12.89 17 22l-5-3-5 3 1.523-9.11"/></svg>',
'preview_award.svg', (SELECT id FROM public.categories WHERE slug = 'business'), 'outline', ARRAY['award', 'trophy', 'prize'], '["#000000"]', 'active'),

-- Finance Icons
(NULL, 'Dollar Sign', 'dollar-sign', 'Dollar money icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" x2="12" y1="2" y2="22"/><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/></svg>',
'preview_dollar.svg', (SELECT id FROM public.categories WHERE slug = 'finance'), 'outline', ARRAY['dollar', 'money', 'currency'], '["#000000"]', 'active'),

(NULL, 'Credit Card', 'credit-card', 'Credit card payment icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="20" height="14" x="2" y="5" rx="2"/><line x1="2" x2="22" y1="10" y2="10"/></svg>',
'preview_credit_card.svg', (SELECT id FROM public.categories WHERE slug = 'finance'), 'outline', ARRAY['credit card', 'payment', 'bank'], '["#000000"]', 'active'),

(NULL, 'Wallet', 'wallet', 'Wallet money icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M19 5H5a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2Z"/><path d="M3 10h18"/><path d="M3 14h6"/></svg>',
'preview_wallet.svg', (SELECT id FROM public.categories WHERE slug = 'finance'), 'outline', ARRAY['wallet', 'money', 'payment'], '["#000000"]', 'active'),

(NULL, 'Pie Chart', 'pie-chart', 'Pie chart analytics icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21.21 15.89A10 10 0 1 1 8 2.83"/><path d="M22 12A10 10 0 0 0 12 2v10z"/></svg>',
'preview_pie_chart.svg', (SELECT id FROM public.categories WHERE slug = 'finance'), 'outline', ARRAY['pie chart', 'analytics', 'stats'], '["#000000"]', 'active'),

(NULL, 'Bar Chart', 'bar-chart', 'Bar chart icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" x2="12" y1="20" y2="10"/><line x1="18" x2="18" y1="20" y2="4"/><line x1="6" x2="6" y1="20" y2="16"/></svg>',
'preview_bar_chart.svg', (SELECT id FROM public.categories WHERE slug = 'finance'), 'outline', ARRAY['bar chart', 'graph', 'stats'], '["#000000"]', 'active'),

-- Technology Icons
(NULL, 'Laptop', 'laptop', 'Laptop computer icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="18" height="12" x="3" y="4" rx="2" ry="2"/><line x1="2" x2="22" y1="20" y2="20"/></svg>',
'preview_laptop.svg', (SELECT id FROM public.categories WHERE slug = 'technology'), 'outline', ARRAY['laptop', 'computer', 'tech'], '["#000000"]', 'active'),

(NULL, 'Smartphone', 'smartphone', 'Mobile phone icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="14" height="20" x="5" y="2" rx="2" ry="2"/><path d="M12 18h.01"/></svg>',
'preview_smartphone.svg', (SELECT id FROM public.categories WHERE slug = 'technology'), 'outline', ARRAY['smartphone', 'mobile', 'phone'], '["#000000"]', 'active'),

(NULL, 'Wifi', 'wifi', 'Wifi internet icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12.55a11 11 0 0 1 14.08 0"/><path d="M1.42 9a16 16 0 0 1 21.16 0"/><path d="M8.53 16.11a6 6 0 0 1 6.95 0"/><line x1="12" x2="12.01" y1="20" y2="20"/></svg>',
'preview_wifi.svg', (SELECT id FROM public.categories WHERE slug = 'technology'), 'outline', ARRAY['wifi', 'internet', 'wireless'], '["#000000"]', 'active'),

(NULL, 'Bluetooth', 'bluetooth', 'Bluetooth icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6.5 6.5 17.5 17.5"/><path d="M17.5 6.5 6.5 17.5"/></svg>',
'preview_bluetooth.svg', (SELECT id FROM public.categories WHERE slug = 'technology'), 'outline', ARRAY['bluetooth', 'wireless', 'tech'], '["#000000"]', 'active'),

(NULL, 'Cloud', 'cloud', 'Cloud computing icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17.5 19H9a7 7 0 1 1 6.71-9h1.79a4.5 4.5 0 1 1 0 9Z"/></svg>',
'preview_cloud.svg', (SELECT id FROM public.categories WHERE slug = 'technology'), 'outline', ARRAY['cloud', 'cloud computing', 'storage'], '["#000000"]', 'active'),

(NULL, 'Database', 'database', 'Database icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><ellipse cx="12" cy="5" rx="9" ry="3"/><path d="M21 12c0 1.66-4 3-9 3s-9-1.34-9-3"/><path d="M3 5v14c0 1.66 4 3 9 3s9-1.34 9-3V5"/></svg>',
'preview_database.svg', (SELECT id FROM public.categories WHERE slug = 'technology'), 'outline', ARRAY['database', 'storage', 'data'], '["#000000"]', 'active'),

(NULL, 'Code', 'code', 'Code programming icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg>',
'preview_code.svg', (SELECT id FROM public.categories WHERE slug = 'technology'), 'outline', ARRAY['code', 'programming', 'developer'], '["#000000"]', 'active'),

(NULL, 'Terminal', 'terminal', 'Terminal command icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="4 17 10 11 4 5"/><line x1="12" x2="20" y1="19" y2="19"/></svg>',
'preview_terminal.svg', (SELECT id FROM public.categories WHERE slug = 'technology'), 'outline', ARRAY['terminal', 'command', 'console'], '["#000000"]', 'active'),

(NULL, 'Lock', 'lock', 'Lock security icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="18" height="11" x="3" y="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>',
'preview_lock.svg', (SELECT id FROM public.categories WHERE slug = 'technology'), 'outline', ARRAY['lock', 'security', 'password'], '["#000000"]', 'active'),

(NULL, 'Unlock', 'unlock', 'Unlock icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="18" height="11" x="3" y="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 9.9-1"/></svg>',
'preview_unlock.svg', (SELECT id FROM public.categories WHERE slug = 'technology'), 'outline', ARRAY['unlock', 'security', 'open'], '["#000000"]', 'active'),

-- Communication Icons
(NULL, 'Phone', 'phone', 'Phone call icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/></svg>',
'preview_phone.svg', (SELECT id FROM public.categories WHERE slug = 'communication'), 'outline', ARRAY['phone', 'call', 'contact'], '["#000000"]', 'active'),

(NULL, 'Send', 'send', 'Send message icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="22" x2="11" y1="2" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg>',
'preview_send.svg', (SELECT id FROM public.categories WHERE slug = 'communication'), 'outline', ARRAY['send', 'message', 'telegram'], '["#000000"]', 'active'),

(NULL, 'Mail', 'mail', 'Email mail icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="20" height="16" x="2" y="4" rx="2"/><path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/></svg>',
'preview_mail.svg', (SELECT id FROM public.categories WHERE slug = 'communication'), 'outline', ARRAY['mail', 'email', 'inbox'], '["#000000"]', 'active'),

(NULL, 'Map Pin', 'map-pin', 'Location map pin icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"/><circle cx="12" cy="10" r="3"/></svg>',
'preview_map_pin.svg', (SELECT id FROM public.categories WHERE slug = 'travel'), 'outline', ARRAY['map pin', 'location', 'marker'], '["#000000"]', 'active'),

-- E-commerce Icons
(NULL, 'Shopping Cart', 'shopping-cart', 'Shopping cart icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="8" cy="21" r="1"/><circle cx="19" cy="21" r="1"/><path d="M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12"/></svg>',
'preview_shopping_cart.svg', (SELECT id FROM public.categories WHERE slug = 'e-commerce'), 'outline', ARRAY['shopping cart', 'cart', 'buy'], '["#000000"]', 'active'),

(NULL, 'Tag', 'tag', 'Price tag icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12.586 2.586A2 2 0 0 0 11.172 2H4a2 2 0 0 0-2 2v7.172a2 2 0 0 0 .586 1.414l8.704 8.704a2.426 2.426 0 0 0 3.42 0l6.58-6.58a2.426 2.426 0 0 0 0-3.42z"/><circle cx="7.5" cy="7.5" r=".5" fill="currentColor"/></svg>',
'preview_tag.svg', (SELECT id FROM public.categories WHERE slug = 'e-commerce'), 'outline', ARRAY['tag', 'price', 'label'], '["#000000"]', 'active'),

(NULL, 'Package', 'package', 'Package box icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m16.5 9.4-9-5.19"/><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/><polyline points="3.29 7 12 12 20.71 7"/><line x1="12" x2="12" y1="22" y2="12"/></svg>',
'preview_package.svg', (SELECT id FROM public.categories WHERE slug = 'e-commerce'), 'outline', ARRAY['package', 'box', 'shipping'], '["#000000"]', 'active'),

-- Arrows Icons
(NULL, 'Arrow Up', 'arrow-up', 'Arrow up icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m5 12 7-7 7 7"/><path d="M12 19V5"/></svg>',
'preview_arrow_up.svg', (SELECT id FROM public.categories WHERE slug = 'arrows-direction'), 'outline', ARRAY['arrow up', 'up', 'upload'], '["#000000"]', 'active'),

(NULL, 'Arrow Down', 'arrow-down', 'Arrow down icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 5v14"/><path d="m19 12-7 7-7-7"/></svg>',
'preview_arrow_down.svg', (SELECT id FROM public.categories WHERE slug = 'arrows-direction'), 'outline', ARRAY['arrow down', 'down', 'download'], '["#000000"]', 'active'),

(NULL, 'Arrow Left', 'arrow-left', 'Arrow left icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m12 19-7-7 7-7"/><path d="M19 12H5"/></svg>',
'preview_arrow_left.svg', (SELECT id FROM public.categories WHERE slug = 'arrows-direction'), 'outline', ARRAY['arrow left', 'left', 'back'], '["#000000"]', 'active'),

(NULL, 'Arrow Right', 'arrow-right', 'Arrow right icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14"/><path d="m12 5 7 7-7 7"/></svg>',
'preview_arrow_right.svg', (SELECT id FROM public.categories WHERE slug = 'arrows-direction'), 'outline', ARRAY['arrow right', 'right', 'next'], '["#000000"]', 'active'),

(NULL, 'Chevron Up', 'chevron-up', 'Chevron up icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m18 15-6-6-6 6"/></svg>',
'preview_chevron_up.svg', (SELECT id FROM public.categories WHERE slug = 'arrows-direction'), 'outline', ARRAY['chevron up', 'expand', 'collapse'], '["#000000"]', 'active'),

(NULL, 'Chevron Down', 'chevron-down', 'Chevron down icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m6 9 6 6 6-6"/></svg>',
'preview_chevron_down.svg', (SELECT id FROM public.categories WHERE slug = 'arrows-direction'), 'outline', ARRAY['chevron down', 'dropdown', 'expand'], '["#000000"]', 'active'),

(NULL, 'Refresh', 'refresh', 'Refresh reload icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 12a9 9 0 0 1 9-9 9.75 9.75 0 0 1 6.74 2.74L21 8"/><path d="M21 3v5h-5"/><path d="M21 12a9 9 0 0 1-9 9 9.75 9.75 0 0 1-6.74-2.74L3 16"/><path d="M8 16H3v5"/></svg>',
'preview_refresh.svg', (SELECT id FROM public.categories WHERE slug = 'arrows-direction'), 'outline', ARRAY['refresh', 'reload', 'sync'], '["#000000"]', 'active'),

(NULL, 'External Link', 'external-link', 'External link icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 3h6v6"/><path d="M10 14 21 3"/><path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"/></svg>',
'preview_external_link.svg', (SELECT id FROM public.categories WHERE slug = 'arrows-direction'), 'outline', ARRAY['external link', 'open', 'link'], '["#000000"]', 'active'),

(NULL, 'Check', 'check', 'Check mark icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>',
'preview_check.svg', (SELECT id FROM public.categories WHERE slug = 'user-interface'), 'outline', ARRAY['check', 'done', 'complete'], '["#000000"]', 'active'),

(NULL, 'X Close', 'x', 'Close X icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 6 6 18"/><path d="m6 6 12 12"/></svg>',
'preview_x.svg', (SELECT id FROM public.categories WHERE slug = 'user-interface'), 'outline', ARRAY['x', 'close', 'cancel'], '["#000000"]', 'active'),

(NULL, 'Plus', 'plus', 'Plus add icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14"/><path d="M12 5v14"/></svg>',
'preview_plus.svg', (SELECT id FROM public.categories WHERE slug = 'user-interface'), 'outline', ARRAY['plus', 'add', 'create'], '["#000000"]', 'active'),

(NULL, 'Minus', 'minus', 'Minus remove icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14"/></svg>',
'preview_minus.svg', (SELECT id FROM public.categories WHERE slug = 'user-interface'), 'outline', ARRAY['minus', 'remove', 'subtract'], '["#000000"]', 'active'),

(NULL, 'Filter', 'filter', 'Filter icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3"/></svg>',
'preview_filter.svg', (SELECT id FROM public.categories WHERE slug = 'user-interface'), 'outline', ARRAY['filter', 'sort', 'funnel'], '["#000000"]', 'active'),

(NULL, 'Sort Asc', 'sort-asc', 'Sort ascending icon',
'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m3 8 4-4 4 4"/><path d="M7 4v16"/><path d="M11 12h4"/><path d="M11 16h7"/><path d="M11 20h10"/></svg>',
'preview_sort_asc.svg', (SELECT id FROM public.categories WHERE slug = 'user-interface'), 'outline', ARRAY['sort', 'order', 'ascending'], '["#000000"]', 'active');

-- Update category counts
UPDATE public.categories SET icon_count = (
  SELECT COUNT(*) FROM public.icons WHERE category_id = public.categories.id
);
