Introduction:
=============
In the United States, health insurance marketplaces, also called health exchanges, are organizations in each state through which people can purchase health insurance. It aims to promote individuals to compare and choose from a range of available health plans and select the one that is most suitable. In the meanwhile, the healthcare reform act proposed the “Meaningful Use” incentive. As a result, much of the data was made public online, and became very easy to access. 

Given the massive database is available online, I can take full advantage of this resource to analyse and try to unravel the hidden invaluable information. The insurance companies always keep pricing decision in a black box, so by this study I will try to discover those patterns using numerous methodologies of Exploratory Data Analysis, Data Visualization and Predictive Analytics. I try to predict the rates of the plans for the next year and suggests the best plan to enroll in as per the individual needs

Data Acquisition
================
The Health Insurance Exchange Public Use Files (Exchange PUFs) are available for plan years 2014 to 2019 to support timely benefit and rate analysis. The link to the dataset is below:
https://www.cms.gov/cciio/resources/data-resources/marketplace-puf.html
http://www.nber.org/data/cms-marketplace.html

Data Wrnagling
==============
I have read all the 3 files from the website for all the year 2014-2019 and merge them separately. The major problem with he files like Plan rates and Benefits and Cost sharing, is they are very huge and takes time to process. So, I have kept them separately and wrangle them individually. 

Data Wrangling - Rate.ipynb --  It merges all the Rate files for 2014 to 2019 data
Data Wrangling - Plan Attributes.ipynb --  It merges all the Plan Attribute files for 2014 to 2019 data
Data Wrangling - Benefits & Cost Sharing.ipynb -- It merges all the Benefit & Cost Sharing files for 2014 to 2019 data

Exploratory Data Analysis
==========================
I have merged the data for different years and different types of data in one data frame, so that I can analyze all the data with the single source. It will require data merging and reshaping techniques (Split-Apply-Combine).
There are few data columns which were not captured from the year 2017 onwards which make me to read the manual so that I can identify all the common Columns in all the years which helps me to merge them together.

Data Analysis & Visualization.ipynb -- All data cleaning and exploratory analysis processes are covered in this file

Machine Learning
================
Build models and analyse their performances in various parameters. Did hyper parameter optimization
Analyse Accuracy Vs time for the best models achieved.  

Machine Learning Complete.ipynb --  All Machine Learning Algorithms Analysis
Hyperparameter Optimization - n_Estimator.ipynb --  Hyperparameter Analysis on Hold Out Dataset.


