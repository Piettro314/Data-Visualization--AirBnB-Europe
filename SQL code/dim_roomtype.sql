With room_typeCte
as
(
Select Distinct [room_type] as 'room_type'
FROM [stg].[fulldataset]
)
Select Row_number () Over(Order by [room_type] ) as 'key_room_typeID'
,room_type
From room_typeCte
Order by 1
