GO -------------------Fact table-------------------
IF NOT EXISTS(SELECT *
				FROM [Europe_AirBnB_DB].INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'europeBnB'
			)
exec('CREATE TABLE f.europeBnB (
    [european_cityID] bigint,
    [lng] varchar(50),
    [lat] varchar(50),
    [room_typeID] bigint,
    [bedrooms] real,
    [person_capacity] smallint,
    [multi] smallint,
    [biz] real,
    [cleanliness_rating] bigint,
    [attraction_indexID] float,
    [resturant_indexID] float,
    [host_is_superhost] int,
    [guest_satisfaction] bigint,
    [cost per night cad] float,
    [listing_count] int,
    [distance_from_centre] real,
    [distance_from_metro] real

    CONSTRAINT fk_room_typeID FOREIGN KEY (room_typeID)
	REFERENCES [dim].[roomtype] ([key_room_typeID]),
    
	CONSTRAINT fk_resturant_indexID FOREIGN KEY (resturant_indexID)
    REFERENCES [dim].[resturant_index] ([key_resturant_indexID]),

	CONSTRAINT fk_guest_satisfaction FOREIGN KEY (guest_satisfaction)
    REFERENCES [dim].[guest_satisfaction_overall] ([key_guest_satisfaction_overallID]),

	CONSTRAINT fk_european_cityID FOREIGN KEY (european_cityID)
    REFERENCES [dim].[european_city] ([key_european_cityID]),

	CONSTRAINT fk_attraction_indexID FOREIGN KEY (attraction_indexID)
    REFERENCES [dim].[attraction_index] ([key_attraction_indexID]),

	CONSTRAINT fk_cleanliness_rating FOREIGN KEY (cleanliness_rating)
    REFERENCES [dim].[cleanliness_rating] ([key_cleanliness_ratingID]),

	CONSTRAINT fk_distance_from_centreId FOREIGN KEY (distance_from_centre)
    REFERENCES [dim].[distance_from_city_centre] ([key_distance_from_city_centre]),

	CONSTRAINT fk_distance_from_metroID FOREIGN KEY (distance_from_metro)
    REFERENCES [dim].[distance_from_metro] ([key_distance_from_metro]),

	CONSTRAINT fk_cost_per_night FOREIGN KEY ([cost per night cad])
    REFERENCES [dim].[stats] (cost_per_nightID)
	)'
);
GO
truncate table f.europeBnB
GO
