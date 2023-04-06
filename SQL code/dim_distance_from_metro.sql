With distance_from_metroCte
as
(
Select Distinct metro_dist as 'distance_from_metro'
FROM [stg].[fulldataset]
)
Select  ROW_NUMBER() over(order by distance_from_metro)*102 as 'key_distance_from_metroID'
		,distance_from_metro as 'distance_from_metro'
		,(case 
			When distance_from_metro >= 14.0 then 'Approx 14km'
			When distance_from_metro >=9.0 then 'Between 9km and 13km'
			When distance_from_metro >=7.0 then 'Between 7km and 9km'
			When distance_from_metro >=5.0 then 'Between 5km and 7km'
			When distance_from_metro >=1.0 then 'Between 1km and 5km'
			When distance_from_metro <1.0 then 'Less than 1km'
				end) as 'distance_from_metro_text'
From distance_from_metroCte
Order by 1
