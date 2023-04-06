Create or alter view vw.eu_airbnb_pycaret
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
	  ,dist as 'Distance from City Centre'
      ,[metro_dist] as 'Distance to Nearest Metro'
	  ,cleanliness_rating as 'Cleanliness Rating'
      ,[attr_index_norm] as 'Attraction Rating'
      ,[rest_index_norm] as 'Resturant Rating'
	  ,[guest_satisfaction_overall] as 'Overall satisfaction'  
	  ,round([realSum], 2) as 'Cost Per Night'
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
	  ,dist as 'Distance from City Centre'
      ,[metro_dist] as 'Distance to Nearest Metro'
	  ,cleanliness_rating as 'Cleanliness Rating'
      ,[attr_index_norm] as 'Attraction Rating'
      ,[rest_index_norm] as 'Resturant Rating'
	  ,[guest_satisfaction_overall] as 'Overall satisfaction'  
	  ,round([realSum], 2) as 'Cost Per Night'
FROM [Europe_AirBnB_DB].[stg].[europeWeekendAirBnB]




