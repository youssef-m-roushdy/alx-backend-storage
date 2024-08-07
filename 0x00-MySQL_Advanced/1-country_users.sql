-- Query to get the total number of fans grouped by origin, sorted in descending order
SELECT origin, COALESCE(SUM(fans), 0) AS nb_fans 
FROM metal_bands 
GROUP BY origin 
ORDER BY nb_fans DESC;
