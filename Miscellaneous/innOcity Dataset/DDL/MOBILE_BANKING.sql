/*
 Navicat Premium Data Transfer

 Source Server         : INNOCITY
 Source Server Type    : Oracle
 Source Server Version : 110200
 Source Schema         : INNOCITY

 Target Server Type    : Oracle
 Target Server Version : 110200
 File Encoding         : 65001

 Date: 09/12/2020 00:47:28
*/


-- ----------------------------
-- Table structure for MOBILE_BANKING
-- ----------------------------
DROP TABLE "INNOCITY"."MOBILE_BANKING";
CREATE TABLE "INNOCITY"."MOBILE_BANKING" (
  "PHONE_NUMBER" NUMBER NOT NULL,
  "SERVICE_PROVIDER" VARCHAR2(50 BYTE),
  "CUSTOMERID" NUMBER
)
TABLESPACE "INNOCITY_TABSPACE"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of MOBILE_BANKING
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table MOBILE_BANKING
-- ----------------------------
ALTER TABLE "INNOCITY"."MOBILE_BANKING" ADD CONSTRAINT "MOBILE_BANKING_PK" PRIMARY KEY ("PHONE_NUMBER");

-- ----------------------------
-- Foreign Keys structure for table MOBILE_BANKING
-- ----------------------------
ALTER TABLE "INNOCITY"."MOBILE_BANKING" ADD CONSTRAINT "MOBILE_BANKING_FK" FOREIGN KEY ("CUSTOMERID") REFERENCES "INNOCITY"."CUSTOMER" ("CUSTOMERID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
