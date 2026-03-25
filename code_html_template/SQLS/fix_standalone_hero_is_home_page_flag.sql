-- Fix: Standalone hero images (event_id NULL) must have is_home_page_hero_image = true
-- to be returned by the homepage hero API (isHomePageHeroImage.equals=true).
-- Your INSERT had is_home_page_hero_image = false; run this to fix the two rows.

UPDATE public.event_media
SET
  is_home_page_hero_image = true,
  updated_at = NOW()
WHERE tenant_id = 'tenant_demo_002'
  AND event_id IS NULL
  AND is_hero_image = true
  AND (title = 'eeeeeee' OR file_url LIKE '%hero_image_sample_3_%' OR file_url LIKE '%hero_image_sample_4_%');

-- Verify (optional):
-- SELECT id, tenant_id, title, event_id, is_hero_image, is_home_page_hero_image, file_url
-- FROM public.event_media
-- WHERE tenant_id = 'tenant_demo_002' AND event_id IS NULL;
