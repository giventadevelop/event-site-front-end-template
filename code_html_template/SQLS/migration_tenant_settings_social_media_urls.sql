-- Migration: Add social media URL columns to tenant_settings for "Follow our journey" section
-- Full list: Facebook, Instagram, X (Twitter), LinkedIn, YouTube, TikTok (all varchar(1024) NULL).
-- Run this on existing databases that were created before these columns were added to the schema.
-- New installs using Latest_Schema_Post__Blob_Claude_12.sql already include these columns in CREATE TABLE.

ALTER TABLE public.tenant_settings
  ADD COLUMN IF NOT EXISTS facebook_url varchar(1024) NULL,
  ADD COLUMN IF NOT EXISTS instagram_url varchar(1024) NULL,
  ADD COLUMN IF NOT EXISTS twitter_url varchar(1024) NULL,
  ADD COLUMN IF NOT EXISTS linkedin_url varchar(1024) NULL,
  ADD COLUMN IF NOT EXISTS youtube_url varchar(1024) NULL,
  ADD COLUMN IF NOT EXISTS tiktok_url varchar(1024) NULL;

COMMENT ON COLUMN public.tenant_settings.facebook_url IS 'Organization Facebook profile or page URL for Follow our journey section';
COMMENT ON COLUMN public.tenant_settings.instagram_url IS 'Organization Instagram profile URL for Follow our journey section';
COMMENT ON COLUMN public.tenant_settings.twitter_url IS 'Organization X (Twitter) profile URL for Follow our journey section';
COMMENT ON COLUMN public.tenant_settings.linkedin_url IS 'Organization LinkedIn profile or company page URL for Follow our journey section';
COMMENT ON COLUMN public.tenant_settings.youtube_url IS 'Organization YouTube channel URL for Follow our journey section';
COMMENT ON COLUMN public.tenant_settings.tiktok_url IS 'Organization TikTok profile URL for Follow our journey section';
