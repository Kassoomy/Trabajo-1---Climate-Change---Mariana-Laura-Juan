/* Consultas tablas de Medellin */

SELECT COUNT(fecha) FROM "trabajo-1-mlj"."medellin"; -- Tabla General 

SELECT DISTINCT(calidad) FROM "trabajo-1-mlj"."medellin"; -- tipos de calidad presentes en la tabla

SELECT AVG(valor) AS Avg_Val FROM "trabajo-1-mlj"."medellin" -- Promedio de temperatura medida con calidad 1.0 
WHERE 1 = 1 
AND calidad = 1.0

SELECT calidad, AVG(valor) FROM "trabajo-1-mlj"."medellin" --  Promedio de temperatura medido por calidad 
GROUP BY calidad

/* Join de datos Colombia para pasar de Raw a Trusted */

SELECT col_temp.year, "col_temp"."temp change" , col_diss.wildfire, col_diss.drought, 
col_diss.flood, col_diss.storm, col_diss.landslide, col_diss.total
FROM colombia_annual_surface_temperature_change AS col_temp
JOIN colombia_climate_related_disasters_frequency AS col_diss ON col_temp.year=col_diss.year;
