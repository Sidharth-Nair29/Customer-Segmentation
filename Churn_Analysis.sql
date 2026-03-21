-- Customer Churn Analysis using SQL
-- Dataset: Telecom Customer Dataset
-- Objective: Analyze churn patterns and derive retention strategies

-- Author: Sidharth R. Nair
-- Tool Used: MySQL Workbench


-- ----------------
-- DATA VALIDATION
-- ----------------

select
	*
from
	cust_seg
limit 5;

select
	churn,
	count(*) as total_customers
from cust_seg
group by churn;

select
	distinct contract
from
	cust_seg;
    
select
	round(((sum(case when churn = 'Yes' then 1 else 0 end) / count(*)) * 100), 2) as churn_percentage
from
	cust_seg;

select
	round(sum(case when churn = 'Yes' then 1 else 0 end) / count(*) * 100, 1) as churn_rate
from
	cust_seg;

# Rate of churn = 26.6% will be used as a threshold for identifying segments with a relatively higher churn ( > 26.6% ).
    
-- ---------------------
-- BASIC CHURN ANALYSIS
-- ---------------------

-- 1. What is the churn rate for each contract type?

select
	contract,
    count(*) as total_customers,
	round(((sum(case when churn = 'Yes' then 1 else 0 end) / count(*)) * 100), 2) as churn_rate
from
	cust_seg
group by
	contract;

-- 2. Which payment method has the highest churn rate?

select
	paymentmethod,
    count(*) as total_customers,
	round(((sum(case when churn = 'Yes' then 1 else 0 end) / count(*)) * 100), 2) as churn_rate
from
	cust_seg
group by
	paymentmethod
order by
	churn_rate desc
limit 1;

-- 3. What is the churn rate for each internet service type?

select
	internetservice,
    count(*) as total_customers,
    round(((sum(case when churn = 'Yes' then 1 else 0 end) / count(*)) * 100), 2) as churn_rate
from
	cust_seg
group by
	internetservice;

-- 4. How does churn vary across senior citizens?

select
	seniorcitizen,
    count(*) as total_customers,
    round(((sum(case when churn = 'Yes' then 1 else 0 end) / count(*)) * 100), 2) as churn_rate
from
	cust_seg
group by
	seniorcitizen;

-- 5. What is the average monthly charges for churned vs retained customers?

select
	churn,
    avg(monthlycharges) as average_monthly_charges
from
	cust_seg
group by
	churn;
    
    
-- -----------------
-- SEGMENT ANALYSIS
-- -----------------

-- 1. What is the total number of customers in each segment?

select
	segment_name,
	count(*) as total_customers
from
	cust_seg
group by
	segment_name;

-- 2. What is the churn rate for each segment?

select
	segment_name,
	count(*) as total_customers,
    round(((sum(case when churn = 'Yes' then 1 else 0 end) / count(*)) * 100), 2) as churn_rate
from
	cust_seg
group by
	segment_name;

-- 3. Which segment has the highest churn rate?

select
	segment_name,
	count(*) as total_customers,
    round(((sum(case when churn = 'Yes' then 1 else 0 end) / count(*)) * 100), 2) as churn_rate
from
	cust_seg
group by
	segment_name
order by
	churn_rate desc
limit 1;

-- 4. What is the average tenure of customers in each segment?

select
	segment_name,
	count(*) as total_customers,
    avg(tenure)
from
	cust_seg
group by
	segment_name;

-- 5. Which segment generates the highest total revenue?

select
	segment_name,
	count(*) as total_customers,
    round(sum(totalcharges), 2) as highest_total_revenue
from
	cust_seg
group by
	segment_name
order by
	highest_total_revenue desc
limit 1;


-- ------------------
-- BUSINESS INSIGHTS
-- ------------------

-- 1. Which combination of Contract and PaymentMethod results in the highest churn?

select
	contract,
    paymentmethod,
    round(((sum(case when churn = 'Yes' then 1 else 0 end) / count(*)) * 100), 2) as churn_rate
from
	cust_seg
group by
	contract,
    paymentmethod
order by
	churn_rate desc
limit 1;

-- 2. Among customers with Fiber optic internet, what is the churn rate?

