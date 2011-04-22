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
ENQ_EMAIL varchar(50),
ENQ_STATUS varchar(15) CONSTRAINT enq_status_chk CHECK (ENQ_STATUS IN ('CONFIRMED','UNCONFIRMED','PENDING'))
)

-- SELECT * FROM ENQUIRY_DETAILS
-- DROP TABLE ENQUIRY_DETAILS CASCADE

--------------- ENQUIRY_FOLLOWUP TABLE ----------------
CREATE TABLE ENQUIRY_FOLLOWUP
(
FOLLOWUP_ID varchar(10) NOT NULL CONSTRAINT enq_id_fk REFERENCES ENQUIRY_DETAILS(ENQ_ID,M_ID),
FOLLOWUP_TYPE varchar CONSTRAINT followup_priority_chk CHECK (PRIORITY IN ('VERY HIGH','HIGH','MEDIUM','LOW','VERY LOW')),
LAST_FOLLOWUP_DATE Datetime,
NEXT_FOLLOWUP_DATE Datetime,
PRIORITY varchar(9) CONSTRAINT followup_priority_chk CHECK (PRIORITY IN ('VERY HIGH','HIGH','MEDIUM','LOW','VERY LOW')),
EMP_ID varchar(10) NOT NULL CONSTRAINT emp_id_fk REFERENCES EMPLOYEE_MSTR(EMP_ID),
RESPONSE varchar() 
COMMENTS varchar(500)
)

-- SELECT * FROM ENQUIRY_FOLLOWUP
-- DROP TABLE ENQUIRY_FOLLOWUP

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

--------------- MEMBERSHIP FOLLOWUP TABLE ---------------
CREATE TABLE MEMBERSHIP_FOLLOWUP
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
