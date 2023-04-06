With distance_from_city_centreCte
as
(
Select Distinct [dist] as 'distance_from_city_centre'
FROM [stg].[fulldataset]
)
Select  ROW_NUMBER() over(order by [distance_from_city_centre]) as 'key_distance_from_city_centreID'
	   ,[distance_from_city_centre] as 'distance_from_city_centre'
	   ,(case 
		When distance_from_city_centre >= 25.0 then 'Approx 25km'
		When distance_from_city_centre >=15.0 then 'Between 15km and 25km'
		When distance_from_city_centre >=10.0 then 'Between 10km and 14km'
		When distance_from_city_centre >=5.0 then 'Between 5km and 9km'
		When distance_from_city_centre >=1.0 then 'Between 1km and 4km'
		When distance_from_city_centre <1.0 then 'Less than 1km'
			end) as 'distance_from_city_centre_text'
From distance_from_city_centreCte
Order by 1
