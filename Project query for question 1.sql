USE all_burl_properties;
#please keep this code, it will not run in mysql workbench without it
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SET SQL_SAFE_UPDATES = 0;

DROP TABLE IF EXISTS streetvalues;
CREATE TABLE streetvalues AS
SELECT propertyaddress.st_name, propertyvalue.total_value 
FROM propertyaddress
INNER JOIN propertyvalue
ON propertyaddress.prop_id = propertyvalue.prop_id;

SELECT st_name, sum(total_value) as sum_val
FROM streetvalues
GROUP BY st_name
ORDER BY sum_val DESC;