#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "m4kainth/05290561@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.cs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF


CREATE TABLE "M4KAINTH"."ALBUMS" 
   (	"ITEM_ID" NUMBER(*,0), 
	"ARTIST" VARCHAR2(60 BYTE), 
	 PRIMARY KEY ("ITEM_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE"  ENABLE, 
	 FOREIGN KEY ("ITEM_ID")
	  REFERENCES "M4KAINTH"."ITEM" ("ITEM_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;



  CREATE TABLE "M4KAINTH"."BOOKS" 
   (	"ITEM_ID" NUMBER(*,0), 
	"AUTHOR" VARCHAR2(60 BYTE), 
	 PRIMARY KEY ("ITEM_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE"  ENABLE, 
	 FOREIGN KEY ("ITEM_ID")
	  REFERENCES "M4KAINTH"."ITEM" ("ITEM_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;



  CREATE TABLE "M4KAINTH"."BORROWED" 
   (	"MEMBER_ID" NUMBER(*,0), 
	"ITEM_ID" NUMBER(*,0), 
	"TRANSACTIONDATE" DATE NOT NULL ENABLE, 
	"DUEDATE" DATE NOT NULL ENABLE, 
	"LATEFEES" FLOAT(2), 
	 PRIMARY KEY ("MEMBER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "DBCOURSE"  ENABLE, 
	 FOREIGN KEY ("MEMBER_ID")
	  REFERENCES "M4KAINTH"."MEMBERS" ("MEMBER_ID") ENABLE, 
	 FOREIGN KEY ("ITEM_ID")
	  REFERENCES "M4KAINTH"."ITEM" ("ITEM_ID") ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "DBCOURSE" ;


  CREATE TABLE "M4KAINTH"."BRANCHES" 
   (	"BRANCH_ID" NUMBER(*,0), 
	"ADDRESS" VARCHAR2(40 BYTE), 
	"PROVINCE" VARCHAR2(20 BYTE) DEFAULT 'Ontario', 
	"CITY" VARCHAR2(20 BYTE) DEFAULT 'Toronto', 
	"POSTALCODE" VARCHAR2(20 BYTE), 
	"LOCATION" VARCHAR2(255 BYTE), 
	 PRIMARY KEY ("BRANCH_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;


  CREATE TABLE "M4KAINTH"."CATALOG" 
   (	"BRANCH_ID" NUMBER(*,0), 
	"ITEM_ID" NUMBER(*,0), 
	"QUANTITYONLOAN" NUMBER(*,0), 
	"QUANTITYAVAILABLE" NUMBER(*,0), 
	 FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "M4KAINTH"."BRANCHES" ("BRANCH_ID") ENABLE, 
	 FOREIGN KEY ("ITEM_ID")
	  REFERENCES "M4KAINTH"."ITEM" ("ITEM_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;


  CREATE TABLE "M4KAINTH"."COMPUTER" 
   (	"COMPUTERID" NUMBER(*,0), 
	 PRIMARY KEY ("COMPUTERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;


  CREATE TABLE "M4KAINTH"."EMPLOYEE" 
   (	"EMPLOYEE_ID" NUMBER(*,0), 
	"FNAME" VARCHAR2(20 BYTE), 
	"LNAME" VARCHAR2(20 BYTE), 
	"ADDRESS" VARCHAR2(40 BYTE), 
	"PROVINCE" VARCHAR2(20 BYTE) DEFAULT 'Ontario', 
	"CITY" VARCHAR2(20 BYTE) DEFAULT 'Toronto', 
	"POSTALCODE" VARCHAR2(20 BYTE), 
	 PRIMARY KEY ("EMPLOYEE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;


  CREATE TABLE "M4KAINTH"."ITEM" 
   (	"ITEM_ID" NUMBER(*,0), 
	"TITLE" VARCHAR2(60 BYTE), 
	"RELEASEDATE" DATE, 
	 PRIMARY KEY ("ITEM_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;


  CREATE TABLE "M4KAINTH"."MEMBERS" 
   (	"MEMBER_ID" NUMBER(*,0), 
	"JOINDATE" DATE NOT NULL ENABLE, 
	"FNAME" VARCHAR2(20 BYTE), 
	"LNAME" VARCHAR2(20 BYTE), 
	 PRIMARY KEY ("MEMBER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;


  CREATE TABLE "M4KAINTH"."MOVIES" 
   (	"DIRECTOR" VARCHAR2(60 BYTE), 
	"ITEM_ID" NUMBER, 
	 FOREIGN KEY ("ITEM_ID")
	  REFERENCES "M4KAINTH"."ITEM" ("ITEM_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;


  CREATE TABLE "M4KAINTH"."OFFERSROOM" 
   (	"BRANCH_ID" NUMBER(*,0), 
	"ROOM_ID" NUMBER(*,0), 
	 FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "M4KAINTH"."BRANCHES" ("BRANCH_ID") ENABLE, 
	 FOREIGN KEY ("ROOM_ID")
	  REFERENCES "M4KAINTH"."ROOM" ("ROOMID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;


  CREATE TABLE "M4KAINTH"."RESERVEDCOMPUTER" 
   (	"MEMBER_ID" NUMBER(*,0), 
	"COMPUTERID" NUMBER(*,0), 
	 FOREIGN KEY ("MEMBER_ID")
	  REFERENCES "M4KAINTH"."MEMBERS" ("MEMBER_ID") ENABLE, 
	 FOREIGN KEY ("COMPUTERID")
	  REFERENCES "M4KAINTH"."COMPUTER" ("COMPUTERID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;



  CREATE TABLE "M4KAINTH"."RESERVEDROOM" 
   (	"MEMBER_ID" NUMBER(*,0), 
	"ROOMID" NUMBER(*,0), 
	 FOREIGN KEY ("MEMBER_ID")
	  REFERENCES "M4KAINTH"."MEMBERS" ("MEMBER_ID") ENABLE, 
	 FOREIGN KEY ("ROOMID")
	  REFERENCES "M4KAINTH"."ROOM" ("ROOMID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;


  CREATE TABLE "M4KAINTH"."ROOM" 
   (	"ROOMID" NUMBER(*,0), 
	 PRIMARY KEY ("ROOMID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;


  CREATE TABLE "M4KAINTH"."SUPERVISES" 
   (	"SUPERVISOR" NUMBER(*,0), 
	"SUPERVISEE" NUMBER(*,0), 
	 FOREIGN KEY ("SUPERVISOR")
	  REFERENCES "M4KAINTH"."EMPLOYEE" ("EMPLOYEE_ID") ENABLE, 
	 FOREIGN KEY ("SUPERVISEE")
	  REFERENCES "M4KAINTH"."EMPLOYEE" ("EMPLOYEE_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;


  CREATE TABLE "M4KAINTH"."WORKS_FOR" 
   (	"EMPLOYEE_ID" NUMBER(*,0), 
	"BRANCH_ID" NUMBER(*,0), 
	 FOREIGN KEY ("EMPLOYEE_ID")
	  REFERENCES "M4KAINTH"."EMPLOYEE" ("EMPLOYEE_ID") ENABLE, 
	 FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "M4KAINTH"."BRANCHES" ("BRANCH_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;


exit;
EOF
