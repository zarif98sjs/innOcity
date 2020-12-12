/*
 Navicat Premium Data Transfer

 Source Server         : INNOCITY
 Source Server Type    : Oracle
 Source Server Version : 110200
 Source Schema         : INNOCITY

 Target Server Type    : Oracle
 Target Server Version : 110200
 File Encoding         : 65001

 Date: 09/12/2020 00:46:44
*/


-- ----------------------------
-- Table structure for CREDIT_CARD
-- ----------------------------
DROP TABLE "INNOCITY"."CREDIT_CARD";
CREATE TABLE "INNOCITY"."CREDIT_CARD" (
  "CARD_NUMBER" NUMBER NOT NULL,
  "CARD_USERNAME" VARCHAR2(50 BYTE),
  "CARD_TYPE" VARCHAR2(50 BYTE),
  "CVC" NUMBER,
  "EXPIRATION" DATE,
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
-- Records of CREDIT_CARD
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table CREDIT_CARD
-- ----------------------------
ALTER TABLE "INNOCITY"."CREDIT_CARD" ADD CONSTRAINT "CREDIT_CARD_PK" PRIMARY KEY ("CARD_NUMBER");

-- ----------------------------
-- Foreign Keys structure for table CREDIT_CARD
-- ----------------------------
ALTER TABLE "INNOCITY"."CREDIT_CARD" ADD CONSTRAINT "CREDIT_CARD_FK" FOREIGN KEY ("CUSTOMERID") REFERENCES "INNOCITY"."CUSTOMER" ("CUSTOMERID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
