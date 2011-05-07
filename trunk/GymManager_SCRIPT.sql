CREATE DATABASE GymManager
GO

USE GymManager
GO

--------------------------------------------------------
--#################### ENQUIRY ####################--
--------------------------------------------------------

--------------- ENQUIRY_DETAILS TABLE ----------------
CREATE  TABLE ENQUIRY_DETAILS
(
ENQ_ID varchar(10) PRIMARY KEY NOT NULL CONSTRAINT enq_id_pk CHECK (ENQ_ID LIKE 'ENQ%'),
ENQ_DATE DateTime,
ENQ_FNAME varchar(15) NOT NULL,
ENQ_MNAME varchar(15),
ENQ_LNAME varchar(15) NOT NULL,
ENQ_MOBILE varchar(10),
ENQ_TELEPHONE varchar(8),
ENQ_EMAIL varchar(50),
ENQ_STATUS varchar(15) CONSTRAINT enq_status_chk CHECK (ENQ_STATUS IN ('CONFIRMED','UNCONFIRMED','PENDING'))
)

-- SELECT * FROM ENQUIRY_DETAILS
-- DROP TABLE ENQUIRY_DETAILS CASCADE


--------------------------------------------------------
--#################### PLAN ##########################--
--------------------------------------------------------


--------------- PLAN MASTER TABLE ----------------------
CREATE  TABLE PLAN_MSTR
(
PLAN_ID varchar(10) PRIMARY KEY NOT NULL CONSTRAINT plan_id_pk CHECK (PLAN_ID LIKE 'PLN%'),
PLAN_NAME varchar(10),
PLAN_DESCRIPTION varchar(200),
PLAN_AMOUNT money,
)


--------------- ADD-ON MASTER TABLE ----------------------
CREATE  TABLE ADDON_MSTR
(
ADDON_ID varchar(10)  CONSTRAINT ADDON_ID_pk PRIMARY KEY,
ADDON_NAME varchar(30),
ADDON_DESCRIPTION varchar(300),
ADDON_AMOUNT_MONTHLY money,
ADDON_AMOUNT_QUARTERLY money,
ADDON_AMOUNT_HALF_YEARLY money,
ADDON_AMOUNT_YEARLY money,
ADDON_AMOUNT_3YEARLY money,
ADDON_AMOUNT_5YEARLY money
)
--select * from ADDON_MSTR
--insert into ADDON_MSTR(ADDON_ID,ADDON_NAME,ADDON_DESCRIPTION,ADDON_AMOUNT_MONTHLY)  values('ADN_002','Quaterly','My First Value',3265)



--------------------------------------------------------
--#################### MEMBERSHIP ####################--
--------------------------------------------------------


--------------- MEMBER_DETAILS TABLE ----------------
CREATE  TABLE MEMBER_DETAILS
(
MBR_ID varchar(10) PRIMARY KEY NOT NULL CONSTRAINT MBR_id_pk CHECK (MBR_ID LIKE 'MBR%'),
MBR_FNAME varchar(15) NOT NULL,
MBR_MNAME varchar(15),
MBR_LNAME varchar(15) NOT NULL,
MBR_GENDER char(6) NOT NULL CONSTRAINT mbr_gender_chk CHECK (MBR_GENDER IN ('Male','Female')),
MBR_DOB DateTime,
MBR_MARITAL_STAT varchar(10)  NOT NULL CONSTRAINT mbr_mar_stat_chk CHECK (MBR_MARITAL_STAT IN ('Single','Married')),
MBR_ANN DateTime,
MBR_ADDRESS1 varchar(50),
MBR_ADDRESS2 varchar(50),
MBR_CITY varchar(25),
MBR_STATE varchar(25),
MBR_POSTAL varchar(10),
MBR_COUNTRY varchar(25),
MBR_FACEBOOK varchar(30),
MBR_TWITTER varchar(30),
MBR_MOBILE varchar(10),
MBR_TELEPHONE varchar(10),
MBR_EMAIL varchar(50)
)
--select md.MBR_ID, isnull(md.MBR_FNAME,''), isnull(md.MBR_MNAME,''), isnull(md.MBR_LNAME,''), isnull(md.MBR_GENDER,''), isnull(md.MBR_DOB,''), isnull(md.MBR_ANN,''), isnull(md.MBR_ADDRESS1,''), isnull(md.MBR_ADDRESS2,''), isnull(md.MBR_ADDRESS3,''), isnull(md.MBR_CITY,''), isnull(md.MBR_STATE,''), isnull(md.MBR_POSTAL,''), isnull(md.MBR_COUNTRY,''), isnull(md.MBR_FACEBOOK,''), isnull(md.MBR_TWITTER,''), isnull(md.MBR_MOBILE,''), isnull(md.MBR_TELEPHONE,''), isnull(md.MBR_EMAIL,''), isnull( msd.MBR_DOJ,''), isnull( msd.MBRD_OWNER_ID,''), isnull( msd.MBRD_CREATED_BY,''), isnull( msd.MBRD_NATIONAL_CARD_ID,''), isnull( msd.MBRD_SOURCE,''), isnull( msd.MBRD_ENQUIRY_TYPE,''), isnull( msd.MBRD_NATIONALITY,''), isnull( msd.MBRD_STATUS,'') from MEMBER_DETAILS md left join MEMBERSHIP_DETAILS msd on md.MBR_Id=msd.MBR_Id
select * from MEMBERSHIP_DETAILS
--insert into MEMBER_DETAILS(MBR_ID,MBR_FNAME,MBR_MNAME,MBR_LNAME,MBR_GENDER,MBR_DOB,MBR_ANN,MBR_ADDRESS1,MBR_ADDRESS2,MBR_ADDRESS3,MBR_CITY,MBR_STATE,MBR_POSTAL,MBR_COUNTRY,MBR_FACEBOOK,MBR_TWITTER,MBR_MOBILE,MBR_TELEPHONE,MBR_EMAIL)values('MBR0000001','Imitu','lklk','asddw','Male','yyyy/MM/dd03:00:27 AM','yyyy/MM/dd03:00:27 AM','12sadas','13adqw','12azxca','Mumbai','Maharastra','401107','India','asdasd','System.Windows.Forms.TextBox, Text: qeqw','32653691','System.Windows.Forms.TextBox, Text: 20555','asdasd')

