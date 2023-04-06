create or alter view vw.EuroBnbViz
as
SELECT c.european_city
      ,[lng]
      ,[lat]
      ,w.weekday_or_weekend
      ,r.room_type
      ,[bedrooms]
      ,[person_capacity]
      ,[multi]
      ,[biz]
      ,dc.distance_from_city_centre_text
      ,dm.distance_from_metro_text
      ,cr.cleanliness_rating_text
      ,ai.attraction_index_text
      ,ri.resturant_index_text
      ,[host_is_superhost]
      ,gs.guest_satisfaction_overall
      ,[cost per night cad]
  FROM [f].[europeBnB] f
	inner join [dim].[roomtype] r
		on f.room_typeID = r.key_room_typeID
	inner join [dim].[european_city] c
		on f.european_cityID = c.[key_european_cityID]
	inner join [dim].[weekday_or_weekend] w
		on f.weekday_or_weekendID = w.[key_weekday_or_weekendID]
	inner join [dim].[distance_from_metro] dm
		on f.distance_from_metroID = dm.key_distance_from_metroID
	inner join [dim].[distance_from_city_centre] dc
		on f.distance_from_centreId = dc.key_distance_from_city_centreID
	inner join [dim].[attraction_index] ai
		on f.attraction_indexID = ai.key_attraction_indexID
	inner join [dim].[resturant_index] ri
		on f.resturant_indexID = ri.key_resturant_indexID	
	inner join [dim].[cleanliness_rating] cr
		on f.cleanliness_rating = cr.key_cleanliness_ratingID
	inner join [dim].[guest_satisfaction_overall] gs
		on f.guest_satisfaction = gs.key_guest_satisfaction_overallID