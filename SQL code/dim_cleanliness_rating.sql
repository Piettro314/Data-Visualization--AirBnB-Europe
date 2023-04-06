With cleanliness_ratingCte
as
(
Select Distinct [cleanliness_rating] as 'cleanliness_rating'
FROM [stg].[fulldataset]
)
Select [cleanliness_rating] as 'key_cleanliness_ratingID'
,(case
		When [cleanliness_rating] = 10  then 'Great'
		When [cleanliness_rating] >=8 then 'Good'
		When [cleanliness_rating] >4 then 'Average'
		When [cleanliness_rating]  <=4  then 'Poor'
			End) as 'cleanliness_rating_text'
From cleanliness_ratingCte
Order by 1
