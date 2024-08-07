SELECT origin, COALESCE(SUM(fans), 0) AS nb_fans
FROM
  metal_bands
GROUP BY
  origin
ORDER BY
  nb_fans DESC;