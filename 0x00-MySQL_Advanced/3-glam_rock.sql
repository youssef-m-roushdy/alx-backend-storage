-- List all bands with Glam rock as their main style, ranked by their longevity
-- Calculate lifespan; use 2022 if 'split' is NULL, otherwise use 'split' year
SELECT 
    band_name,
    COALESCE(split, 2022) - formed AS lifespan
FROM 
    metal_bands
WHERE 
    style LIKE '%Glam rock%'
ORDER BY 
    lifespan DESC;
