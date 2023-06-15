# In what decade were the most valuable (at present value) properties built? 
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT floor(P.year_built/10) * 10 as decade_built, PA.st_num, PA.st_name, total_value FROM all_burl_properties.property as P
JOIN all_burl_properties.propertyvalue as PV ON P.prop_id = PV.prop_id
JOIN all_burl_properties.propertyaddress as PA ON P.prop_id = PA.prop_id
WHERE P.b_type != "NO BUILDING"
ORDER BY PV.total_value DESC
LIMIT 30;