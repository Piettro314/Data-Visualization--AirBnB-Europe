With EuroCityCte
as
(
Select Distinct [european_city] as 'european_city'
FROM [stg].[fulldataset]
)
Select Row_number () Over(Order by [european_city] ) *1016 as 'key_european_cityID'
	  ,[european_city]
From EuroCityCte
