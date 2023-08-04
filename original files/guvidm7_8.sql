USE guvidm7_8;
select*from telecom_customer_churn;
select* from zipcode_population;

-- 1. Factors influencing customer churn:
-- count of churned customers by factors
select
 gender,
 married,
 Dependents,
 Referrals,
 Phone_Service,
 Multiple_Lines,
 Internet_Service,
 Internet_Type,
 Online_Security,
 Online_Backup
 Device_Protection,
 Tech_Support,
 Streaming_TV,
 Streaming_Movies,
 Streaming_Music,
 Unlimited_Data,
 Contract,
 Paperless_Billing,
 Customer_Status,
 count(*) as churn_count
from telecom_customer_churn
WHERE customer_status='churned'
Group by 
  gender,
 married,
 Dependents,
 Referrals,
 Phone_Service,
 Multiple_Lines,
 Internet_Service,
 Internet_Type,
 Online_Security,
 Online_Backup,
 Device_Protection,
 Tech_Support,
 Streaming_TV,
 Streaming_Movies,
 Streaming_Music,
 Unlimited_Data,
 Contract,
 Paperless_Billing;
 
 -- 2. Demographic and behavioral characteristics of churned customers:
 -- Comparison churn and avtive customers
 
 SELECT gender, married, dependents,
        avg(age) as avg_age,
        avg(monthly_charge) as avg_monthly_charges,
        avg(total_charges) as avg_total_charge
 FROM telecom_customer_churn
 GROUP by gender,married, dependents;
 
 -- 3. services or contract terms 
 select
 Phone_Service,
 Multiple_Lines,
 Internet_Service,
 Internet_Type,
 Online_Security,
 Online_Backup,
 Device_Protection,
 Tech_Support,
 Streaming_TV,
 Streaming_Movies,
 Streaming_Music,
 Unlimited_Data,
 Contract,
 Paperless_Billing,
 count(*) as churn_count
from telecom_customer_churn
WHERE customer_status='churned'
Group by 
 Phone_Service,
 Multiple_Lines,
 Internet_Service,
 Internet_Type,
 Online_Security,
 Online_Backup,
 Device_Protection,
 Tech_Support,
 Streaming_TV,
 Streaming_Movies,
 Streaming_Music,
 Unlimited_Data,
 Contract,
 Paperless_Billing;
 
 
 
 
 
 
 