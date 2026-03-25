-- =============================================
-- Migration: Add Home Page Hero Display Duration
-- Date: 2025-01-25
-- Description: Adds per-image duration (seconds) for homepage hero rotation.
--              When set, each hero image can be displayed for a custom time
--              (e.g. 50 secs, 1 min 20 secs). When NULL, app default (8 seconds) applies.
--
-- Table Modified: event_media
-- Schema Reference: code_html_template/SQLS/Current_Sqls/Latest_Schema_Post__Blob_Claude_12.sql
-- =============================================

-- Add column: total duration in seconds (nullable)
ALTER TABLE public.event_media
ADD COLUMN IF NOT EXISTS home_page_hero_display_duration_seconds int4 NULL;

-- Constraint: 1–600 seconds (1 sec to 10 min) when not null
ALTER TABLE public.event_media
DROP CONSTRAINT IF EXISTS check_home_page_hero_display_duration;

ALTER TABLE public.event_media
ADD CONSTRAINT check_home_page_hero_display_duration
CHECK (
    home_page_hero_display_duration_seconds IS NULL
    OR (
        home_page_hero_display_duration_seconds >= 1
        AND home_page_hero_display_duration_seconds <= 600
    )
);

COMMENT ON COLUMN public.event_media.home_page_hero_display_duration_seconds IS
'Duration in seconds to display this image in the homepage hero slider when is_home_page_hero_image is true. Stored as total seconds (e.g. 50, 80 for 1m20s). NULL = use app default (8 seconds). Valid range: 1–600.';

-- Optional: index for hero queries that filter by this (usually not critical)
-- CREATE INDEX IF NOT EXISTS idx_event_media_hero_duration
-- ON public.event_media(home_page_hero_display_duration_seconds)
-- WHERE is_home_page_hero_image = true AND home_page_hero_display_duration_seconds IS NOT NULL;

-- =============================================
-- Verification
-- =============================================
-- SELECT column_name, data_type, is_nullable, column_default
-- FROM information_schema.columns
-- WHERE table_schema = 'public' AND table_name = 'event_media'
--   AND column_name = 'home_page_hero_display_duration_seconds';