--insert into MEMBER_DETAILS(MBR_ID,MBR_FNAME,MBR_MNAME,MBR_LNAME,MBR_GENDER,MBR_DOB,MBR_ANN,MBR_ADDRESS1,MBR_ADDRESS2,MBR_ADDRESS3,MBR_CITY,MBR_STATE,MBR_POSTAL,MBR_COUNTRY,MBR_FACEBOOK,MBR_TWITTER,MBR_MOBILE,MBR_TELEPHONE,MBR_EMAIL)values('MBR_0001','Imtiyaz','Niyaz','Doctor','Male','2011/04/8','2011/04/8','adress','address','address','Mumbai','Maharastra','401107','India','imtiyazz27@gmail.com',null,null,'9967002','iahmed27@yahoo.com')


--------------- MEMBERSHIP DETAILS TABLE ---------------
CREATE  TABLE MEMBERSHIP_DETAILS
(
MBR_ID varchar(10) NOT NULL CONSTRAINT mbr_id_fk REFERENCES MEMBER_DETAILS(MBR_ID),
MBR_DOJ DateTime,
MBRD_OWNER_ID varchar(10), -- NOT NULL CONSTRAINT owner_id_fk REFERENCES EMPLOYEE_DETAILS(EMP_ID),
MBRD_CREATED_BY varchar(30),
MBRD_NATIONAL_CARD_ID varchar(20),
MBRD_SOURCE varchar(50),
MBRD_ENQUIRY_TYPE varchar(50) NOT NULL CONSTRAINT enquiry_type_chk CHECK (MBRD_ENQUIRY_TYPE IN ('Phone','Walk-In','Website','Member','Referral','POS','Referral','Facebook')), --REM
MBRD_NATIONALITY varchar(20),
MBRD_STATUS varchar(10) NOT NULL CONSTRAINT mbrd_status_chk CHECK (MBRD_STATUS IN ('ACTIVE','INACTIVE'))
)

-- SELECT * FROM MEMBERSHIP_DETAILS
-- DROP TABLE MEMBERSHIP_DETAILS

--------------- MEMBERSHIP Plan TABLE ---------------
CREATE  TABLE MEMBERSHIP_PLAN_DETAILS
(
MBR_ID varchar(10) NOT NULL CONSTRAINT mbr_plan_fk REFERENCES MEMBER_DETAILS(MBR_ID),
MBR_PLAN_ID varchar(10)NOT NULL CONSTRAINT mbr_planmstr_fk REFERENCES PLAN_MSTR(PLAN_ID),
MBR_PLAN_STARTDATE DateTime,
MBR_PLAN_ENDDATE DateTime,
)

-- SELECT * FROM MEMBERSHIP_DETAILS
-- DROP TABLE MEMBERSHIP_PLAN_DETAILS

CREATE TABLE MEMBERSHIP_ADDON_DETAILS
(
MBR_ID varchar(10) NOT NULL CONSTRAINT mbr_add_fk REFERENCES MEMBER_DETAILS(MBR_ID),
MBR_ADDON_ID varchar(10) NOT NULL CONSTRAINT mbr_addmstr_fk REFERENCES ADDON_MSTR(ADDON_ID),
MBR_ADDON_STARTDATE DateTime,
MBR_ADDON_ENDDATE DateTime,
)

