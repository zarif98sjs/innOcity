/*
 Navicat Premium Data Transfer

 Source Server         : INNOCITY
 Source Server Type    : Oracle
 Source Server Version : 110200
 Source Schema         : INNOCITY

 Target Server Type    : Oracle
 Target Server Version : 110200
 File Encoding         : 65001

 Date: 07/12/2020 00:22:10
*/


-- ----------------------------
-- Table structure for RESERVATION_SERVICE
-- ----------------------------
DROP TABLE "INNOCITY"."RESERVATION_SERVICE";
CREATE TABLE "INNOCITY"."RESERVATION_SERVICE" (
  "RESERVATIONID" NUMBER,
  "SERVICEID" NUMBER,
  "QUANTITY" NUMBER
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
-- Records of RESERVATION_SERVICE
-- ----------------------------
INSERT INTO "INNOCITY"."RESERVATION_SERVICE" VALUES ('62764004', '82496400', '2');
INSERT INTO "INNOCITY"."RESERVATION_SERVICE" VALUES ('62764004', '92441497', '2');
INSERT INTO "INNOCITY"."RESERVATION_SERVICE" VALUES ('62764004', '85581825', '2');
INSERT INTO "INNOCITY"."RESERVATION_SERVICE" VALUES ('62764004', '72677491', '2');
INSERT INTO "INNOCITY"."RESERVATION_SERVICE" VALUES ('66045154', '32909631', '2');
INSERT INTO "INNOCITY"."RESERVATION_SERVICE" VALUES ('66045154', '17667341', '1');
INSERT INTO "INNOCITY"."RESERVATION_SERVICE" VALUES ('71773196', '62705453', '2');
INSERT INTO "INNOCITY"."RESERVATION_SERVICE" VALUES ('71773196', '72735485', '2');
INSERT INTO "INNOCITY"."RESERVATION_SERVICE" VALUES ('27977054', '82496400', '2');
INSERT INTO "INNOCITY"."RESERVATION_SERVICE" VALUES ('27977054', '85581825', '1');

-- ----------------------------
-- Foreign Keys structure for table RESERVATION_SERVICE
-- ----------------------------
ALTER TABLE "INNOCITY"."RESERVATION_SERVICE" ADD CONSTRAINT "SYS_C0016006" FOREIGN KEY ("SERVICEID") REFERENCES "INNOCITY"."SERVICE" ("SERVICEID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "INNOCITY"."RESERVATION_SERVICE" ADD CONSTRAINT "SYS_C0016007" FOREIGN KEY ("RESERVATIONID") REFERENCES "INNOCITY"."RESERVATION" ("RESERVATIONID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
