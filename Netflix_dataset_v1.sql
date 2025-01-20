--Data we are going to use
select * from Netflix_dataset..['Netflix-data$']

--Remnove null entries in dataset (Formatting issue) 
select * from Netflix_dataset..['Netflix-data$'] 
where Join_Date is not NULL

--Order the dataset by user_id in ascedning order after removing null
select * from Netflix_dataset..['Netflix-data$'] 
where Join_Date is not NULL
order by User_ID Asc

--Total number of subscriptions
select * from Netflix_dataset..['Netflix-data$'] 
where Join_Date is not NULL
order by User_ID Asc

--Male percentage vs Female Percentage
select
count(*) as total_subscription, 
count(case when Gender = 'Male' then 1 end) as male_count, 
CAST(COUNT(CASE WHEN Gender = 'Male' THEN 1 END) AS FLOAT) / COUNT(*) AS Male_percentage,
count(case when Gender = 'Female' then 1 end) as female_count, 
CAST(COUNT(CASE WHEN Gender = 'Female' THEN 1 END) AS FLOAT) / COUNT(*) AS Female_percentage
from Netflix_dataset..['Netflix-data$']
where Join_Date is not NULL

--Age demograhpic 
SELECT Subscription_Type, AVG(Age) AS Average_Age
FROM Netflix_dataset..['Netflix-data$']
WHERE Age IS NOT NULL
GROUP BY Subscription_Type;

--Device types
select Device, Gender, count (*) as device_count,
Cast (count(*) as float) / (select count(*) from Netflix_dataset..['Netflix-data$']) * 100 as device_percentage
from Netflix_dataset..['Netflix-data$']
where Join_Date is not NULL
Group by Device, Gender
order by Gender desc

--Country percentage 
SELECT Country, COUNT(*) AS country_count,
CAST(COUNT(*) AS FLOAT) / (SELECT COUNT(*) FROM Netflix_dataset..['Netflix-data$']) * 100 AS Country_percentage
FROM Netflix_dataset..['Netflix-data$']
where Join_Date is not NULL
GROUP BY Country
ORDER BY country_count DESC;

--Subscription plan revenue by country
SELECT Country, Subscription_Type, SUM(Monthly_Revenue) AS Total_Revenue
FROM Netflix_dataset..['Netflix-data$']
WHERE Monthly_Revenue IS NOT NULL
GROUP BY Country, Subscription_Type
ORDER BY Country, Total_Revenue DESC;



