With guest_satisfaction_overallCte
as
(
Select Distinct [guest_satisfaction_overall] as 'guest_satisfaction_overall'
FROM [stg].[fulldataset]
)
Select  [guest_satisfaction_overall] as 'key_guest_satisfaction_overallID'
,(case 
		When guest_satisfaction_overall = 100 then 'Excellent'
		When guest_satisfaction_overall >= 85 then 'Great'
		When guest_satisfaction_overall >= 50 then 'Good'
		When guest_satisfaction_overall  < 50  then 'Not Satisfied'
			end) as 'guest_satisfaction_overall'
From guest_satisfaction_overallCte
Order by 1