-- SELECT * FROM MEMBERSHIP_DETAILS
-- DROP TABLE MEMBERSHIP_DETAILS


drop table MEMBERSHIP_ADDON_DETAILS
--------------- MEMBERSHIP HISTORY TABLE ---------------
CREATE TABLE MEMBERSHIP_HIST
(
MBR_ID varchar(10) NOT NULL CONSTRAINT mbr_hist_fk REFERENCES MEMBER_DETAILS(MBR_ID),
MBR_PLAN_ID varchar(10) NOT NULL CONSTRAINT mbr_planmstr_fk REFERENCES PLAN_MSTR(PLAN_ID),
MBR_OLD_STARTDATE DateTime,
MBR_OLD_ENDDATE DateTime,
MBR_ADDON_STARTDATE DateTime,
MBR_ADDON_ENDDATE DateTime,
MBR_TOTAL_AMOUNT money
)

--------------- MEMBERSHIP PAYMENT TABLE ---------------
CREATE  TABLE MEMBERSHIP_PYMT
(
MBR_ID varchar(10) NOT NULL CONSTRAINT mbr_pymt_fk REFERENCES MEMBER_DETAILS(MBR_ID),
PYMT_DATE DateTime,
TOTAL_AMOUNT money,
DISC_PERCENTAGE decimal(9,2),
DISC_AMOUNT money,
AMOUNT_PAYABLE money,
AMOUNT_PAYED money,
BALANCE_AMOUNT money,
PAYMENT_INSTRUMENT varchar(20), --REM,
PAYMENT_STATUS varchar(10),
PAYMENT_FOLLOWUP DateTime
)

-- SELECT * FROM MEMBERSHIP_PYMT
-- DROP TABLE MEMBERSHIP_PYMT

--------------- MEMBERSHIP PAYMENT HISTORY TABLE -------
CREATE   TABLE MEMBERSHIP_PYMT_HIST
(
MBR_ID varchar(10) NOT NULL CONSTRAINT mbr_pymt_hist_fk REFERENCES MEMBER_DETAILS(MBR_ID),
PYMT_DATE DateTime,
TOTAL_AMOUNT money,
DISC_PERCENTAGE decimal(9,2),
DISC_AMOUNT money,
AMOUNT_PAYABLE money,
AMOUNT_PAYED money,
BALANCE_AMOUNT money,
PAYMENT_INSTRUMENT varchar,
PAYMENT_STATUS varchar(10),
)

-- SELECT * FROM MEMBERSHIP_PYMT_HIST
-- DROP TABLE MEMBERSHIP_PYMT_HIST

CREATE TABLE PYMT_BY_CREDITCARD
(
CARD_NUMBER varchar(16) CONSTRAINT cc_num_pk PRIMARY KEY,
MBR_ID varchar(10) NOT NULL CONSTRAINT mbr_id_cc_fk REFERENCES MEMBER_DETAILS(MBR_ID),
DATE_FROM DateTime,
DATE_TO DateTime,
ACCEPT_CODE varchar(6),
OTHER_DETAIL varchar(50)
)

-- SELECT * FROM PYMT_BY_CREDITCARD
-- DROP TABLE PYMT_BY_CREDITCARD

CREATE TABLE PYMT_BY_CHEQUE
(
CHQ_ID varchar(12) CONSTRAINT chq_id_pk PRIMARY KEY,
MBR_ID varchar(10) NOT NULL CONSTRAINT mbr_id_chq_fk REFERENCES MEMBER_DETAILS(MBR_ID),
CHQ_REF varchar(6),
CHQ_DATE DateTime,
CHQ_AMOUNT money,
BANK_NAME varchar(50),
BANK_BRANCH  varchar(25),
)

-- SELECT * FROM PYMT_BY_CREDITCARD
-- DROP TABLE PYMT_BY_CREDITCARD

--------------- MEMBER_MEASUREMENTS TABLE ---------------
CREATE TABLE MEMBER_MEASUREMENTS
(
MBR_ID varchar(10) NOT NULL CONSTRAINT mbr_measurements_fk REFERENCES MEMBER_DETAILS(MBR_ID),
WEIGHT float,
SHOULDERS float,
BUST float,
ARM float,
CHEST float,
WAIST float,
HIPS float,
GLUTEALS float,
UPPER_THIGH float,
MID_THIGH float,
CALF float,
BICEP float,
TRICEP float,
SUBSCAPULAR float,
ILIAC float,
CREST float,
BODY_FAT float,
FAT_MASS float,
LEAN_MASS float,
BODY_MASS_INDEX float,
MAX_OXYGEN_UPTAKE float
)

