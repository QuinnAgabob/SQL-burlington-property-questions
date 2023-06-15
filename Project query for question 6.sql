# Properties from which decades have the highest average property values?
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT floor(P.year_built/10) * 10 as decade_built, ROUND(AVG(total_value), 2) as average_value FROM all_burl_properties.property as P
JOIN all_burl_properties.propertyvalue as PV ON P.prop_id = PV.prop_id
WHERE P.b_type != "NO BUILDING"
GROUP BY decade_built
ORDER BY average_value DESC;