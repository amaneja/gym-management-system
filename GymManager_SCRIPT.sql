CREATE DATABASE GymManager

USE GymManager

--------------------------------------------------------
--#################### ENQUIRY ####################--
--------------------------------------------------------

--------------- ENQUIRY_DETAILS TABLE ----------------
CREATE TABLE ENQUIRY_DETAILS
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
CREATE TABLE PLAN_MSTR
(
PLAN_ID varchar(10) PRIMARY KEY NOT NULL CONSTRAINT plan_id_pk CHECK (PLAN_ID LIKE 'PLN%'),
PLAN_NAME
PLAN_DESCRIPTION vacrhar(200),
PLAN_AMOUNT money,
PLAN_DURATION varchar(20) CONSTRAINT plan_duration_chk CHECK (PLAN_DURATION IN('MONTHLY','QUARTERLY','HALF-YEARLY','YEARLY','3-YEARLY','5-YEARLY')),
)

--------------- ADD-ON MASTER TABLE ----------------------
CREATE TABLE ADDON_MSTR
(
ADDON_ID 
ADDON_NAME
ADDON_DESCRIPTION
ADDON_AMOUNT_MONTHLY money
ADDON_AMOUNT_QUARTERLY money
ADDON_AMOUNT_HALF_YEARLY money
ADDON_AMOUNT_YEARLY money
ADDON_AMOUNT_3YEARLY money
ADDON_AMOUNT_5YEARLY money
)


--------------------------------------------------------
--#################### MEMBERSHIP ####################--
--------------------------------------------------------


--------------- MEMBER_DETAILS TABLE ----------------
CREATE TABLE MEMBER_DETAILS
(
MBR_ID varchar(10) PRIMARY KEY NOT NULL CONSTRAINT MBR_id_pk CHECK (MBR_ID LIKE 'MBR%'),
MBR_FNAME varchar(15) NOT NULL,
MBR_MNAME varchar(15),
MBR_LNAME varchar(15) NOT NULL,
MBR_GENDER char(6) NOT NULL CONSTRAINT mbr_gender_chk CHECK (MBR_GENDER IN ('Male','Female')),
MBR_DOB DateTime,
MBR_ANN DateTime,
MBR_ADDRESS1 varchar(50),
MBR_ADDRESS2 varchar(50),
MBR_ADDRESS3 varchar(50),
MBR_CITY varchar(25),
MBR_STATE varchar(25),
MBR_POSTAL varchar(10),
MBR_COUNTRY varchar(25),
MBR_FACEBOOK varchar(30),
MBR_TWITTER varchar(30),
MBR_MOBILE varchar(10),
MBR_TELEPHONE varchar(8),
MBR_EMAIL varchar(50),
)

