	Go------------------------------dim cleanliness rating---------------------------------
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM [Europe_AirBnB_DB].INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'cleanliness_rating')
exec('CREATE TABLE dim.cleanliness_rating (
    [key_cleanliness_ratingID] bigint,
    [cleanliness_rating_text] varchar(7)


	CONSTRAINT pk_cleanliness_rating PRIMARY KEY (key_cleanliness_ratingID ASC)
)'
);
GO
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM [Europe_AirBnB_DB].INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'dimcleanliness_rating')
exec('CREATE TABLE err.dimcleanliness_rating  (
    [key_cleanliness_ratingID] bigint,
    [cleanliness_rating_text] varchar(7),
	[ErrorCode] int,
	[ErrorColumn] int
)')
GO
------------------------------dim attraction_index---------------------------------
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM [Europe_AirBnB_DB].INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'attraction_index')
exec('CREATE TABLE dim.attraction_index (
    [key_attraction_indexID] float,
    [attraction_index_text] varchar(17),
    [attraction_index] float

	CONSTRAINT pk_attraction_index PRIMARY KEY (key_attraction_indexID ASC)
)'
);
GO
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM [Europe_AirBnB_DB].INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'dimattraction_index')
exec('CREATE TABLE err.dimattraction_index (
    [key_attraction_indexID] float,
    [attraction_index_text] varchar(17),
    [attraction_index] float,
	[ErrorCode] int,
	[ErrorColumn] int
)')
GO
------------------------------dim distance from center---------------------------------
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM [Europe_AirBnB_DB].INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'distance_from_city_centre')
exec('CREATE TABLE dim.distance_from_city_centre (
    [key_distance_from_city_centreID] float,
    [distance_from_city_centre_text] varchar(21),
    [distance_from_city_centre] float

	CONSTRAINT pk_distance_from_city_centre PRIMARY KEY (key_distance_from_city_centreID ASC)
)'
);
GO
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM [Europe_AirBnB_DB].INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'dimdistance_from_city_centre')
exec('CREATE TABLE err.dimdistance_from_city_centre (
    [key_distance_from_city_centreID] float,
    [distance_from_city_centre_text] varchar(21),
    [distance_from_city_centre] float,
	[ErrorCode] int,
	[ErrorColumn] int
)')
GO
------------------------------dim distance_from_metro---------------------------------
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM [Europe_AirBnB_DB].INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'distance_from_metro')
exec('CREATE TABLE dim.distance_from_metro (
    [key_distance_from_metroID] float,
    [distance_from_metro_text] varchar(20),
    [distance_from_metro] float

	CONSTRAINT pk_distance_from_metro  PRIMARY KEY (key_distance_from_metroID ASC)
)'
);
GO
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM [Europe_AirBnB_DB].INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'dimdistance_from_metro')
exec('CREATE TABLE err.dimdistance_from_metro (
    [key_distance_from_metroID] float,
    [distance_from_metro_text] varchar(20),
    [distance_from_metro] float,
	[ErrorCode] int,
	[ErrorColumn] int
)')
GO
------------------------------dim EuroCity---------------------------------
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM [Europe_AirBnB_DB].INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'european_city')
exec('CREATE TABLE dim.european_city (
    [key_european_cityID] bigint,
    [european_city] varchar(9)

	CONSTRAINT pk_european_city  PRIMARY KEY (key_european_cityID ASC)
)'
);
GO
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM [Europe_AirBnB_DB].INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'dimeuropean_city')
exec('CREATE TABLE err.dimeuropean_city (
    [key_european_cityID] bigint,
    [european_city] varchar(9),
	[ErrorCode] int,
	[ErrorColumn] int
)')
GO
------------------------------dim guest_satisfaction_overall---------------------------------
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM [Europe_AirBnB_DB].INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'guest_satisfaction_overall')
exec('CREATE TABLE dim.guest_satisfaction_overall (
    [key_guest_satisfaction_overallID] bigint,
    [guest_satisfaction_overall] varchar(13)

	CONSTRAINT pk_guest_satisfaction_overall PRIMARY KEY (key_guest_satisfaction_overallID ASC)
)'
);
GO
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM [Europe_AirBnB_DB].INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'dimguest_satisfaction_overall ')
exec('CREATE TABLE err.dimguest_satisfaction_overall (
    [key_guest_satisfaction_overallID] bigint,
    [guest_satisfaction_overall] varchar(13),
	[ErrorCode] int,
	[ErrorColumn] int
)')
GO
------------------------------dim_resturant_index---------------------------------
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM [Europe_AirBnB_DB].INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'resturant_index')
exec('CREATE TABLE dim.resturant_index (
    [key_resturant_indexID] float,
    [resturant_index_text] varchar(12),
    [resturant_index] float

	CONSTRAINT pk_resturant_index PRIMARY KEY (key_resturant_indexID ASC)
)'
);
GO
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM [Europe_AirBnB_DB].INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'dimresturant_index ')
exec('CREATE TABLE err.dimresturant_index (
    [key_resturant_indexID] float,
    [resturant_index_text] varchar(12),
    [resturant_index] float,
	[ErrorCode] int,
	[ErrorColumn] int
)')
GO
------------------------------dim_roomtype---------------------------------
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM [Europe_AirBnB_DB].INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'roomtype')
exec('CREATE TABLE dim.roomtype (
    [key_room_typeID] bigint,
    [room_type] varchar(15)

	CONSTRAINT pk_room_type PRIMARY KEY (key_room_typeID ASC)
)'
);
GO
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM [Europe_AirBnB_DB].INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'dimroomtype ')
exec('CREATE TABLE err.dimroomtype (
    [key_room_typeID] bigint,
    [room_type] varchar(15),
	[ErrorCode] int,
	[ErrorColumn] int
)')
GO
------------------------------dim_STATS---------------------------------
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM [Europe_AirBnB_DB].INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'stats')
exec('CREATE TABLE dim.stats (
    [cost_per_nightID] float,
     [zscore] float,
       [cost_range_per_night] varchar(19)

	CONSTRAINT pk_key_stats PRIMARY KEY ([cost_per_nightID] ASC)
)'
);
GO
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM [Europe_AirBnB_DB].INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'dimstats')
exec('CREATE TABLE err.dimstats (
    [cost_per_nightID] float,
    [zscore] float,
    [cost_range_per_night] varchar(19),
	[ErrorCode] int,
	[ErrorColumn] int
)')
GO

