#please keep this code, it will not run in mysql workbench without it
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SET SQL_SAFE_UPDATES = 0;

DROP TABLE IF EXISTS streetage;
CREATE TABLE streetage AS
SELECT property.year_built, property.prop_id, propertyaddress.st_name, propertyvalue.total_value
FROM ((property
INNER JOIN propertyaddress
ON property.prop_id = propertyaddress.prop_id)
INNER JOIN propertyvalue
ON property.prop_id = propertyvalue.prop_id);

ALTER TABLE streetage
ADD COLUMN age int;

UPDATE streetage
SET age = 2023 - year_built;
ALTER TABLE streetage
ADD COLUMN span int;

UPDATE streetage
SET span = 0
WHERE year_built >= 2000;
UPDATE streetage
SET span = 1
WHERE year_built BETWEEN 1949 AND 2000;
UPDATE streetage
SET span = 2
WHERE year_built BETWEEN 1899 AND 1950;
UPDATE streetage
SET span = 3
WHERE year_built < 1900;

SELECT span, sum(total_value) as sum_val
FROM streetage
GROUP BY span
ORDER BY sum_val DESC;