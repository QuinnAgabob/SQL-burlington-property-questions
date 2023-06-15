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

# this code returns the 5 oldest houses in burlington(after removing the houses built in 0 AD)
SELECT *
FROM streetage
WHERE NOT age = 2023
ORDER BY age DESC;