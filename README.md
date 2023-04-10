[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=50&pause=1000&color=000000&background=EBEBEB00&width=1500&height=200&lines=Creating+Business+Intelligence+Visualization)](https://git.io/typing-svg)

# Preface
The Kimball methodology of data warehousing is a technique used to determine how data is stored and later used for visual representation. There are various visualization tools like Power BI, Excel, and Tableau, and this project intends to showcase the process of creating visualizations with an emphasize on the data because it is from my experience that tool selection is based on individual preference, data availability, and suitability. 

# Objective of the project
The objective is to create a visualization that examines AirBnB data in Europe by following a series of steps, including exploration, modeling, ETL, and finally visualization. The ultimate goal is to forecast rental rates for both business and leisure travelers in various European cities.

# Data Preparation
Throughout my learning experience, I have come to realize that there are several methods to prepare data. One approach is to use Python and its libraries such as Pandas for cleaning and organizing data and Seaborn for gaining insights. Another option is to utilize SQL and its features such as joins, groupby, where statements, case statements, and CTE to design the data. There are also various other methods available.

For this project SQL will be mainly utilized for structuring the Data in preparation for visualization. Data contains 20 CSVs weekend and weekdays divided up by [European cities](https://zenodo.org/record/4446043#.Y9Y9ENJBwUE).
## SSIS Package
* To import into the SQL database a Sequel Server Integration Services (SSIS) package was utilized

<img src="https://github.com/Piettro314/Data-Visualization--AirBnB-Europe/blob/main/Media%20Content/SSIS2.gif" align="center">
<br>

<p>
What is the rationale for using SSIS?
</p>
<p>
SSIS offers a broad range of transformation functions that are useful for data transformation, cleaning, and enhancement. In particular, SSIS provides a for loop container and an Execute SQL task, which can be beneficial. The primary objective of using SSIS is to create a star schema, which consists of a fact table containing a vast amount of data, the main source of the data, and smaller dimension tables that contain all of the descriptive information about the data in the fact table.
</p>
<p>
Star schemas enable data to be stored efficiently for quick querying by minimizing the number of joins required to retrieve data. Additionally, they establish a clear and straightforward structure for querying.
</p>

### Techniques

1) The use of CTE and Case Statements within SQL commands, as demonstrated in the example below, was employed to create identified dimensions in the SSIS package that utilized dimensional modeling.

```
With distance_from_city_centreCte
as
(
Select Distinct [dist] as 'distance_from_city_centre'
FROM [stg].[fulldataset]
)
Select  [distance_from_city_centre] as 'key_distance_from_city_centre'
	   ,(case 
		When distance_from_city_centre >= 25.0 then 'Approx 25km'
		When distance_from_city_centre >=15.0 then 'Between 15km and 25km'
		When distance_from_city_centre >=10.0 then 'Between 10km and 14km'
		When distance_from_city_centre >=5.0 then 'Between 5km and 9km'
		When distance_from_city_centre >=1.0 then 'Between 1km and 4km'
		When distance_from_city_centre <1.0 then 'Less than 1km'
			end) as 'distance_from_city_centre_text'
From distance_from_city_centreCte
Order by 1

```
See SQL code folder for all SQL used within this project

2) Following the creation of each dimension, the data was organized into a central fact table and several dimension tables using primary and foreign key relationships, conforming to the star schema design.

<img src="https://github.com/Piettro314/Data-Visualization--AirBnB-Europe/blob/main/Media%20Content/Star%20Schema.gif" align="center">
<br>


# Exploratory Data Analysis (EDA)- With Python
Undoubtedly, one of the most crucial stages in a data science project is exploratory analysis, which marks the inception of visualization ideas. The following descriptive analysis tables were generated from the dataset using the following Python code.

```
tukey_df = pd.DataFrame(df.groupby('european_city')['bedrooms'].mean())
tukey_df['std # bedrooms'] = df.groupby('european_city')['bedrooms'].std()
tukey_df['mean Capacity'] = df.groupby('european_city')['person_capacity'].mean()
tukey_df['std Capacity'] = df.groupby('european_city')['person_capacity'].std()
tukey_df['mean Overall satisfaction'] = df.groupby('european_city')['guest_satisfaction_overall'].mean()
tukey_df['std Overall satisfaction'] = df.groupby('european_city')['guest_satisfaction_overall'].std()
tukey_df['mean Cleanliness Rating'] = df.groupby('european_city')['cleanliness_rating'].mean()
tukey_df['std Cleanliness Rating'] = df.groupby('european_city')['cleanliness_rating'].std()
tukey_df.columns = ['mean # bedrooms', 'std # bedrooms', 'mean Capacity', 'std Capacity',
       'mean Overall satisfaction', 'std Overall satisfaction',
       'mean Cleanliness Rating', 'std Cleanliness Rating']
tukey_df.index.names = ['city']
tukey_df
```
<img src="https://github.com/Piettro314/Data-Visualization--AirBnB-Europe/blob/main/Media%20Content/Descriptive%20table.png" align="center">

```
price_df = pd.DataFrame(df['european_city'].value_counts())
price_df['avg cost per night'] = df.groupby('european_city')['cost per night cad'].mean()
price_df['std cost per night'] = df.groupby('european_city')['cost per night cad'].std()
price_df['median cost per night'] = df.groupby('european_city')['cost per night cad'].median()
price_df.columns = ['Number of listings', 'avg cost per night', 'std cost per night',
       'median cost per night']
price_df.index.names = ['city']
price_df.sort_index()
```

<img src="https://github.com/Piettro314/Data-Visualization--AirBnB-Europe/blob/main/Media%20Content/Descriptive%20cost%20table.png" align="center">


### Data Validation 
After creating the above tables the data was validated against the source: https://www.sciencedirect.com/science/article/pii/S0261517721000388?via%3Dihub#tbl4

#### Auto EDA
ydata_profile libray was also used for insight into the data

<img src="https://github.com/Piettro314/Data-Visualization--AirBnB-Europe/blob/main/Media%20Content/EDA.gif" align="center">



# Visualization
When the data is arranged in a star schema, selecting the appropriate tool becomes a matter of personal preference as each tool has its own advantages and limitations. The subsequent video showcases a visualization created with Power BI, which I selected as the focus of my studies.

###### YOU TUBE VIDEO LINK HERE

# Remarks
Visualizations are a valuable instrument for gaining insights from data; nonetheless, they can only be generated once the data has been prepared and stored in a format that is readily available for reporting purposes. 

# References

Airbnb prices in European cities. Kaggle. (n.d.). Retrieved April 10, 2023, from https://www.kaggle.com/datasets/thedevastator/airbnb-prices-in-european-cities 

Gyódi, K., &amp; Nawaro, Ł. (2021, January 13). Determinants of airbnb prices in European cities: A Spatial Econometrics Approach (supplementary material). Zenodo. Retrieved April 10, 2023, from https://zenodo.org/record/4446043#.Y9Y9ENJBwUE 

Author links open overlay panelKristóf Gyódi, Highlights•Airbnb prices are spatially dependent.•Attractiveness of neighbourhoods can be measured with TripAdvisor data.•Accessibility of tourist attractions is a major price driver.•Multi-source spatial models provide best fit to data., &amp; AbstractWe examine the determinants of Airbnb prices in 10 major EU cities. (2021, April 8). Determinants of airbnb prices in European cities: A spatial econometrics approach. Tourism Management. Retrieved April 10, 2023, from https://www.sciencedirect.com/science/article/pii/S0261517721000388?via%3Dihub#tbl4 

