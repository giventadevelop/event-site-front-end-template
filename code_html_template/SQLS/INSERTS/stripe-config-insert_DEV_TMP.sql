-- ===================================================================
-- Stripe Payment Provider Configuration INSERT Statement
-- Generated: 2025-11-30 20:43:37
-- Tenant ID: tenant_demo_002
-- ===================================================================
--
-- Instructions:
-- 1. Review the INSERT statement below
-- 2. Execute it in your database tool (pgAdmin, DBeaver, psql, etc.)
-- 3. Verify the configuration was inserted correctly
--
-- ===================================================================

-- Check if configuration already exists and delete if present
DELETE FROM payment_provider_config
WHERE tenant_id = 'tenant_demo_002'
  AND provider_name = 'STRIPE';

-- Insert new configuration
INSERT INTO payment_provider_config (
    tenant_id,
    provider_name,
    payment_use_case,
    is_active,
    supports_acp,
    supports_zeffy,
    supports_zelle,
    supports_revolut,
    provider_api_key_encrypted,
    provider_secret_key_encrypted,
    webhook_secret_encrypted,
    publishable_key,
    payment_method_domain_id,
    fallback_order,
    configuration_json,
    created_at,
    updated_at
) VALUES (
             'tenant_demo_002',                    -- tenant_id
             'STRIPE',                -- provider_name
             NULL,                           -- payment_use_case (NULL = all use cases)
             true,                      -- is_active
             false,                   -- supports_acp
             false,                 -- supports_zeffy
             false,                 -- supports_zelle
             false,               -- supports_revolut
             NULL,                           -- provider_api_key_encrypted (not used for Stripe)
             'HkEKaSSud4Z4GVrbkrcVi+we/MoghoxEckEs/aQ3yZE2vSLxcyXkGZIoNFmf6VPfaowY9MRlPLUla5lX99k/Nq8GuvVuITuxZymfRk+2jiy8RMjMAAr7EjLRH8IjBX26bs84sx63os5igsD9OYU/lAQ0EAt0ShwdoQEEp5w8yJnJIc605ZsB',          -- provider_secret_key_encrypted
             'o1wcxuWu4y1b/zYsXKfPda5s+zaS0NQJsD07ZIDVSbkFJu/1qnPmqi17gWXm8Pb+oQ9wVUJA3xYRqQ5iQS3t4ZR9',      -- webhook_secret_encrypted
             'pk_test_51JoBNqK5BrggeAHMxgJ7OBl3MKNlJMG0fuxwwsqk6bXldsQKyUlP283EUgICwcd57D9GUSAUfRPa06GD7xcXqqyH00tc3RDr97',              -- publishable_key
             'pmd_1SWrMSK5BrggeAHMmHxUd9F2',      -- payment_method_domain_id
             0,                 -- fallback_order
             NULL,                           -- configuration_json
             NOW(),                          -- created_at
             NOW()                           -- updated_at
         );

-- Verify the insertion
SELECT
    id,
    tenant_id,
    provider_name,
    is_active,
    publishable_key,
    created_at,
    updated_at
FROM payment_provider_config
WHERE tenant_id = 'tenant_demo_002'
  AND provider_name = 'STRIPE';
