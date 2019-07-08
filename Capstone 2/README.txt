
Quora insincere questions classification

Introduction:
=============
Quora is a platform that empowers people to learn from each other. On Quora, people can ask questions and connect with others who contribute unique insights and quality answers. Sincere questions are inquiries about which individuals genuinely want to know an answer or gain information from rather than argue a point or make a statement. It is often the case that insincere questions target religion, gender, politics, etc. and are constructed in a non-neutral tone, are exaggerated, or use words that attack various groups.A key challenge is to weed out insincere questions -- those founded upon false premises, or that intend to make a statement rather than look for helpful answers.

Objective:
==========
The goal is to handle unethical comments, in order to improve online conversation on Quora. This is done by identifying them and flagging them as insincere question. An insincere question is defined as a question intended to make a statement rather than look for helpful answers. 

Data Acquisition:
=================
The data comes from a Kaggle competition and is separated into two datasets, training and testing. The training set consists of a list of questions along with their target values (0 for sincere and 1 for insincere). However, the testing data only contains the sample questions without the target values
Data can be downloaded from the below link given below.
https://www.kaggle.com/c/quora-insincere-questions-classification/data 

Data Wrangling and EDA:
=======================
Exploratory Data Analysis (EDA) is an approach/philosophy for data analysis that employs a variety of techniques (mostly graphical) to:
	maximize insight into a data set;
	uncover underlying structure;
	extract important variables;
	detect outliers and anomalies;
	test underlying assumptions;
	develop parsimonious models; and
	determine optimal factor settings.

Pre-Processing:
===============
Tokenization
Replace contractions  
Stemming/Lemmatization
Lowering Case
Remove Numbers
Remove Punctuation
Replace spelling errors
Strip white space
Remove Stop Words
Noise Removal









 
