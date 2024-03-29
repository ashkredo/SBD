--    This SQL DDL script was generated by Microsoft Visual Studio (Release Date: LOCAL BUILD).

--    Driver Used : Microsoft Visual Studio - Oracle Server Driver.
--    Document    : C:\Users\s15444\Downloads\Hotel.vsd.
--    Time Created: 10 January 2018 13:38.
--    Operation   : From Visio Generate Wizard.
--    Connected data source : No connection.
--    Connected server      : No connection.
--    Connected database    : Not applicable.



-- Create Hotel database.
--connect internal ;
--startup nomount pfile=   ;
--spool create_db_Hotel ;

--create database HOTEL;

--create rollback segment Hotel_r0 tablespace system ;

--alter rollback segment  Hotel_r0 online ;

-- Create Oracle exception file.
--create table exceptions ( row_id rowid, owner varchar2(30), table_name varchar2(30), constraint varchar2(30)) ;


-- Create new table "ORDER".
-- "ORDER" : Table of Order
-- 	ORDER_ID : Order_id identifies Order
-- 	OSOBA_ID : Osoba_Id partly identifies Order
-- 	MEAL_ID : Meal_id partly identifies Order
-- 	DATE_TIME : Date_time is of Order  
create table "ORDER" (
	ORDER_ID NUMBER(38,0) not null,
	OSOBA_ID NUMBER(38,0) not null,
	MEAL_ID NUMBER(38,0) not null,
	DATE_TIME DATE null, constraint ORDER_PK primary key (ORDER_ID, OSOBA_ID, MEAL_ID) ); 

-- Create new table MEAL.
-- MEAL : Table of Meal
-- 	MEAL_ID : Meal_id identifies Meal
-- 	NAME : Name is of Meal
-- 	COST : Cost is of Meal  
create table MEAL (
	MEAL_ID NUMBER(38,0) not null,
	NAME VARCHAR2(30) not null,
	COST NUMBER(38,0) not null, constraint MEAL_PK primary key (MEAL_ID) );

-- Create new table ACTIVITY.
-- ACTIVITY : Table of Activity
-- 	NAME : Name is of Activity
-- 	"DATE" : Date is of Activity
-- 	ROOM_ID : Room_id identifies Activity
-- 	OSOBA_ID : Osoba_Id partly identifies Activity
-- 	ACTIVITY_ID : Activity_id partly identifies Activity  
create table ACTIVITY (
	NAME VARCHAR2(30) not null,
	"DATE" DATE null,
	ROOM_ID NUMBER(38,0) not null,
	OSOBA_ID NUMBER(38,0) not null,
	ACTIVITY_ID NUMBER(38,0) not null, constraint ACTIVITY_PK primary key (ROOM_ID, OSOBA_ID, ACTIVITY_ID) );

-- Create new table OSOBA.
-- OSOBA : Table of Osoba
-- 	OSOBA_ID : Osoba_Id identifies Osoba
-- 	NAME : Name is of Osoba
-- 	SURNAME : Surname is of Osoba  
create table OSOBA (
	OSOBA_ID NUMBER(38,0) not null,
	NAME VARCHAR2(30) not null,
	SURNAME VARCHAR2(30) not null, constraint OSOBA_PK primary key (OSOBA_ID) ); 

-- Create new table WORKER.
-- WORKER : Table of Worker
-- 	OSOBA_ID : Osoba_Id identifies Worker
-- 	"POSITION" : Position is of Worker
-- 	SALARY : Salary is of Worker  
create table WORKER (
	OSOBA_ID NUMBER(38,0) not null,
	"POSITION" VARCHAR2(10) null,
	SALARY NUMBER null, constraint WORKER_PK primary key (OSOBA_ID) ); 

-- Create new table VISIT.
-- VISIT : Table of Visit
-- 	DATEFROM : DateFrom is of Visit
-- 	DATETO : DateTo is of Visit
-- 	COST : Cost is of Visit
-- 	OSOBA_ID : Osoba_Id identifies Visit
-- 	ROOM_ID : Room_id partly identifies Visit
-- 	VISIT_ID : Visit_id partly identifies Visit  
create table VISIT (
	DATEFROM DATE not null,
	DATETO DATE null,
	COST VARCHAR2(10) null,
	OSOBA_ID NUMBER(38,0) not null,
	ROOM_ID NUMBER(38,0) not null,
	VISIT_ID NUMBER(38,0) not null, constraint VISIT_PK primary key (OSOBA_ID, ROOM_ID, VISIT_ID) );

-- Create new table ROOM.
-- ROOM : Table of Room
-- 	ROOM_ID : Room_id identifies Room
-- 	NUMBER : Number is of Room
-- 	STATUS : Status is of Room  
create table ROOM (
	ROOM_ID NUMBER(38,0) not null,
	NUMBERs NUMBER(38,0) not null,
	STATUS VARCHAR2(20) null, constraint ROOM_PK primary key (ROOM_ID) ); 

-- Create new table KLIENT.
-- KLIENT : Table of Klient
-- 	OSOBA_ID : Osoba_Id identifies Klient
-- 	PHONE_NUMBER : Phone_number is of Klient
-- 	EMAIL : Email is of Klient
-- 	ADRESS : Adress is of Klient  
create table KLIENT (
	OSOBA_ID NUMBER(38,0) not null,
	PHONE_NUMBER VARCHAR2(12) not null,
	EMAIL VARCHAR2(30) null,
	ADRESS VARCHAR2(50) null, constraint KLIENT_PK primary key (OSOBA_ID) ); 

-- Add foreign key constraints to table "ORDER".
alter table "ORDER"
	add constraint KLIENT_ORDER_FK1 foreign key (
		OSOBA_ID)
	 references KLIENT (
		OSOBA_ID); 

alter table "ORDER"
	add constraint MEAL_ORDER_FK1 foreign key (
		MEAL_ID)
	 references MEAL (
		MEAL_ID); 

-- Add foreign key constraints to table ACTIVITY.
alter table ACTIVITY
	add constraint ROOM_ACTIVITY_FK1 foreign key (
		ROOM_ID)
	 references ROOM (
		ROOM_ID); 

alter table ACTIVITY
	add constraint WORKER_ACTIVITY_FK1 foreign key (
		OSOBA_ID)
	 references WORKER (
		OSOBA_ID); 

-- Add foreign key constraints to table WORKER.
alter table WORKER
	add constraint OSOBA_WORKER_FK1 foreign key (
		OSOBA_ID)
	 references OSOBA (
		OSOBA_ID); 

-- Add foreign key constraints to table VISIT.
alter table VISIT
	add constraint KLIENT_VISIT_FK1 foreign key (
		OSOBA_ID)
	 references KLIENT (
		OSOBA_ID); 

alter table VISIT
	add constraint ROOM_VISIT_FK1 foreign key (
		ROOM_ID)
	 references ROOM (
		ROOM_ID); 

-- Add foreign key constraints to table KLIENT.
alter table KLIENT
	add constraint OSOBA_KLIENT_FK1 foreign key (
		OSOBA_ID)
	 references OSOBA (
		OSOBA_ID); 


-- This is the end of the Microsoft Visual Studio generated SQL DDL script.
