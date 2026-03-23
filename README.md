Customer Segmentation and Churn Analysis

Project Overview

This project focuses on analyzing customer data to understand behavioral patterns, segment customers into meaningful groups, and predict customer churn. By combining exploratory data analysis with machine learning techniques, the project aims to provide insights that can help businesses improve customer retention and optimize their marketing strategies. The analysis uses the Telco Customer Churn dataset, which contains information about customer demographics, service usage, billing details, and churn status.

Analysis, Visualization and Machine Learning using Python :-
Libraries : Pandas, NumPy, Matplotlib, Seaborn, Scikit Learn

SQL Based Analysis :-
Key techniques : CTEs, Window Functions, Aggregations, Subqueries

Interactive Visualization using PowerBI :-
Components : KPIs, Charts, Filers, Slicers

------------------------------------------------------------------------------------------------------------------------------

Objective

The primary objective of this project is to explore customer behavior and identify factors that influence customer churn. In addition to understanding churn patterns, the project applies clustering techniques to group customers with similar characteristics. These segments can help businesses tailor their strategies for different customer groups. The project also builds a predictive model to identify customers who are likely to churn, enabling companies to take preventive actions to retain them.

------------------------------------------------------------------------------------------------------------------------------

Dataset

The dataset used in this project is the Telco Customer Churn dataset. It contains various attributes related to customers, including demographic information, service subscriptions, billing details, and tenure with the company. The dataset also includes a churn indicator that specifies whether a customer has left the service or continues to remain active. This information makes it possible to analyze patterns related to customer retention and churn behavior.

------------------------------------------------------------------------------------------------------------------------------

Exploratory Data Analysis

Exploratory Data Analysis (EDA) was conducted to better understand the structure and characteristics of the dataset. This involved analyzing distributions of key variables such as tenure, monthly charges, and total charges, as well as examining relationships between these variables and churn status. Various visualizations were used to identify trends and patterns. The analysis revealed that customers with shorter tenure and month-to-month contracts tend to churn more frequently, while long-term customers generally show higher retention rates.

Dashboard Preview (Microsoft PowerBI) :-

Churn Drivers :

<img width="1015" height="570" alt="Screenshot 2026-03-18 124050" src="https://github.com/user-attachments/assets/cb34f8f3-8308-42cf-a9d5-e8008646fb56" />

<img width="1016" height="571" alt="Screenshot 2026-03-18 124124" src="https://github.com/user-attachments/assets/b5505ffd-91c0-4a88-bf35-0e9cf8be716f" />

<img width="1009" height="570" alt="Screenshot 2026-03-18 124145" src="https://github.com/user-attachments/assets/b2ce4854-e913-4303-a96f-590b147275c6" />

Business Recommendations
- Encourage long-term contracts through discounts.
- Focus retention efforts on new customers (first few months).
- Promote bundled services like tech support and security.
- Incentivize automatic payment methods.

------------------------------------------------------------------------------------------------------------------------------

Customer Segmentation

Customer segmentation was performed using the K-Means clustering algorithm. Before applying clustering, relevant features were selected and scaled to ensure that variables with different ranges did not disproportionately influence the clustering results. The optimal number of clusters was determined using techniques such as the Elbow Method. After clustering, the resulting groups were analyzed to understand the characteristics of each segment. These segments represent different types of customers based on factors such as spending behavior, tenure, and service usage.

------------------------------------------------------------------------------------------------------------------------------

Segment Analysis

After identifying customer segments, each cluster was analyzed to understand its unique characteristics. Some clusters represented high-value customers with long tenure and higher total spending, while others included newer customers who had higher monthly charges and a greater likelihood of churning. By examining these clusters, businesses can identify which groups require targeted retention strategies and which segments contribute the most value.

Dashboard Preview (Microsoft PowerBI) :-

Segment-wise Churn Analysis, Insights and Retention Strategies :

<img width="1012" height="567" alt="Screenshot 2026-03-19 132626" src="https://github.com/user-attachments/assets/9bf30e2c-f6cb-461a-b462-b964452423b9" />

<img width="1011" height="568" alt="Screenshot 2026-03-19 141929" src="https://github.com/user-attachments/assets/a48095de-258f-45ed-9dcb-b48d5dd17b54" />

------------------------------------------------------------------------------------------------------------------------------

Churn Prediction Model

In addition to segmentation, a churn prediction model was developed using Logistic Regression. The model was trained to classify customers as either likely to churn or likely to remain with the company. Prior to training the model, categorical variables were encoded and numerical features were scaled to improve model performance. The dataset was then split into training and testing sets to evaluate the model's predictive ability.

------------------------------------------------------------------------------------------------------------------------------

Model Insights

The churn prediction model highlights several important factors associated with customer churn. Variables such as contract type, monthly charges, payment method, and service subscriptions play a significant role in determining whether a customer is likely to leave. Customers with month-to-month contracts and higher monthly charges were found to have a higher probability of churning compared to customers with long-term contracts.

------------------------------------------------------------------------------------------------------------------------------

Technologies Used

This project was implemented using Python and several data science libraries. Pandas and NumPy were used for data manipulation and preprocessing, while Matplotlib and Seaborn were used for visualization. Machine learning tasks such as clustering and churn prediction were performed using the Scikit-learn library. The analysis and experimentation were carried out in a Jupyter Notebook environment.

------------------------------------------------------------------------------------------------------------------------------

Business Applications

The insights generated from this analysis can help businesses improve their customer retention strategies. By identifying high-risk customers, companies can implement targeted interventions such as personalized offers or improved customer support. Customer segmentation also allows businesses to design marketing campaigns tailored to specific customer groups, ultimately improving customer satisfaction and reducing churn rates.

------------------------------------------------------------------------------------------------------------------------------

Future Improvements

While this project provides useful insights, several improvements could further enhance its impact. Additional machine learning models such as Random Forest or Gradient Boosting could be tested to improve churn prediction performance. Hyperparameter tuning could also be performed to optimize model accuracy. Another potential improvement is the development of an interactive dashboard using tools such as Streamlit or Power BI to make the insights more accessible for business stakeholders.
