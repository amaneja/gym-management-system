CREATE DATABASE GymManager

USE GymManager

--------------------------------------------------------
--#################### ENQUIRY ####################--
--------------------------------------------------------

--------------- ENQUIRY_DETAILS TABLE ----------------
CREATE TABLE ENQUIRY_DETAILS
(
ENQ_ID varchar(10) PRIMARY KEY NOT NULL CONSTRAINT enq_id_pk CHECK (ENQ_ID LIKE 'ENQ%'),
ENQ_FNAME varchar(15) NOT NULL,
ENQ_MNAME varchar(15),
ENQ_LNAME varchar(15) NOT NULL,
ENQ_MOBILE varchar(10),
ENQ_TELEPHONE varchar(8),
ENQ_EMAIL 
ENQ_STATUS varchar(15) CONSTRAINT enq_status_chk CHECK (ENQ_STATUS IN ('CONFIRMED','UNCONFIRMED','PENDING'))
)

-- SELECT * FROM ENQUIRY_DETAILS
-- DROP TABLE ENQUIRY_DETAILS

--------------- ENQUIRY_FOLLOWUP TABLE ----------------
CREATE TABLE ENQUIRY_FOLLOWUP
(
ENQ_ID FOREIGN KEY NOT NULL CONSTRAINT enq_id_fk REFERENCES ENQ_DETAILS(ENQ_ID),
FOLLOWUP_DATE Date
FOLLOWUP_VIA
COMMENTS
)

--------------------------------------------------------
--#################### MEMBERSHIP ####################--
--------------------------------------------------------


--------------- MEMBERSHIP_MASTER TABLE ----------------
CREATE TABLE MEMBER_DETAILS
(

)

--------------- MEMBERSHIP DETAILS TABLE ---------------
CREATE TABLE MEMBERSHIP_DETAILS
(

)

--------------- MEMBERSHIP HISTORY TABLE ---------------
CREATE TABLE MEMBERSHIP_HIST
(

)

--------------- MEMBERSHIP PAYMENT TABLE ---------------
CREATE TABLE MEMBERSHIP_PYMT
(

)

--------------- MEMBERSHIP PAYMENT HISTORY TABLE -------
CREATE TABLE MEMBERSHIP_PYMT_HIST
(

)

--------------- MEMBERSHIP PHYSIC TABLE ---------------
CREATE TABLE MEMBERSHIP_PHYSC
(

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
--#################### PLAN ##########################--
--------------------------------------------------------


--------------- PLAN MASTER TABLE ----------------------
CREATE TABLE PLAN_MSTR
(

)

--------------- ADD-ON MASTER TABLE ----------------------
CREATE TABLE ADDON_MSTR
(

)

--------------------------------------------------------
--#################### MANAGEMENT ####################--
--------------------------------------------------------

CREATE TABLE LOGIN
(

)
