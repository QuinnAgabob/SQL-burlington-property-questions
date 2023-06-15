# What building has the highest property value for each type of building?
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT P.b_type, PA.st_num, PA.st_name, MAX(PV.total_value) as total_value FROM all_burl_properties.property as P
JOIN all_burl_properties.propertyvalue as PV ON P.prop_id = PV.prop_id
JOIN all_burl_properties.propertyaddress as PA ON P.prop_id = PA.prop_id
WHERE P.b_type != "NO BUILDING"
GROUP BY P.b_type
ORDER BY P.b_type;