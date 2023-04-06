SELECT c.[key_european_cityID] as 'european_cityID'
	  ,f.lng
      ,f.lat
	  ,w.key_weekday_or_weekendID as 'weekday_or_weekendID'
	  ,r.key_room_typeID as 'room_typeID'
      ,f.bedrooms
	  ,f.person_capacity
	  ,f.multi
      ,f.biz
	  ,dc.key_distance_from_city_centreID as 'distance_from_centreId'
      ,dm.key_distance_from_metroID as 'distance_from_metroID'
      ,f.cleanliness_rating as 'cleanliness_rating'
	  ,ai.key_attraction_indexID as 'attraction_indexID'
      ,ri.key_resturant_indexID as 'resturant_indexID'
	  ,(case 
			when [host_is_superhost] = 'False' then 0
			when [host_is_superhost] = 'True' then 1
			else [host_is_superhost]
		End) as 'host_is_superhost'
	  ,f.[guest_satisfaction_overall] as 'guest_satisfaction'
      ,[cost per night cad]
FROM [stg].[fulldataset] f
	inner join [dim].[roomtype] r
		on f.room_type = r.room_type
	inner join [dim].[european_city] c
		on f.european_city = c.european_city
	inner join [dim].[weekday_or_weekend] w
		on f.weekday_or_weekend = w.weekday_or_weekend
	inner join [dim].[distance_from_metro] dm
		on f.metro_dist = dm.distance_from_metro
	inner join [dim].[distance_from_city_centre] dc
		on f.dist = dc.distance_from_city_centre
	inner join [dim].[attraction_index] ai
		on f.attr_index = ai.attraction_index
	inner join [dim].[resturant_index] ri
		on f.rest_index = ri.resturant_index
	inner join [dim].[cleanliness_rating] cr
		on f.cleanliness_rating = cr.key_cleanliness_ratingID
	inner join [dim].[guest_satisfaction_overall] gs
		on f.guest_satisfaction_overall = gs.key_guest_satisfaction_overallID