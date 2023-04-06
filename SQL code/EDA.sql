/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [european_city]
	  ,count(*)
      ,round(avg([Cost Per Night]),2)
	  ,round(STDEV([Cost Per Night]),2)
  FROM [Europe_AirBnB_DB].[vw].[fulldataset]
  group by [european_city]

  SELECT [european_city]
      ,round(avg([Distance to Nearest Metro]),2)
	  ,round(STDEV([Distance to Nearest Metro]),2)
	  ,round(avg([Attraction Rating]),2)
	  ,round(STDEV([Attraction Rating]),2)
  FROM [Europe_AirBnB_DB].[vw].[fulldataset]
  group by [european_city]