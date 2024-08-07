-- List all bands with Glam rock as their main style, ranked by their longevity
-- Calculate lifespan; use 2022 if 'split' is NULL, otherwise use 'split' year
SELECT 
    band_name,
    CASE 
        WHEN split IS NULL THEN 2022 - formed
        ELSE split - formed
    END AS lifespan
FROM 
    metal_bands
WHERE 
    style = 'Glam rock'
ORDER BY 
    lifespan DESC;
