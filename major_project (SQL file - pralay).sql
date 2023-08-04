# ------------------------------------------------------------------------------------------------------------------- #
# Pralay K Kalaskar
# pkkdkalaskar@71@gmail.com
# 7066216365
# Bangalore
# ------------------------------------------------------------------------------------------------------------------- #
# -XXXXXXXXXXXXXXXXXXXXXXXXXXXXX- #
# ------------------------------------------------------------------------------------------------------------------- #
# create a new schema of named "major_project" #
# then right click on that "major_project" under left pane side #
# then select the "table data import wizard" #
# click on browse to the location where the excel csv is present #

# for 1st excel file :-
# then right click on that "major_project" under left pane side #
# then select the "table data import wizard" #
# click on browse to the location where the excel csv is present #
# 1st file - select the excel named - telecom_customer_churn #
# then the path will be visible there, click on next, again click on next #
# then deselect the 2 columns named "avg_monthly_GB_download", "avg_monthly_long_distance_charges" #
# then ok, then data will start importing #
# it wll take 5-6 minutes to import the data #
# write down on a page how many records are imported and later open that file and crosscheck with it #
# then refresh the schema #

# for 2nd excel file :-
# then right click on that "major_project" under left pane side #
# then select the "table data import wizard" #
# click on browse to the location where the excel csv is present #
# 2nd file - select the excel named - telecom_zipcode_population #
# then the path will be visible there, click on next, again click on next #
# then ok, then data will start importing #
# it wll take some minutes to import the data #
# write down on a page how many records are imported and later open that file and crosscheck with it #
# then refresh the schema #

# for 3rd excel file :-
# then right click on that "major_project" under left pane side #
# then select the "table data import wizard" #
# click on browse to the location where the excel csv is present #
# 3rd file - select the excel named - telecom_data_dictionary #
# then the path will be visible there, click on next, again click on next #
# then ok, then data will start importing #
# it wll take some minutes to import the data #
# write down on a page how many records are imported and later open that file and crosscheck with it #
# then refresh the schema #

# then the fowwlowing queries are as follows below #
# ------------------------------------------------------------------------------------------------------------------- #
# -XXXXXXXXXXXXXXXXXXXXXXXXXXXXX- #
# ------------------------------------------------------------------------------------------------------------------- #
select * from telecom_customer_churn;
# (Customer_ID, Gender, Age, Married, Number_of_Dependents, City, Zip_Code, Latitude, Longitude, Number_of_Referrals, Tenure_in_Months, Offer, Phone_Service, Multiple_Lines, Internet_Service, Internet_Type, Online_Security, Online_Backup, Device_Protection_Plan, Premium_Tech_Support, Streaming_TV, Streaming_Movies, Streaming_Music, Unlimited_Data, Contract, Paperless_Billing, Payment_Method, Monthly_Charge, Total_Charges, Total_Refunds, Total_Extra_Data_Charges, Total_Long_Distance_Charges, Total_Revenue, Customer_Status, Churn_Category, Churn_Reason) #
select * from telecom_zipcode_population;
# (Zip Code, Population) #
select * from telecom_data_dictionary;
# (Table, Field, Description) #
# ------------------------------------------------------------------------------------------------------------------- #
# -XXXXXXXXXXXXXXXXXXXXXXXXXXXXX- #
# ------------------------------------------------------------------------------------------------------------------- #
-#- 1.
-#- primary factors influencing customer churn
-#- count of churned customers by different variable factors / columns compared with "CHURNED - customer_status"
-#- are there any specific patterns or correlations in the data that indicate churn-prone customers
select *, count(*) as churn_count
from telecom_customer_churn
where Customer_Status = 'Churned'
group by Customer_ID, Gender, Age, Married, Number_of_Dependents, City, Zip_Code, Latitude, Longitude, Number_of_Referrals, Tenure_in_Months, Offer, Phone_Service, Multiple_Lines, Internet_Service, Internet_Type, Online_Security, Online_Backup, Device_Protection_Plan, Premium_Tech_Support, Streaming_TV, Streaming_Movies, Streaming_Music, Unlimited_Data, Contract, Paperless_Billing, Payment_Method, Monthly_Charge, Total_Charges, Total_Refunds, Total_Extra_Data_Charges, Total_Long_Distance_Charges, Total_Revenue, Churn_Category, Churn_Reason;

-#- 2.
-#- identification of demographic and behavioral characteristics of churned customers
-#- that differentiate churned customers from those who continue to be active
-#- comparison churn and active customers
select Gender, Age, Married, Number_of_Dependents, City, avg(Age) as avg_age, avg(Monthly_Charge) as avg_monthly_charge, avg(Total_Charges) as avg_total_charge
from telecom_customer_churn
group by Gender, Age, Married, Number_of_Dependents, City;

-#- 3.
-#- specific services or contract terms that contribute significantly to customer churn
-#- there are opportunities to modify or enhance these offerings to reduce churn
select Phone_Service, Multiple_Lines, Internet_Service, Internet_Type, Online_Security, Online_Backup, Device_Protection_Plan, Premium_Tech_Support, Streaming_TV, Streaming_Movies, Streaming_Music, Unlimited_Data, Contract, Paperless_Billing, count(*) as churn_count
from telecom_customer_churn
where Customer_Status = 'Churned'
group by Phone_Service, Multiple_Lines, Internet_Service, Internet_Type, Online_Security, Online_Backup, Device_Protection_Plan, Premium_Tech_Support, Streaming_TV, Streaming_Movies, Streaming_Music, Unlimited_Data, Contract, Paperless_Billing;