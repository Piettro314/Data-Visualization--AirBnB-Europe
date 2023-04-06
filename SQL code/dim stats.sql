WITH zscore_cte AS (
  SELECT distinct [cost per night cad], 
         AVG([cost per night cad]) OVER() AS mean, 
         stdev([cost per night cad]) OVER() AS stdev
		 ,(case
				When [cost per night cad] >9001.20	Then '$9004.20 - $9974.94'
				When [cost per night cad] >8006.55 Then '$8006.55 - $9004.20'
				When [cost per night cad] >7008.91 Then '$7008.91 - $8006.55'
				When [cost per night cad] >6011.26 Then '$6011.26 - $7008.91'
				When [cost per night cad] >5013.62 Then '$5013.62 - $6011.26'
				When [cost per night cad] >4015.97 Then '$4015.97 - $5013.62'
				When [cost per night cad] >3018.32 Then '$3018.32 - $4015.97'
				When [cost per night cad] >2020.68 Then '$2020.68 - $3018.32'
				When [cost per night cad] >1023.03 Then '$1023.03 - $2020.68'
				When [cost per night cad] >25.38   Then '$25.38 - $1023.03'
			End) as 'cost_range_per_night'
  FROM [stg].[fulldataset]
)
SELECT [cost per night cad] as 'cost_per_nightID'
	  ,cost_range_per_night
	  ,([cost per night cad] - mean) / stdev AS zscore
FROM zscore_cte;