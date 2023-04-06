Create or alter view vw.fulldataset
as
SELECT [european_city]
	  ,'Weekday' as 'weekday_or_weekend'
	  ,[lng] as 'Longtitude'
      ,[lat] as 'Latitude'
	  ,[room_type] as 'Type of Room'
	  ,[bedrooms] as 'Number of Bedrooms'
      ,[person_capacity] as 'Capacity'
      ,[host_is_superhost] as 'Superhost or Not'
      ,[multi] as 'Multiple Rooms or Not'
      ,[biz] as 'Business purpose or Not'
	  ,(case 
		When [dist] >= 25.0 then 'Approx 25km'
		When [dist] >=15.0 then 'Between 15km and 25km'
		When [dist] >=10.0 then 'Between 10km and 14km'
		When [dist] >=5.0 then 'Between 5km and 9km'
		When [dist] >=1.0 then 'Between 1km and 4km'
		When [dist] <1.0 then 'Less than 1km'
			end) as 'Distance from City Centre'
      ,[metro_dist] as 'Distance to Nearest Metro'
      ,(case
		When [cleanliness_rating] >8  then 'Great'
		When [cleanliness_rating] >= 6 then 'Good'
		When [cleanliness_rating] >3 then 'Average'
		When [cleanliness_rating]  <=3  then 'Poor'
			End) as 'Cleanliness Rating'
      ,[attr_index_norm] as 'Attraction Rating'
      ,[rest_index_norm] as 'Resturant Rating'
	  ,[guest_satisfaction_overall] as 'Overall satisfaction'  
	  ,round([realSum],2) as 'Cost Per Night'
FROM [Europe_AirBnB_DB].[stg].[europeWeekdayAirBnB]
Union  
SELECT [european_city]
	  ,'Weekend' as 'weekday_or_weekend'
	  ,[lng] as 'Longtitude'
      ,[lat] as 'Latitude'
	  ,[room_type] as 'Type of Room'
	  ,[bedrooms] as 'Number of Bedrooms'
      ,[person_capacity] as 'Capacity'
      ,[host_is_superhost] as 'Superhost or Not'
      ,[multi] as 'Multiple Rooms or Not'
      ,[biz] as 'Business purpose or Not'
	  ,(case 
		When [dist] >= 25.0 then 'Approx 25km'
		When [dist] >=15.0 then 'Between 15km and 25km'
		When [dist] >=10.0 then 'Between 10km and 14km'
		When [dist] >=5.0 then 'Between 5km and 9km'
		When [dist] >=1.0 then 'Between 1km and 4km'
		When [dist] <1.0 then 'Less than 1km'
			end) as 'Distance from City Centre'
      ,[metro_dist] as 'Distance to Nearest Metro'
	  ,(case
		When [cleanliness_rating] >8  then 'Great'
		When [cleanliness_rating] >= 6 then 'Good'
		When [cleanliness_rating] >3 then 'Average'
		When [cleanliness_rating] <=3  then 'Poor'
			End) as 'Cleanliness Rating'
      ,[attr_index_norm] as 'Attraction Rating'
      ,[rest_index_norm] as 'Resturant Rating'
	  ,[guest_satisfaction_overall] as 'Overall satisfaction'  
	  ,round([realSum], 2) as 'Cost Per Night'
FROM [Europe_AirBnB_DB].[stg].[europeWeekendAirBnB]

