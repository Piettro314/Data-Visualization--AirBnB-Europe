[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=50&pause=1000&color=000000&background=EBEBEB00&width=1500&height=200&lines=Creating+Business+Intelligence+Visualization)](https://git.io/typing-svg)

# Preface
The Kimball methodology of data warehousing is a technique used to determine how data is stored and later used for visual representation. There are various visualization tools like Power BI, Excel, and Tableau, and this project intends to showcase the process of creating visualizations while emphasizing that tool selection is based on individual preference, data availability, and suitability. 

# Objective of the project
To illustrate the process of developing a visualization to analyze AirBnB data in Europe. The aim is to project rental rates for both leisure and business travellers in European cities and build a model to forecast prices.

# Data Preparation
Throughout my learning experience, I have come to realize that there are several methods to prepare data. One approach is to use Python and its libraries such as Pandas for cleaning and organizing data and Seaborn for gaining insights. Another option is to utilize SQL and its features such as joins, groupby, where statements, case statements, and CTE to design the data. There are also various other methods available.

For this project SQL will be mainly utilized for structuring the Data in preparation for visualization. Data contains 20 CSVs weekend and weekdays divided up by [European cities](https://zenodo.org/record/4446043#.Y9Y9ENJBwUE).
## SSIS Package
* To import into the SQL database a Sequel Server Integration Services (SSIS) package was utilized

<div>
<img src="https://github.com/Piettro314/Data-Visualization--AirBnB-Europe/blob/main/Media%20Content/SSIS.gif" align="center">
</div>
What is the rationale for using SSIS?
<p>
SSIS offers a broad range of transformation functions that are useful for data transformation, cleaning, and enhancement. In particular, SSIS provides a for loop container and an Execute SQL task, which can be beneficial. The primary objective of using SSIS is to create a star schema, which consists of a fact table containing a vast amount of data, the main source of the data, and smaller dimension tables that contain all of the descriptive information about the data in the fact table.
</p>
<p>
Star schemas enable data to be stored efficiently for quick querying by minimizing the number of joins required to retrieve data. Additionally, they establish a clear and straightforward structure for querying.
</p>

### Kimball Methodology

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

*Star Schema GIf


# Building Visualization
Selecting a tool for visualization. Ease of use, Preference
1) Wire frame BI canvas
2) Build

# Pycaret
Pycaret will be utilized for 2 main purposes.
1) Mainly to create a predictive model for the prediction of AirBnB prices
2) For quick analysis of the data taking note of feature importance and other insights for later visualization
	
