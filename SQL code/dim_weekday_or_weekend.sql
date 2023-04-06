With weekday_or_weekendCte
as
(
Select Distinct [weekday_or_weekend] as 'weekday_or_weekend'
FROM [stg].[fulldataset]
)
Select Row_number () Over(Order by [weekday_or_weekend]) as 'key_weekday_or_weekendID'
,[weekday_or_weekend]
From weekday_or_weekendCte
