/* Crear tabla nativa para recepcion de datos */
create table colombia_dissasters(country text,
unit text,
year bigint,
drought decimal,
flood decimal,
landslide decimal,
storm decimal,
total decimal,
wildfire decimal);

/* Copiar datos de tablas Raw en la tabla nativa */
COPY colombia_dissasters FROM 's3://trabajo1-mariana-laura-juan/Raw/Colombia/Colombia_Climate-related_Disasters_Frequency/part-00000-f2704d6e-c556-437b-9a47-d4aad23311d0-c000.csv'
iam_role 'arn:aws:iam::689653144044:role/LabRole'
DELIMITER ','
IGNOREHEADER 1;

/* consulta general de la tabla nativa */
SELECT *
FROM colombia_dissasters;

/* Transformacion de la tabla nativa para ver el total de desastres en colombia entre 1980 y 2021 discriminado pro tipo de desastre y total*/
SELECT sum(flood) AS total_floods, sum(drought) AS total_droughts, sum(landslide) AS total_landslide, sum(storm) AS total_storm
, sum(wildfire) AS total_wildfire, sum(total) AS total
FROM colombia_dissasters