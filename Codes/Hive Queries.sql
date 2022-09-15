/* Tabla general frecuancia de desastres globales */
SELECT * FROM `trabajo-1-mlj`.global_climate_related_disasters_frequency_csv;

/* Consulta de desastre en 2001, 2002 y su suma discriminado por desastre y total  */
SELECT country, indicator, f2001, f2002, sum(f2001 + f2002) AS Total FROM `trabajo-1-mlj`.global_climate_related_disasters_frequency_csv
WHERE 1=1 
AND country = 'Argentina'
GROUP BY country, indicator, f2001, f2002