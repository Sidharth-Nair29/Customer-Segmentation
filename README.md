# Customer Segmentation and Retention Analysis
Using a telecom churn dataset, i segmented the customers based on their behavioural traits, and built a churn prediction model that could be used to provide strategical retention insights.

Project Overview

This project analyzes telecom customer data to understand customer behavior, segment customers into meaningful groups, and predict customer churn.
The analysis combines exploratory data analysis (EDA), unsupervised learning (K-Means clustering), and supervised machine learning (Logistic Regression) to generate insights that can help businesses improve customer retention and targeted marketing strategies.
The dataset used is the Telco Customer Churn dataset, which contains demographic information, service usage details, billing information, and churn labels.

Objectives

The goals of this project are:
Analyze customer behavior and churn patterns
Segment customers based on usage, billing, and service characteristics
Identify high-risk churn segments
Build a machine learning model to predict customer churn
Provide actionable insights for customer retention strategies

Dataset

Dataset: Telco Customer Churn

The dataset contains customer information including:
Customer tenure
Monthly charges
Total charges
Internet service type
Contract type
Payment method
Support services
Customer churn status

The target variable:
Churn
Yes → Customer left the service
No → Customer retained

Exploratory Data Analysis (EDA)

EDA was performed to understand customer behavior and churn patterns.

Key analyses included:
Churn distribution
Customer tenure distribution
Monthly charge distribution
Churn vs tenure analysis
Churn vs service usage
Churn vs payment methods
Churn vs contract types

Key Findings

Some important patterns observed:
Customers with low tenure are more likely to churn
Month-to-month contracts show the highest churn rates
Customers with higher monthly charges tend to churn more
Lack of OnlineSecurity or TechSupport increases churn risk
Electronic check payment method shows higher churn rates

Customer Segmentation
Customer segmentation was performed using K-Means clustering to group customers with similar characteristics.

Steps
Feature scaling using StandardScaler
Determining optimal clusters using the Elbow Method
Evaluating clustering quality using Silhouette Score
Applying K-Means clustering

Segment profiling and interpretation

Result
The analysis identified four distinct customer segments.
Example segments include:

High-Value Loyal Customers
Long tenure
High total charges
Low churn rate

New High-Risk Customers
Low tenure
High monthly charges
Highest churn risk

Moderate Customers
Average tenure and spending

Segmentation helps businesses target retention efforts more effectively.

Segment-Level Churn Insights
By combining segmentation with churn analysis:
Some segments show significantly higher churn rates
New customers with expensive plans are most likely to churn
Long-term customers show very strong retention

This allows companies to design segment-specific retention strategies.

Churn Prediction Model
A Logistic Regression model was used to predict customer churn.

Preprocessing
One-hot encoding of categorical variables
Feature scaling
Train-test split

Model used:

Logistic Regression
The model predicts whether a customer is likely to churn or stay.

Key Churn Predictors

Strong predictors include:
InternetService – Fiber Optic
Strongest churn predictor
Higher cost → higher price sensitivity

Payment Method – Electronic Check
Customers using electronic check churn significantly more
Associated with lower commitment and manual payments

Senior Citizen Status
Slightly higher churn probability due to price sensitivity

Streaming Services
Higher service cost can increase churn if perceived value is low

Technologies Used

Programming Language:
Python

Libraries:
Pandas
NumPy
Scikit-learn
Matplotlib
Seaborn

Environment:
Google Colab
VS Code

Project Workflow :

Data Cleaning and Preprocessing
Exploratory Data Analysis
Feature Engineering and Encoding
Customer Segmentation (K-Means)
Segment Profiling
Churn Modeling (Logistic Regression)
Business Insight Generation

Business Applications
This project can help companies:
Identify high-value customer segments
Detect customers at risk of leaving
Improve customer retention strategies
Design targeted marketing campaigns
Optimize pricing and service offerings

Future Improvements
Possible improvements include:
Testing additional models such as Random Forest, XGBoost, or Gradient Boosting
Hyperparameter tuning
Building a real-time churn prediction system
Creating an interactive dashboard using Streamlit or Power BI
Deploying the model as an API