select
	internetservice,
    round(((sum(case when churn = 'Yes' then 1 else 0 end) / count(*)) * 100), 2) as churn_rate
from
	cust_seg
where
	internetservice = "Fiber optic";
    
-- 3. Do customers with higher monthly charges churn more?

select 
    quartile,
    min(MonthlyCharges),
    max(MonthlyCharges)
from (select 
    monthlycharges,
    ntile(3) over (order by monthlycharges) as quartile
from
	cust_seg
) t
group by
	quartile;

select
	(case 
		when MonthlyCharges < 50.4 then 'Low'
		when MonthlyCharges <= 84 then 'Medium'
		else 'High' end) as monthly_charge_group,
	count(*) as total_customers,
	round(((sum(case when churn = 'Yes' then 1 else 0 end) / count(*)) * 100), 2) as churn_rate,
    round(avg(case when churn = 'Yes' then tenure end), 1) as average_tenure_churned,
    round(avg(case when churn = 'No' then tenure end), 1) as average_tenure_retained
from
	cust_seg
group by
	monthly_charge_group
order by
	churn_rate desc;

select
	segment_name,
    round(avg(tenure), 2) as average_tenure,
	round(avg(monthlycharges), 2) as average_monthly_charges,
    round(((sum(case when churn = 'Yes' then 1 else 0 end) / count(*)) * 100), 2) as churn_rate
from
	cust_seg
group by
	segment_name
order by
	average_tenure; # Monthly charges alone did not explain churn, hence tenure was also considered.

-- 4. Which segment has both high churn rate AND high total charges?

select
	segment_name,
    round(((sum(case when churn = 'Yes' then 1 else 0 end) / count(*)) * 100), 2) as churn_rate,
    round(sum(totalcharges), 2) as total_revenue
from
	cust_seg
group by
	segment_name
having
	churn_rate >= 26.6 # Overall churn rate
order by
	total_revenue desc;
    
-- 5. What is the average tenure of churned customers vs retained customers?

select
	churn,
    avg(tenure) as average_tenure
from
	cust_seg
group by
	churn;
    
    
-- -----------------
-- FURTHER INSIGHTS
-- -----------------

-- 1. Identify the top 10 customers with the highest TotalCharges.

select
	*
from
	cust_seg
order by
	totalcharges desc
limit 10;

-- 2. Identify customers who have churned and have MonthlyCharges above average.

select
	*
from 
	cust_seg
where
	churn = 'Yes'
    and monthlycharges > (select
							avg(monthlycharges)
                        from
							cust_seg);

-- 3. Find the segment where customers have low tenure but high churn.

select 
    quartile,
    min(tenure),
    max(tenure)
from (select 
    tenure,
    ntile(3) over (order by tenure) as quartile
from
	cust_seg
) t
group by
	quartile;
    
select
	segment_name,
    round(avg(tenure), 1) as average_tenure,
    round(((sum(case when churn = 'Yes' then 1 else 0 end) / count(*)) * 100) , 2) as churn_rate
from
	cust_seg
group by
	segment_name
order by
	churn_rate desc,
	average_tenure asc
limit 1;
    
-- 4. Rank segments based on churn rate (highest to lowest).
select
	segment_name,
    round(((sum(case when churn = 'Yes' then 1 else 0 end) / count(*)) * 100) , 2) as churn_rate,
    rank() over(order by sum(case when churn = 'Yes' then 1 else 0 end) / count(*) desc) as ranks
from
	cust_seg
group by
	segment_name;

-- 5. Find customers who are in high-churn segments but have long tenure (at-risk valuable customers).

with segment_churn as (
    select
        segment_name,
        sum(case when churn = 'Yes' then 1 else 0 end) / COUNT(*) as churn_rate
    from
		cust_seg
    group by
		segment_name
),
avg_tenure_val as (
    select
		avg(tenure) as avg_tenure
	from
		cust_seg
)
select
	*
from
	cust_seg
where
	segment_name in (
		select
			segment_name
		from
			segment_churn
		where
			churn_rate > (
				select
					avg(churn_rate)
                from
					segment_churn
		)
	)
