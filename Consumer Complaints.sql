use sqlproject;
select * from consumercomplaints;
show columns from consumercomplaints;
alter table consumercomplaints
  rename column `Date Received` to date_recevied,
  rename column `Product Name` to product_name,
  rename column `Sub Product` to sub_product,
  rename column `Sub Issue` to sub_issue;
  
alter table consumercomplaints
   rename column `Consumer Complaint Narrative` to Consumer_Complaint_Narrative,
   rename column `Submitted via` to Submitted_via,
   rename column `Date Sent to Company` to Date_Sent_to_Company,
   rename column `Company Response to Consumer` to Company_response_to_consume,
   rename column `Timely Response` to Timely_Response,
   rename column `Consumer Disputed` to Consumer_Disputed,
   rename column `Complaint ID` to Complaint_ID;

alter table consumercomplaints
    rename column `Company Public Response` to Company_Public_Response,
    rename column `State Name` to State_Name,
    rename column `Zip Code` to Zip_Code,
    rename column `Consumer Consent Provided` to Consumer_Consent_Provided;


select STR_TO_DATE(date_recevied, '%d-%m-%Y') from consumercomplaints;

select STR_TO_DATE(Date_Sent_to_Company, '%d-%m-%Y') from consumercomplaints;
select count(*) from consumercomplaints where date_recevied = Date_Sent_to_Company;
show columns from consumercomplaints;
select count(Consumer_Complaint_Narrative) from consumercomplaints where State_Name= 'NY';
select count(Consumer_Complaint_Narrative) from consumercomplaints where State_Name= 'NY' or State_Name='CA'; 
select * from consumercomplaints where product_name like '%Credit%';
Select * from consumercomplaints where Issue like "%Late%";
#-----------------------------------------------------------------------------------
select count(Consumer_Complaint_Narrative) from consumercomplaints;  #How many total complaints are there in the dataset?
select distinct(product_name) from consumercomplaints; #List all distinct products mentioned in product_name.
select count(*) from consumercomplaints where Submitted_via ='Web'; #Count how many complaints were submitted via 'Web'.
#------------------------------------------------------------------------------------
select State_Name,count(Complaint_ID) as complaint_count from consumercomplaints group by State_Name ;  #Find the number of complaints from each state.
select State_Name as top_5_states,count(Complaint_ID) as total_complaint from consumercomplaints group by State_Name order by total_complaint desc limit 5;  #Get the top 5 states with the highest number of complaints.
select Submitted_via,count(Complaint_ID) as NO_of_complaints from consumercomplaints group by Submitted_via  ; #Find the number of complaints submitted via each channel (Submitted_via).
#------------------------------------------------------------------------------------
select monthname(date_recevied) as Month , count(Complaint_ID) as total_complaint_each_month from consumercomplaints group by month(date_recevied),monthname(date_recevied) order by month(date_recevied); #Find the number of complaints received in each month, and show the month name
select Company,count(complaint_ID) as highest_complaint from consumercomplaints where month(date_recevied)=3 group by Company order by highest_complaint desc limit 3; #Find the top 3 companies with the most complaints filed in March (any year).

