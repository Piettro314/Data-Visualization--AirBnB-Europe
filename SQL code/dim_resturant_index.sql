With rest_indexCte
as
(
Select Distinct [rest_index] as 'resturant_index'
FROM [stg].[fulldataset]
)
Select  ROW_NUMBER() over(order by resturant_index) as 'key_resturant_indexID'
		,resturant_index as 'resturant_index'
		,(case 
			When resturant_index >= 1000.0 then 'High Index'
			When resturant_index >= 500.0 then 'Medium Index'
			When resturant_index <500.0 then 'Low Index'
				end) as 'resturant_index_text'				
From rest_indexCte
Order by 1
