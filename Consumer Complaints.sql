
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