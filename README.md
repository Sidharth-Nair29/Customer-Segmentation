# Telecom Customer Segmentation & Churn Analysis

## Overview
This project analyzes telecom customer data to understand behavioral patterns, 
segment customers into meaningful groups, and predict churn. By combining 
exploratory data analysis, unsupervised clustering, and supervised machine learning, 
the project generates actionable insights to help businesses improve customer 
retention and optimize marketing strategies.

---

## Business Problem
Customer churn is one of the most critical challenges in the telecom industry. 
Acquiring new customers costs significantly more than retaining existing ones, yet 
most businesses lack visibility into:

- **Who is likely to churn** before they actually leave
- **Why certain customer segments churn** at higher rates than others
- **Which customers are worth prioritizing** for retention spend

This project addresses all three by combining segmentation and predictive modelling 
into a unified analysis framework.

---

## Dataset
- **Source**: [Telco Customer Churn Dataset](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)
- **Features**: Customer demographics, service subscriptions, billing details, 
  contract type, tenure, and churn status
- **Target variable**: `Churn` (Yes / No)

---

## Tools & Technologies
| Tool | Purpose |
|------|---------|
| Python (Pandas, NumPy) | Data cleaning and preprocessing |
| Python (Matplotlib, Seaborn) | Exploratory data analysis and visualization |
| Python (Scikit-learn) | Clustering (K-Means) and churn prediction (Logistic Regression) |
| MySQL | Segment-level SQL analysis |
| Power BI | Interactive dashboard and visualization |
| Jupyter Notebook | Analysis environment |

---

## Methodology

### 1. Data Cleaning & Preprocessing
- Handled missing and inconsistent values
- Encoded categorical variables for machine learning compatibility
- Scaled numerical features to normalize variable ranges
- Validated data types and distributions before analysis

### 2. Exploratory Data Analysis
- Analyzed distributions of key variables: tenure, monthly charges, total charges
- Examined relationships between service features and churn status
- Key finding: customers with shorter tenure and month-to-month contracts churn 
  significantly more frequently than long-term customers

### 3. Customer Segmentation (K-Means Clustering)
- Selected and scaled relevant features for clustering
- Determined optimal number of clusters using the Elbow Method
- Profiled each cluster to understand behavioral and spending characteristics
- Identified high-value segments vs high-churn-risk segments

### 4. Churn Prediction (Logistic Regression)
- Split dataset into training and testing sets
- Trained Logistic Regression classifier to predict churn probability
- Evaluated model performance on held-out test set
- Identified key churn drivers from model coefficients

### 5. SQL Analysis
- Conducted segment-level analysis on clustered data using MySQL
- Key techniques: CTEs, window functions, aggregations, subqueries
- Validated Python segmentation findings at the query level

### 6. Dashboard (Power BI)
Two-page interactive dashboard:
- **Churn Drivers** — KPIs, churn rate breakdowns by contract type, payment 
  method, tenure, and service subscriptions
- **Segment Analysis** — Cluster profiles, segment-wise churn rates, and 
  targeted retention strategies per segment

---

## Key Findings

**Churn Drivers**
- Month-to-month contract customers churn at significantly higher rates than 
  customers on annual or two-year contracts
- Higher monthly charges correlate with increased churn probability
- Customers without tech support or online security services show elevated churn rates
- Manual payment methods (paper check) associated with higher churn vs 
  automatic payment methods

**Customer Segments**
- High-value segment: long tenure, higher total spend, low churn risk — 
  priority for loyalty rewards
- High-risk segment: newer customers, high monthly charges, month-to-month 
  contracts — priority for early intervention
- Mid-value segment: moderate tenure and spending — receptive to upselling 
  bundled services

**Churn Prediction Model**
- Contract type, monthly charges, payment method, and service subscriptions 
  are the strongest predictors of churn
- Model enables proactive identification of at-risk customers before they leave

---

## Strategic Recommendations
- **Encourage long-term contracts** through targeted discounts and incentives
- **Focus retention efforts on new customers** — churn risk is highest in the 
  first few months of tenure
- **Promote bundled services** (tech support, online security) to increase 
  switching costs and reduce churn
- **Incentivize automatic payment methods** — associated with lower churn rates
- **Deploy churn prediction model** to flag at-risk customers for proactive 
  outreach before they leave

---

## Dashboard Preview

### Churn Analysis by segment
<img width="1012" height="567" alt="Screenshot 2026-03-19 132626" src="https://github.com/user-attachments/assets/9bf30e2c-f6cb-461a-b462-b964452423b9" />

### Insights and Retention Strategies
<img width="1011" height="568" alt="Screenshot 2026-03-19 141929" src="https://github.com/user-attachments/assets/a48095de-258f-45ed-9dcb-b48d5dd17b54" />

---

## Future Improvements
- Test ensemble models (Random Forest, Gradient Boosting) to improve 
  churn prediction accuracy
- Perform hyperparameter tuning to optimize model performance
- Build a Streamlit web app to make predictions accessible to 
  non-technical stakeholders
- Incorporate customer lifetime value (CLV) estimation into segmentation

---

## Author
**Sidharth R. Nair**  
MCA Graduate | Aspiring Data Analyst