-- SELECT * FROM MEMBER_MEASUREMENTS
-- DROP TABLE MEMBER_MEASUREMENTS

--------------------------------------------------------
--#################### SITE DETAILS ##################--
--------------------------------------------------------

CREATE TABLE LOCATION
(
LOCATION_ID varchar(3),
STREET_ADDRESS varchar(40),
POSTAL_CODE varchar(12),
CITY varchar(30),
STATE_PROVINCE varchar(25),
COUNTRY_NAME varchar(25)
)

-- SELECT * FROM LOCATION
-- DROP TABLE LOCATION

CREATE TABLE JOBS
(
JOB_ID varchar(5),
JOB_TITLE varchar(35),
MIN_SALARY int(6),
MAX_SALARY int(6),
)

-- SELECT * FROM JOBS
-- DROP TABLE JOBS

CREATE TABLE DEPARTMENT
(
DEPARTMENT_ID int(4)
DEPARTMENT_NAME varchar(30)
MANAGER_ID int(6)
LOCATION_ID varchar(3)
)

-- SELECT * FROM DEPARTMENT
-- DROP TABLE DEPARTMENT


--------------------------------------------------------
--#################### EMPLOYEE ######################--
--------------------------------------------------------

--------------- EMPLOYEE_DETAILS TABLE ----------------
CREATE  TABLE EMPLOYEE_DETAILS
(
EMP_ID varchar(10) PRIMARY KEY NOT NULL CONSTRAINT EMP_id_pk CHECK (EMP_ID LIKE 'MBR%'),
EMP_FNAME varchar(15) NOT NULL,
EMP_MNAME varchar(15),
EMP_LNAME varchar(15) NOT NULL,
EMP_GENDER char(6) NOT NULL CONSTRAINT EMP_gender_chk CHECK (EMP_GENDER IN ('Male','Female')),
EMP_DOB DateTime,
EMP_MARITAL_STAT varchar(10),
EMP_ANN DateTime,
EMP_ADDRESS1 varchar(50),
EMP_ADDRESS2 varchar(50),
EMP_CITY varchar(25),
EMP_STATE varchar(25),
EMP_POSTAL varchar(10),
EMP_COUNTRY varchar(25),
EMP_FACEBOOK varchar(30),
EMP_TWITTER varchar(30),
EMP_MOBILE varchar(10),
EMP_TELEPHONE varchar(10),
EMP_EMAIL varchar(50)
)

-- SELECT * FROM EMPLOYEE_DETAILS
-- DROP TABLE EMPLOYEE_DETAILS

--------------------------------------------------------
--#################### MANAGEMENT ####################--
--------------------------------------------------------

CREATE TABLE EMPLOYMENT_DETAILS
(
EMP_ID
JOB_ID
HIRE_DATE Datetime,
SALARY
COMMISSION
MANAGER_ID
DEPARTMENT_ID
)



CREATE TABLE LOGIN
(

)

--------------- FOLLOWUP TABLE ----------------
CREATE TABLE FOLLOWUP
(
FOLLOWUP_ID varchar(10) NOT NULL CONSTRAINT enq_id_fk REFERENCES ENQUIRY_DETAILS(ENQ_ID,M_ID),
FOLLOWUP_TYPE varchar(40),
FOLLOWUP_STATUS varchar(6) CONSTRAINT followup_status_chk CHECK (FOLLOWUP_STATUS IN ('OPEN','CLOSED')),
LAST_FOLLOWUP_DATE Datetime,
NEXT_FOLLOWUP_DATE Datetime,
PRIORITY varchar(9) CONSTRAINT followup_priority_chk CHECK (PRIORITY IN ('VERY HIGH','HIGH','MEDIUM','LOW','VERY LOW')),
EMP_ID varchar(10) NOT NULL CONSTRAINT emp_id_fk REFERENCES EMPLOYEE_MSTR(EMP_ID),
RESPONSE varchar() 
COMMENTS varchar(500)
)

-- SELECT * FROM ENQUIRY_FOLLOWUP
-- DROP TABLE ENQUIRY_FOLLOWUP


--------------- ADDIIONAL PAYMENT TABLE ----------------
CREATE TABLE ADDITIONAL_PAYMENT
(
Service_Tax double,
Miscellaneous_Charges double,
Transfer_Charges double,
Registration_Charges double,
Lost_Locker_Key_Charges double,
Refundable_Locker_Deposit double,
Cheque_Bounce_Charges double,
Credit_card_charges double,
Cheque_Dishonour_charges double,
Lost_Nutrition_File_Charges double,
Locker_Deposit_Charges double,
Locker_Charges double,
PDC_Deposit double
)

-- SELECT * FROM ADDIIONAL_PAYMENT
-- DROP TABLE ADDIIONAL_PAYMENT