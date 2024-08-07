-- Select the 'origin' column and calculate the total number of fans for each origin
SELECT
  origin,
  -- Sum the number of fans for each origin and use COALESCE to handle cases where there might be NULL values (in this case, though, NULL values in 'fans' will be treated as 0)
  COALESCE(SUM(fans), 0) AS nb_fans
FROM
  -- Specify the table from which to retrieve the data
  metal_bands
-- Group the results by the 'origin' column to aggregate the fan counts for each unique origin
GROUP BY
  origin
-- Order the results by the total number of fans in descending order, so the origin with the most fans appears first
ORDER BY
  nb_fans DESC;
