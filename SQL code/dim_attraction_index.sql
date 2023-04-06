With attraction_indexCte
as
(
Select Distinct attr_index as 'attraction_index'
FROM [stg].[fulldataset]
)
Select  ROW_NUMBER() over(order by [attraction_index])*106 as 'key_attraction_indexID'
	,[attraction_index] as 'attraction_index'
	,(case 
		When attraction_index >= 500.0 then 'High Attraction'
		When attraction_index >= 250.0 then 'Medium Attraction'
		When attraction_index <250.0 then 'Low Attraction'
			end) as 'attraction_index_text'
From attraction_indexCte
Order by 1