and tenure > (
	select
		avg_tenure
	from
		avg_tenure_val
	);

-- 6. Which segment contributes the most to total revenue but also has significant churn?

select
	*
from (
	select
		segment_name,
		round(sum(totalcharges), 2) as total_revenue,
		round(sum(case when churn = 'Yes' then 1 else 0 end) / count(*) * 100, 1) as churn_rate,
		count(*) as total_customers
	from
		cust_seg
	group by
		segment_name
	) t
where
	churn_rate >= 26.6 # Overall churn rate
order by
	total_revenue desc;

-- 7. Among high-churn segments, what is the most common Contract type?

with segment_churn as (
select
	segment_name,
    round(sum(case when churn = 'Yes' then 1 else 0 end) / count(*) * 100, 1) as churn_rate
from
	cust_seg
group by
	segment_name
)

select
	contract,
    count(*) as total_customers
from
	cust_seg
where
	segment_name in (
		select
			segment_name
		from
			segment_churn
		where
			churn_rate >= 26.6 # Overall churn rate
		)
group by
	contract
order by
	total_customers desc
limit 1;

-- 8. Which payment method is most used by churned customers?

select
	paymentmethod,
    count(*) as total_customers
from
	cust_seg
where
	churn = 'Yes'
group by
	paymentmethod
order by
	total_customers desc
limit 1;

-- 9. What percentage of churned customers belong to each segment?

select
	segment_name,
	round(sum(case when churn = 'Yes' then 1 else 0 end) / (select
														sum(case when churn = 'Yes' then 1 else 0 end) 
													from
														cust_seg) * 100, 1) as churn_rate
from
	cust_seg
group by
	segment_name
order by 
	churn_rate desc;

-- 10. Identify a customer group that should be targeted for retention based on:
-- a) High churn
-- b) High monthly charges
-- c) Short tenure

with segment_churn as (
select
	segment_name,
    round(sum(case when churn = 'Yes' then 1 else 0 end) / count(*) * 100, 1) as churn_rate
from
	cust_seg
group by
	segment_name
)

select
	*
from
	cust_seg
where
	segment_name in (
					select
						segment_name
					from
						segment_churn
					where
						churn_rate >= 26.6 # Overall churn rate
	)
	and monthlycharges >= 84 # 84 = Top tertile of monthly charges based on NTILE segmentation.
	and tenure <= 14 # 14 = Bottom tertile of tenure based on NTILE segmentation.
    and churn = 'No';
    
    
-- -------------
-- KEY FINDINGS
-- -------------

-- 1. Churn rate is 26.6%, used as baseline.
-- 2. Month to month contracts display a significantly stronger correlation with high churn rate.
-- 3. Fiber optic users show higher churn.
-- 4. High-value early customers are most at risk.
-- 5. Certain segments contribute high revenue but also high churn.
-- 6. Loyal customers, even though having the highest monthly charges have a significantly lower churn rate (14.74 %) as compared to new high value customers (46.67 %).


-- -----------------------------------
-- KEY INSIGHTS & RETENTION STRATEGIES
-- -----------------------------------

-- 1: Customers with low tenure (≤ 14 months) show significantly higher churn rates.
-- Strategy: Improve onboarding experience, provide early engagement, and offer trial extensions.

-- 2: Customers with high monthly charges (top tertile) are more likely to churn.
-- Strategy: Introduce pricing incentives, discounts for early months, and better value communication.

-- 3: Fiber optic internet users exhibit higher churn compared to other service types.
-- Strategy: Improve service reliability, provide proactive technical support, and align customer expectations.

-- 4: Segments with churn rate above the dataset average (26.6%) represent high-risk groups.
-- Strategy: Target these segments with personalized retention campaigns and offers.

-- 5: Moderate-tenure customers within high-churn segments are at risk despite their high value.
-- Strategy: Implement loyalty programs, exclusive benefits, and personalized outreach.

-- 6: Customers using certain payment methods show higher churn behavior.
-- Strategy: Encourage auto-pay options and simplify the payment process.

-- 7: Customers on short-term (month-to-month) contracts have higher churn rates.
-- Strategy: Offer incentives to shift customers to long-term contracts.