--------------- MEMBERSHIP DETAILS TABLE ---------------
CREATE TABLE MEMBERSHIP_DETAILS
(
MBR_ID varchar(10) NOT NULL CONSTRAINT mbr_id_fk REFERENCES MEMBER_DETAILS(MBR_ID)
MBR_PLAN_ID varchar(50), --REM
MBR_DOJ DateTime,
MBR_PLAN_STARTDATE DateTime,
MBR_PLAN_ENDDATE DateTime,
MBR_ADDON_STARTDATE DateTime,
MBR_ADDON_ENDDATE DateTime,
MBRD_OWNER_ID varchar(10)  NOT NULL CONSTRAINT owner_id_fk REFERENCES EMPLOYEE_DETAILS(EMP_ID),
MBRD_CREATED_BY varchar(30),
MBRD_NATIONAL_CARD_ID varchar(20),
MBRD_SOURCE varchar(50),
MBRD_ENQUIRY_TYPE varchar(50) NOT NULL CONSTRAINT enquiry_type_chk CHECK (MBR_GENDER IN ('Phone','Walk-In','Website','Member','Referral','POS','Referral','Facebook') --REM
MBRD_NATIONALITY varchar(20)
MBRD_TOTAL_AMOUNT money,
MBRD_STATUS varchar() NOT NULL CONSTRAINT mbrd_status_chk CHECK (MBRD_STATUS IN ('ACTIVE','INACTIVE')
)

-- SELECT * FROM MEMBERSHIP_DETAILS
-- DROP TABLE MEMBERSHIP_DETAILS


--------------- MEMBERSHIP HISTORY TABLE ---------------
CREATE TABLE MEMBERSHIP_HIST
(
MBR_ID varchar(10) NOT NULL CONSTRAINT mbr_id_fk REFERENCES MEMBER_DETAILS(MBR_ID)
MBR_PLAN_ID varchar(50), --REM
MBR_OLD_STARTDATE DateTime,
MBR_OLD_ENDDATE DateTime,
MBR_ADDON_STARTDATE DateTime,
MBR_ADDON_ENDDATE DateTime,
MBR_TOTAL_AMOUNT money
)

--------------- MEMBERSHIP PAYMENT TABLE ---------------
CREATE TABLE MEMBERSHIP_PYMT
(
MBR_ID varchar(10) NOT NULL CONSTRAINT mbr_id_fk REFERENCES MEMBER_DETAILS(MBR_ID),
PLAN_ID
PYMT_DATE DateTime,
TOTAL_AMOUNT 
DISC_PERCENTAGE double,
DISC_AMOUNT money,
AMOUNT_PAYABLE money,
AMOUNT_PAYED money,
BALANCE_AMOUNT money
)

--------------- MEMBERSHIP PAYMENT HISTORY TABLE -------
CREATE TABLE MEMBERSHIP_PYMT_HIST
(
MBR_ID varchar(10) NOT NULL CONSTRAINT mbr_id_fk REFERENCES MEMBER_DETAILS(MBR_ID),
PLAN_ID
PYMT_DATE DateTime,
TOTAL_AMOUNT 
DISC_PERCENTAGE double,
DISC_AMOUNT money,
AMOUNT_PAYABLE money,
AMOUNT_PAYED money,
BALANCE_AMOUNT money
)

--------------- MEMBERSHIP PHYSIC TABLE ---------------
CREATE TABLE MEMBERSHIP_PHYSC
(
MBR_ID
MBRD_HEIGHT varchar(5),
MBRD_WEIGHT varchar(3),
)

--------------------------------------------------------
--#################### EMPLOYEE ######################--
--------------------------------------------------------


--------------- EMPLOYEE_MASTER TABLE ----------------
CREATE TABLE EMPLOYEE_MSTR
(

)

--------------- MEMBERSHIP DETAILS TABLE ---------------
CREATE TABLE EMPLOYEE_DETAILS
(

)

--------------------------------------------------------
--#################### MANAGEMENT ####################--
--------------------------------------------------------

CREATE TABLE LOGIN
(

)

--------------- FOLLOWUP TABLE ----------------
CREATE TABLE FOLLOWUP
(
FOLLOWUP_ID varchar(10) NOT NULL CONSTRAINT enq_id_fk REFERENCES ENQUIRY_DETAILS(ENQ_ID,M_ID),
FOLLOWUP_TYPE varchar(40),
LAST_FOLLOWUP_DATE Datetime,
NEXT_FOLLOWUP_DATE Datetime,
PRIORITY varchar(9) CONSTRAINT followup_priority_chk CHECK (PRIORITY IN ('VERY HIGH','HIGH','MEDIUM','LOW','VERY LOW')),
EMP_ID varchar(10) NOT NULL CONSTRAINT emp_id_fk REFERENCES EMPLOYEE_MSTR(EMP_ID),
RESPONSE varchar() 
COMMENTS varchar(500)
)

-- SELECT * FROM ENQUIRY_FOLLOWUP
-- DROP TABLE ENQUIRY_FOLLOWUP
