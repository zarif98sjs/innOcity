/*
 Navicat Premium Data Transfer

 Source Server         : INNOCITY
 Source Server Type    : Oracle
 Source Server Version : 110200
 Source Schema         : INNOCITY

 Target Server Type    : Oracle
 Target Server Version : 110200
 File Encoding         : 65001

 Date: 09/12/2020 00:47:03
*/


-- ----------------------------
-- Table structure for CUSTOMER
-- ----------------------------
DROP TABLE "INNOCITY"."CUSTOMER";
CREATE TABLE "INNOCITY"."CUSTOMER" (
  "CUSTOMERID" NUMBER NOT NULL,
  "NAME" VARCHAR2(50 BYTE),
  "EMAIL" VARCHAR2(50 BYTE),
  "USERNAME" VARCHAR2(50 BYTE),
  "PASSWORD" VARCHAR2(50 BYTE),
  "GENDER" VARCHAR2(50 BYTE),
  "STREET" VARCHAR2(50 BYTE),
  "ZIPCODE" VARCHAR2(50 BYTE),
  "CITY" VARCHAR2(50 BYTE),
  "COUNTRY" VARCHAR2(50 BYTE),
  "PHONE_NUM" VARCHAR2(50 BYTE),
  "ISVERIFIED" VARCHAR2(10 BYTE) DEFAULT 'NO'

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
-- Records of CUSTOMER
-- ----------------------------
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('15620406', 'Mady Seden', 'mseden23@thetimes.co.uk', 'mseden23', '91d0813c24dd0df135647fb12644876b', 'Female', '5857', '06650-000', 'Itapevi', 'Brazil', '7015786265', 'YES');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('62771510', 'Gibb Garriock', 'ggarriock24@nba.com', 'ggarriock24', 'd76ce0da30d664674ad6fb27b9d4ba6d', 'Male', '62826', '1325', 'Eastern Suburbs Mc', 'Australia', '6267606457', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('12556604', 'Lacy Greest', 'lgreest25@house.gov', 'lgreest25', 'f4297ad1664c9a5f2f9cbb79f8895bee', 'Female', '1772', NULL, 'Hanji', 'China', '4925134585', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('91943230', 'Nananne De Giorgi', 'nde26@phoca.cz', 'nde26', 'f44dad60126c1a8175f89f862b54ef69', 'Female', '0', '13800-000', 'Mogi Mirim', 'Brazil', '1978092738', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('60672320', 'Juieta Clamp', 'jclamp27@fema.gov', 'jclamp27', 'eb760d7529b003a97dbe6f7fdd0691fe', 'Female', '0', NULL, 'Los Palacios', 'Cuba', '2462175980', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('47352128', 'Mersey Letford', 'mletford28@blogtalkradio.com', 'mletford28', '956b159b2e95c360cf3688e8c6e10857', 'Female', '8859', '721 37', 'Västerås', 'Sweden', '1173320150', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('80945479', 'Jasper Summerill', 'jsummerill29@chronoengine.com', 'jsummerill29', 'c96055709911cb7b6901451a3d6427e7', 'Male', '65', NULL, 'Micheng', 'China', '2134812595', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('49054035', 'Sloan Matschuk', 'smatschuk2a@opera.com', 'smatschuk2a', 'd3a4030f3085b0af1c42c16f54da7bbf', 'Male', '12', NULL, 'Murzuq', 'Libya', '3757682972', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('76206434', 'Jared Cinnamond', 'jcinnamond2c@moonfruit.com', 'jcinnamond2c', 'b91d2e08d810ac085e7fe3d8bf3cd589', 'Male', '6110', '79083 CEDEX 9', 'Niort', 'France', '9947807906', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('76802407', 'Manolo Hurst', 'mhurst2e@youku.com', 'mhurst2e', '1f7f37f734e664ac5e58cfe0d27f4a14', 'Male', '857', '9410', 'Bual', 'Philippines', '3332248184', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('64153965', 'Bill Harmar', 'bharmar2g@washington.edu', 'bharmar2g', 'd76087abd20524213f63235416eee575', 'Male', '59', NULL, 'Hualian', 'Taiwan', '1578594818', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('69149043', 'Korella Cromett', 'kcromett2h@slideshare.net', 'kcromett2h', 'bde15ccc6924eb241ce09b44e489c499', 'Female', '3563', '87785', '5 de Mayo', 'Mexico', '2822403078', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('68133237', 'Joyan Reddy', 'jreddy2i@cnn.com', 'jreddy2i', '479cd5d793cf056d53f8ea84e28d5bf6', 'Female', '38874', NULL, 'Plužine', 'Montenegro', '5334339032', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('67230076', 'Lily Slot', 'lslot2j@prlog.org', 'lslot2j', 'a7b644aab435e6b55d7fc09ee1cabb0a', 'Female', '001', NULL, 'Mao’er', 'China', '9172475162', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('77855108', 'Thebault Staniforth', 'tstaniforth2k@dagondesign.com', 'tstaniforth2k', '7c125aa510414e78b46f0950024cbc21', 'Male', '79', '85304 CEDEX', 'Challans', 'France', '4501637147', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('78262660', 'Wally Chinge', 'wchinge2l@taobao.com', 'wchinge2l', 'f356f6630ee139039748790f84569460', 'Male', '065', NULL, 'Quảng Ngãi', 'Vietnam', '2314102718', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('13709710', 'Ruprecht McMennum', 'rmcmennum2m@printfriendly.com', 'rmcmennum2m', '41a4025c7b2f30024fc56cbdffbfe9ea', 'Male', '6', '4709', 'Santa Magdalena', 'Philippines', '2537994669', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('12274062', 'Grete Mebius', 'gmebius2n@sbwire.com', 'gmebius2n', '56443e7344711df860f2288049311478', 'Female', '025', NULL, 'Owando', 'Republic of the Congo', '2855979089', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('42791313', 'Avram Quartermain', 'aquartermain2p@patch.com', 'aquartermain2p', '6c24ecb887af6b6617f97907e28870f8', 'Male', '2051', '81505', 'Grand Junction', 'United States', '4063494677', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('65560977', 'Corty Kynvin', 'ckynvin2q@slate.com', 'ckynvin2q', '637e2801a6b61459cb20e31915d41dd6', 'Male', '0', '636845', 'Asino', 'Russia', '3213820683', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('13851033', 'Jehu Vamplus', 'jvamplus2r@edublogs.org', 'jvamplus2r', '007f3e0657e563582f5f641ba4cab437', 'Male', '65', '190990', 'Saint Petersburg', 'Russia', '3842938715', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('46272931', 'Cheslie Iaduccelli', 'ciaduccelli2s@indiegogo.com', 'ciaduccelli2s', '6e1d2f73012acf0805fee76db0c87314', 'Female', '0', '3505-125', 'Avelinha', 'Portugal', '7906669697', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('39332261', 'Vince Mumbray', 'vmumbray2t@apple.com', 'vmumbray2t', '49a7d323371efaee966c71f8bfeec065', 'Male', '16', '9401', 'Makilala', 'Philippines', '6543520267', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('62054825', 'Brynn Campe', 'bcampe2u@ocn.ne.jp', 'bcampe2u', '0b1b3229ffbbac5a6c0df51cce2a0f0a', 'Female', '8797', NULL, 'Houxixi', 'China', '8369200187', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('43170223', 'Zitella Helsdon', 'zhelsdon2v@fastcompany.com', 'zhelsdon2v', '4cefd8fe65711d1f3637e1090192ff31', 'Female', '22', NULL, 'Kanye', 'Botswana', '9661273280', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('23292337', 'Guilbert Foggo', 'gfoggo2w@ovh.net', 'gfoggo2w', '65aa3686b303b6e5f0be16ad1b7a0070', 'Male', '967', NULL, 'Changfu', 'China', '8703056488', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('15888821', 'Creight Bennen', 'cbennen2x@mysql.com', 'cbennen2x', '1874f6dde74a9d0b0781dcc6ab70f043', 'Male', '10', '64039 CEDEX', 'Pau', 'France', '6088492526', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('61270454', 'Clarance Montez', 'cmontez2y@scientificamerican.com', 'cmontez2y', '43ae780c3ed930a3b79f5dce079443f1', 'Male', '6199', NULL, 'Tuxi', 'China', '2999269842', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('74856900', 'Henri Pikesley', 'hpikesley30@prnewswire.com', 'hpikesley30', 'adc68f9bed37eda2b4b237ca23cee886', 'Male', '5', NULL, 'Zhijiang', 'China', '5181943563', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('27128265', 'Poul Rendle', 'prendle32@apple.com', 'prendle32', '7828660520d923ad141652f5c9438ff7', 'Male', '319', NULL, 'Wonoharjo', 'Indonesia', '1821689158', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('45423049', 'Dixie McCartan', 'dmccartan33@geocities.com', 'dmccartan33', '63bff57019a83b8308fa39fe1e6baa72', 'Female', '0', '79151', 'Tangwāni', 'Pakistan', '9797235194', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('32915916', 'Tod Filoniere', 'tfiloniere34@apple.com', 'tfiloniere34', '62eb6bcf4d5ca030f0070cc48edcd205', 'Male', '19', '3244', 'Hamilton', 'New Zealand', '9874811067', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('44878287', 'Nixie Epilet', 'nepilet35@mit.edu', 'nepilet35', '69b063c5953b3859d37b887fbbc9fbef', 'Female', '0', NULL, 'Banjar Dauhpangkung', 'Indonesia', '5322838344', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('75483602', 'Othello Clery', 'oclery37@storify.com', 'oclery37', 'f15d649cd8dd757d85c75ff7e6233b1a', 'Male', '32757', NULL, 'Bayan Gol', 'China', '5672335872', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('70439382', 'Gayler Sprouls', 'gsprouls38@unc.edu', 'gsprouls38', '9c467b1e64a9867ecff582d6aa260f77', 'Male', '191', '85000-000', 'Guarapuava', 'Brazil', '1349018642', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('20187624', 'Shannon Semeradova', 'ssemeradova39@vkontakte.ru', 'ssemeradova39', '3f977bb0447d04e18bb3f34880ca89db', 'Male', '455', NULL, 'Viña del Mar', 'Chile', '3657825973', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('59681257', 'Avis Darling', 'adarling3a@pbs.org', 'adarling3a', '95f83c0529d3e7efc951e495c572c6cf', 'Female', '2139', '73800-000', 'Formosa', 'Brazil', '9758731063', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('67232241', 'Bartholemy Llewelyn', 'bllewelyn3c@tuttocitta.it', 'bllewelyn3c', '93983fb553c2f58c73b707fc7f21cf38', 'Male', '0458', NULL, 'Hejiang', 'China', '4803645141', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('69556723', 'Mattie Avent', 'mavent3d@furl.net', 'mavent3d', 'e3a78a5d48e06f07112677088c42f5f5', 'Male', '50', '89294-000', 'Campo Alegre', 'Brazil', '4872798438', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('45021684', 'Therine Bouller', 'tbouller3e@diigo.com', 'tbouller3e', '25d79f03422f960d1c434be054687384', 'Female', '5523', 'F26', 'Moville', 'Ireland', '4943473280', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('82872820', 'Jo-anne Agneau', 'jagneau3f@miibeian.gov.cn', 'jagneau3f', '759b356157ae0a05bd6d495847bea447', 'Female', '9', NULL, 'Tocumen', 'Panama', '3588860654', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('56852989', 'Silvana Trewin', 'strewin3i@hubpages.com', 'strewin3i', '2b2013da289ca95c10dca98312a2aedb', 'Female', '27', '6435', 'Dimitrovgrad', 'Bulgaria', '6013893687', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('30132745', 'Patten Emilien', 'pemilien3j@whitehouse.gov', 'pemilien3j', 'a2ee5f54705a51da59e348bb90394e02', 'Male', '72', '384 72', 'Zdíkov', 'Czech Republic', '7362345187', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('74443279', 'Truman Holtom', 'tholtom3k@scientificamerican.com', 'tholtom3k', '59ed778bbbf87b3d4d70fbb255c1ed3a', 'Male', '21092', '72-210', 'Dobra', 'Poland', '9647115795', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('96305684', 'Justus Coite', 'jcoite3m@nytimes.com', 'jcoite3m', '2dac1c0d48c273d76df1462364c0c589', 'Male', '51371', NULL, 'Shuangfeng', 'China', '7245326966', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('59896341', 'Christean Lisle', 'clisle3n@businessinsider.com', 'clisle3n', '6f0a2ebc412a01164cfba2daa960096a', 'Female', '88518', '30001', 'Nida', 'Lithuania', '4907937501', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('61475350', 'Kippy Jesper', 'kjesper3o@ocn.ne.jp', 'kjesper3o', '2a06b4eeb202d3f9706b7c8dd8c3e820', 'Female', '9', NULL, 'Caohe', 'China', '7222353277', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('33847837', 'Parker Stanyon', 'pstanyon3q@g.co', 'pstanyon3q', '19c17c581332c04608a8aa725bb454ca', 'Male', '8', '601120', 'Pokrov', 'Russia', '1185079799', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('44671517', 'Raven Stapylton', 'rstapylton3r@ehow.com', 'rstapylton3r', '9784baff81b393cc31fbf0f61499fb53', 'Female', '9', NULL, 'Huanggang', 'China', '7051986142', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('16327200', 'Ernest Cadalleder', 'ecadalleder3s@timesonline.co.uk', 'ecadalleder3s', 'b4856aaf3e17d2c9a0d84ca1e8178ce2', 'Male', '2673', NULL, 'Bealanana', 'Madagascar', '2675669974', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('98189861', 'Clywd Ife', 'cife3t@hao123.com', 'cife3t', 'd96de26b67d919a46f87c397fd4a1002', 'Male', '09', '43-215', 'Jankowice', 'Poland', '7586259053', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('26606124', 'Rebekah Bonnier', 'rbonnier3w@google.com', 'rbonnier3w', '05ba50b208159cade476f18c59736b52', 'Female', '3', '4615-544', 'Bacelo', 'Portugal', '2054915900', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('68567599', 'Stearne Juliff', 'sjuliff3x@tumblr.com', 'sjuliff3x', '582818ff4106129c8386f57402ee6da8', 'Male', '7', NULL, 'Zhangjiawo', 'China', '6646365211', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('45865526', 'Heinrik Manklow', 'hmanklow3z@xinhuanet.com', 'hmanklow3z', '42d0ab4beebccf2b5795d57c0a1ccb91', 'Male', '09148', '45016 CEDEX 1', 'Orléans', 'France', '9581549382', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('34744887', 'Hyatt Nono', 'hnono40@barnesandnoble.com', 'hnono40', 'c9a4060d9350a7782c37637372fd0c15', 'Male', '96837', '07104 CEDEX', 'Annonay', 'France', '5166213630', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('18158137', 'Wolf Pacey', 'wpacey41@japanpost.jp', 'wpacey41', '434967ded161e51ddb495781d75b7e54', 'Male', '03933', '45745-000', 'Ibicaraí', 'Brazil', '2007034266', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('43115084', 'Hugibert Daldry', 'hdaldry44@prnewswire.com', 'hdaldry44', '09c0966dd8808ef758aa98fbd67fd49d', 'Male', '6672', '36029 CEDEX', 'Châteauroux', 'France', '9155173975', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('19356839', 'Kellen Spratley', 'kspratley85@senate.gov', 'kspratley85', '680feb30765772912e8b5fcc2a308dd2', 'Female', '44021', NULL, 'Tofol', 'Micronesia', '9659529748', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('59663531', 'Vincents Hazeldene', 'vhazeldene87@printfriendly.com', 'vhazeldene87', '7111f70f4c2c26439eec06ab696f0269', 'Male', '67', '664511', 'Dzerzhinsk', 'Russia', '6454401281', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('61023403', 'Ermanno Bilney', 'ebilney88@mail.ru', 'ebilney88', '52753a6d217d37ae99d3f99e9307fc1e', 'Male', '77052', 'MD-6114', 'Ceadîr-Lunga', 'Moldova', '4344912322', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('69713069', 'Ailee Oldmeadow', 'aoldmeadow89@csmonitor.com', 'aoldmeadow89', '707ce47a12ecd3b767f87764962f9d42', 'Female', '5464', NULL, 'Tarqūmyā', 'Palestinian Territory', '1548903487', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('83524785', 'Trstram Mosson', 'tmosson8a@umn.edu', 'tmosson8a', '692bb7dc5663e6ae56d54590d6c50b51', 'Male', '61', '1030', 'Siyabuswa', 'South Africa', '7892361611', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('31495346', 'Quentin Delatour', 'qdelatour8b@1und1.de', 'qdelatour8b', '7fe7a84b1d5fd1725b8268e691e165cc', 'Male', '99191', NULL, 'Hadabei', 'China', '5168183610', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('81425589', 'Hamil Constance', 'hconstance8c@addtoany.com', 'hconstance8c', '6bad9ddce90e394f04e34953fc14a937', 'Male', '95', NULL, 'Fenglu', 'China', '8538167534', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('71300279', 'Aurelea Piddock', 'apiddock8d@blogger.com', 'apiddock8d', '30ab3a115225428f87a27e48bdd8984d', 'Female', '30', NULL, 'Kotaagung', 'Indonesia', '1983226331', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('92581050', 'Franklin Puve', 'fpuve8e@mapy.cz', 'fpuve8e', '744f75f7853c2aff2baf9b8961aac027', 'Male', '420', NULL, 'Cuijiamatou', 'China', '4016795508', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('96955588', 'Alfy Askham', 'aaskham8f@theatlantic.com', 'aaskham8f', 'c0ebb06571a6c475467e0d1d160e2bdc', 'Male', '152', NULL, 'Wringinputih', 'Indonesia', '6258920049', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('16461004', 'Felix MacCaughan', 'fmaccaughan8g@craigslist.org', 'fmaccaughan8g', 'e781b9022a4889e088b8bb7011282747', 'Male', '46', '517 03', 'Skuhrov nad Bělou', 'Czech Republic', '7369428237', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('90027221', 'Steward Fraser', 'sfraser8i@shop-pro.jp', 'sfraser8i', 'df30e6a512965bc804b40b1898bf5848', 'Male', '2', NULL, 'Damai', 'China', '2957069025', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('46148826', 'Corly Opie', 'copie8j@accuweather.com', 'copie8j', 'f7d0fabd45fa46ff605090e3d818e2b5', 'Female', '4632', '33-240', 'Żabno', 'Poland', '8827684057', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('19152092', 'Edwin Ticic', 'eticic8k@mozilla.org', 'eticic8k', '82d35a02aff32e3e6f33ea2f1c5e096e', 'Male', '661', '3334', 'Puerto Rico', 'Argentina', '5352541580', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('59933916', 'Meara Greson', 'mgreson8l@cdbaby.com', 'mgreson8l', '7a769473a13a6bee40203e8da4868329', 'Female', '2246', NULL, 'Đống Đa', 'Vietnam', '8134208119', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('85853408', 'Rick Craighead', 'rcraighead8m@360.cn', 'rcraighead8m', '3d0d21b380093119872f909a3d7da96b', 'Male', '551', NULL, 'Khánh Hải', 'Vietnam', '4662943845', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('13413606', 'Diahann Laurens', 'dlaurens8n@bbb.org', 'dlaurens8n', 'b260b88da7cfcae35e344a966b8d8ff0', 'Female', '183', '15103', 'Ait Ali', 'Algeria', '1354634205', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('85800179', 'Cherie Digan', 'cdigan8o@cdbaby.com', 'cdigan8o', 'b5079c0ada00c8b5f2dc770ae45cf10c', 'Female', '04', '541 33', 'Skövde', 'Sweden', '1803939801', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('60710133', 'Clemens Duckham', 'cduckham8q@shop-pro.jp', 'cduckham8q', '1b5e65a7af99e4fc7b5d00c96124cc76', 'Male', '42673', '69970-000', 'Tarauacá', 'Brazil', '7026137727', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('43818230', 'Rebecca Bedells', 'rbedells8r@geocities.jp', 'rbedells8r', '3b6fe5082052dae6221229d6ca64671c', 'Female', '799', NULL, 'Primero de Enero', 'Cuba', '7644824062', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('99865843', 'Flory Robichon', 'frobichon8t@sphinn.com', 'frobichon8t', 'ee92575c67ec93260aebebb4f75ff096', 'Male', '234', NULL, 'Phước An', 'Vietnam', '1079877914', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('34069758', 'Shoshana Milsom', 'smilsom8u@examiner.com', 'smilsom8u', 'fd60cdb0d4d6a6fdc4c0e9be64671e95', 'Female', '269', 'ZTN', 'Senglea', 'Malta', '6644148330', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('77081860', 'Lydie Orgel', 'lorgel8w@squidoo.com', 'lorgel8w', 'a04b223253d069fafba62d8ab8c0f39a', 'Female', '456', '276058', 'Nuquí', 'Colombia', '5367846854', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('90289413', 'Ibby Fellnee', 'ifellnee8x@jugem.jp', 'ifellnee8x', '31600e5eb7ee6ddb066d73accb6733d5', 'Female', '2656', NULL, 'Gununglarang', 'Indonesia', '7432141219', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('20096268', 'Marilyn Sommersett', 'msommersett8y@mtv.com', 'msommersett8y', '1ed1ca15edf9a258f2bd5ccb4556c159', 'Female', '229', NULL, 'Karakol', 'Kyrgyzstan', '3423628178', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('97027342', 'Beniamino Gayton', 'bgayton8z@engadget.com', 'bgayton8z', '2b45b12bf95f2ee873aaea99f948414b', 'Male', '3114', NULL, 'Jindayris', 'Syria', '6557296213', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('95184144', 'Ivar Cayle', 'icayle90@mtv.com', 'icayle90', '922439939fce2d802ed10696f7ee84e7', 'Male', '5474', NULL, 'Nelipyno', 'Ukraine', '4011771423', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('32189714', 'Claudian Bissiker', 'cbissiker91@geocities.com', 'cbissiker91', '6615e69388144ac929e33e5636646004', 'Male', '2', '42-165', 'Lipie', 'Poland', '5811975399', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('99867931', 'Vina Pilpovic', 'vpilpovic92@vk.com', 'vpilpovic92', '3ced3e07973a077a354f1e23e6cbdbdd', 'Female', '91766', '348 15', 'Chodová Planá', 'Czech Republic', '2666682568', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('17610015', 'Beverley Kenney', 'bkenney95@list-manage.com', 'bkenney95', 'fd92e414312053927ea0fafb9aa1cb46', 'Female', '4', '27570-000', 'Cambebba', 'Brazil', '7376166095', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('14935338', 'Odey Gowman', 'ogowman96@mayoclinic.com', 'ogowman96', 'acd72a638d80377f2fd94fd1cf0fe4fe', 'Male', '045', NULL, 'Batujaran', 'Indonesia', '4179398541', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('88841522', 'Theodoric Knightsbridge', 'tknightsbridge97@bigcartel.com', 'tknightsbridge97', 'bb36969b22c60c957bda58c10f14c84d', 'Male', '4492', NULL, 'Al Madān', 'Yemen', '5205589442', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('95997240', 'Tiebout Regelous', 'tregelous99@fastcompany.com', 'tregelous99', '9ccfea4cd2d0fe2b4c8e2e410210fadc', 'Male', '15', NULL, 'Usu', 'China', '9655604727', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('92880190', 'Daryl Rawlingson', 'drawlingson9a@chronoengine.com', 'drawlingson9a', 'b423adb58f8099c07ae72b26d3c19757', 'Male', '309', NULL, 'Kototujuh', 'Indonesia', '9012603056', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('43242829', 'Maximilianus Linke', 'mlinke9b@seattletimes.com', 'mlinke9b', 'f3831c6234e810bdc6901a23319937c3', 'Male', '4185', NULL, 'Talin Hiag', 'China', '6715439413', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('14269779', 'Rafa Piner', 'rpiner9d@forbes.com', 'rpiner9d', '95842fc6756e729f89f48b0de4fdaf18', 'Female', '56609', '886-0112', 'Shimoda', 'Japan', '2364187436', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('34420053', 'Davis Yashunin', 'dyashunin9e@java.com', 'dyashunin9e', '5c026ee7938972c13e46c5c465cd921c', 'Male', '602', '177007', 'Belalcazar', 'Colombia', '1263274803', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('63419736', 'Vivie Cartan', 'vcartan9f@is.gd', 'vcartan9f', 'f4d399722ff64af9c2923a12614ce981', 'Female', '61', '893 23', 'Bjästa', 'Sweden', '5962407335', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('23305573', 'Launce Djurevic', 'ldjurevic9h@so-net.ne.jp', 'ldjurevic9h', '63a4963b0401ed3289c4965886f252e0', 'Male', '4770', NULL, 'Geshan', 'China', '1323040562', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('21695851', 'Lukas Bachmann', 'lbachmann9i@artisteer.com', 'lbachmann9i', '56396c2ad55c34288570cef7d489f93f', 'Male', '849', NULL, 'Houzhen', 'China', '2456802702', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('23786861', 'Petrina Sommerlin', 'psommerlin9k@dell.com', 'psommerlin9k', '910631fa6c3c186fca1937290edeb47f', 'Female', '7174', '2865-193', 'Pinhal General', 'Portugal', '9908270800', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('38460786', 'Diane-marie Thies', 'dthies9m@marriott.com', 'dthies9m', '33f6a3b450cd4248c1d12614ae117b6f', 'Female', '9684', NULL, 'Krasna', 'Ukraine', '7415591237', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('32343411', 'Jacqueline Offa', 'joffa9n@hud.gov', 'joffa9n', 'd90d21a7981ea48b37533eed412f3629', 'Female', '4059', '601800', 'Yur’yev-Pol’skiy', 'Russia', '7759327722', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('90099065', 'Ara Faithfull', 'afaithfull9o@rediff.com', 'afaithfull9o', 'fb66daac9a644d4ebbe21d3737aaddad', 'Female', '61', '5030-049', 'Barreiro', 'Portugal', '8684005617', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('30789000', 'Arne Taudevin', 'ataudevin9q@timesonline.co.uk', 'ataudevin9q', 'd9a2d91749bb69a9dddd4b9cc68a68ac', 'Male', '69571', NULL, 'Mbuji-Mayi', 'Democratic Republic of the Congo', '8007616333', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('14204300', 'Prent Hayles', 'phayles9r@google.de', 'phayles9r', '3c735669a968b8333dd9ef6437a86021', 'Male', '84192', NULL, 'Asímion', 'Greece', '8931639367', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('65926547', 'Aguistin Kimbrey', 'akimbrey9s@washingtonpost.com', 'akimbrey9s', 'b7180a1065415f57ae0ca62e83189135', 'Male', '108', NULL, 'Aguas Verdes', 'Peru', '4831427708', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('79330712', 'Tim Pimblett', 'tpimblett9t@army.mil', 'tpimblett9t', 'b76f9ae121be600a4bde3050e81cc600', 'Male', '6052', NULL, 'Baojia', 'China', '1441184705', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('24731033', 'Gwyn Blackley', 'gblackley9u@shareasale.com', 'gblackley9u', '1e9e87e12e1c44d78b07d911590f7c1a', 'Female', '776', '80130', 'Ron Phibun', 'Thailand', '8831310844', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('18312605', 'Patsy MacTrustie', 'pmactrustie9w@engadget.com', 'pmactrustie9w', 'a63ea4c0fc9cfdda964057316beab480', 'Male', '7246', NULL, 'Boudinar', 'Morocco', '4367511942', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('89390502', 'Riane Marchington', 'rmarchington9y@bigcartel.com', 'rmarchington9y', '9b5b61167b3bf1f69ce4a8bbc782c020', 'Female', '9', '83120', 'Mueang Phuket', 'Thailand', '8737491288', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('52569515', 'Allx Tidmas', 'atidmas9z@ycombinator.com', 'atidmas9z', '506b9454ea16f7b42785edea0431ab9d', 'Female', '777', '68270-000', 'Oriximiná', 'Brazil', '1525475512', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('62705071', 'Batholomew Corwin', 'bcorwina1@chron.com', 'bcorwina1', 'df730eec177c67805c3a9647cda49796', 'Male', '92', NULL, 'Longjie', 'China', '5218413442', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('52739505', 'Rickie Bisgrove', 'rbisgrovea2@wsj.com', 'rbisgrovea2', '64979b0df4e11bf51c0ebaf818f2efec', 'Female', '5762', '433791', 'Kuzovatovo', 'Russia', '9346425816', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('94813619', 'Birdie Link', 'blinka3@wsj.com', 'blinka3', '35369369a5b61b7047015f59a5bf3860', 'Female', '62804', NULL, 'Bradag', 'Indonesia', '5298588812', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('27589198', 'Simona Coulsen', 'scoulsen45@mapy.cz', 'scoulsen45', '958f9098b55b5418fbc977f566139e30', 'Female', '21', '37-630', 'Oleszyce', 'Poland', '1031813872', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('40583760', 'Ty Pacitti', 'tpacitti46@narod.ru', 'tpacitti46', 'f482d2367b89291089b4d27d745a9ffc', 'Male', '94373', NULL, 'Velyka Lepetykha', 'Ukraine', '4302479182', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('83917394', 'Brittney Care', 'bcare48@woothemes.com', 'bcare48', '5fd7f50e6e773daabd517c583e9b5a1d', 'Female', '27', NULL, 'Yueyang', 'China', '9187355527', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('30906963', 'Claus Trenholm', 'ctrenholm49@ftc.gov', 'ctrenholm49', 'c1f41a96eb3fc9b84577a5074cdd6439', 'Male', '03347', 'MLH', 'Mellieħa', 'Malta', '6535590033', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('13486680', 'Montague Vaissiere', 'mvaissiere4b@histats.com', 'mvaissiere4b', '488e180cf540d93affe1a344fb7791ba', 'Male', '16731', NULL, 'Suifenhe', 'China', '7005592905', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('60670556', 'Cly Manwaring', 'cmanwaring4c@geocities.com', 'cmanwaring4c', 'e960d2886888fa71e428bba2b6276791', 'Male', '26', NULL, 'Kálymnos', 'Greece', '3169127365', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('87790172', 'Jessalin Anwell', 'janwell4d@army.mil', 'janwell4d', 'd41a175bd22c47f37b6649fa6ceb95ae', 'Female', '94', NULL, 'Hekou', 'China', '9117967800', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('21156457', 'Samson Flaunier', 'sflaunier4f@cbslocal.com', 'sflaunier4f', 'c6531cfb3ff07bffa2db93522d5a93f2', 'Male', '262', '46150', 'Somdet', 'Thailand', '5767941047', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('21434987', 'Jacklin Riedel', 'jriedel4g@nba.com', 'jriedel4g', 'cca5afefaf7dd1107843647ecd610221', 'Female', '03483', '87560-000', 'Iporã', 'Brazil', '8148052692', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('50614897', 'Winnie Artingstall', 'wartingstall4h@twitter.com', 'wartingstall4h', 'b799432fe50568d46018c10385ba19ad', 'Female', '8', NULL, 'Yanwang', 'China', '7375136697', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('37503601', 'Rhett Parr', 'rparr4i@infoseek.co.jp', 'rparr4i', '547217d27e51847f4439e8b40052ba29', 'Male', '5338', '65911 CEDEX 9', 'Tarbes', 'France', '8862200029', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('77734514', 'Fred Beeho', 'fbeeho4j@photobucket.com', 'fbeeho4j', '96ddca012fd0c3238af74ce012e8ffe8', 'Male', '9', '27-552', 'Baćkowice', 'Poland', '5181254622', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('76253813', 'Melisande Roffe', 'mroffe4k@4shared.com', 'mroffe4k', '0ff34d48b83483d9e2cf4d7e9c04eac2', 'Female', '33629', NULL, 'Bendan', 'Indonesia', '6752910700', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('70586997', 'Ely Burdis', 'eburdis4l@stanford.edu', 'eburdis4l', 'ff5028bfde1c13087a5e90291b3cfe7d', 'Male', '9', '366703', 'Bamut', 'Russia', '1795759951', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('74719865', 'Ingeberg Grabiec', 'igrabiec4m@oakley.com', 'igrabiec4m', '08e391a7a9163f3ddd9e969a8314bbb4', 'Female', '269', '98-338', 'Sulmierzyce', 'Poland', '1481312369', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('96563850', 'Michaela Rowth', 'mrowth4n@paypal.com', 'mrowth4n', '80e6d19fea03afb8c53f96355bcb1e6e', 'Female', '06454', '36-047', 'Przybyszówka', 'Poland', '5011423475', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('86071953', 'Chane Dowzell', 'cdowzell4o@google.co.uk', 'cdowzell4o', '310c12c04de5a010bbc09699e2461e95', 'Male', '2089', '25880-000', 'Sapucaia', 'Brazil', '9371962025', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('62188183', 'Drake Duddle', 'dduddle4q@boston.com', 'dduddle4q', 'f8eae88b4cf124e41087d09bb934b749', 'Male', '5', '67140', 'Saba Yoi', 'Thailand', '9594172770', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('53365401', 'Kurt Colquete', 'kcolquete4r@ft.com', 'kcolquete4r', '606c97442589cd0f691d3c9f0f2fcda8', 'Male', '41', NULL, 'Ngou', 'Cameroon', '2306667095', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('11174553', 'Gigi Eveleigh', 'geveleigh4s@dion.ne.jp', 'geveleigh4s', '483237cf450b9d704028dc8e42bba192', 'Female', '9073', '44720-000', 'Miguel Calmon', 'Brazil', '7383140222', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('66437789', 'Ebonee Androlli', 'eandrolli4t@jimdo.com', 'eandrolli4t', '1be2725cf8853e9dbe48db1189d71b94', 'Female', '3136', NULL, 'Farasān', 'Saudi Arabia', '3547792847', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('81656478', 'Janine Keijser', 'jkeijser4u@odnoklassniki.ru', 'jkeijser4u', '712067f8bcbd84a54dffc71184ae5b66', 'Female', '75', '662360', 'Pesochnoye', 'Russia', '3399679180', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('92068518', 'Glori Labeuil', 'glabeuil4v@ning.com', 'glabeuil4v', '4c2e5868173805b17795558c5f12a5d3', 'Female', '4', '49082', 'Osnabrück', 'Germany', '2232686196', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('48161449', 'Henka Demsey', 'hdemsey4w@wordpress.org', 'hdemsey4w', '137fbd41c4e073e6cfa8749542f532e1', 'Female', '39', 'S6J', 'Moose Jaw', 'Canada', '2647273142', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('40209073', 'Mildrid Foxhall', 'mfoxhall4x@cisco.com', 'mfoxhall4x', 'd3d2ca1bd5d0a500d375ec10746119e5', 'Female', '1769', NULL, 'Jiangqiao', 'China', '4702897431', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('10230454', 'Benyamin Kighly', 'bkighly4y@java.com', 'bkighly4y', 'a136bfba0e8f66f636f7b6a1ac7e867b', 'Male', '35', NULL, 'Jinglongqiao', 'China', '2545634647', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('43741881', 'Jaime Khotler', 'jkhotler4z@theguardian.com', 'jkhotler4z', '7a5a62a399caca93b25fad64f661a1c9', 'Male', '01841', NULL, 'Pondokkaha Kelod', 'Indonesia', '3006252310', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('65387200', 'Austen Paddock', 'apaddock51@wordpress.com', 'apaddock51', '584bc97a09b20d7dd50b787605acec01', 'Male', '1', '3418', 'Empedrado', 'Argentina', '4026551703', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('26657472', 'Candace Orts', 'corts52@state.tx.us', 'corts52', '118ff1e759a4784917ec8f987eb46335', 'Female', '841', '32304', 'Tallahassee', 'United States', '1402305986', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('44640966', 'Rozele Abthorpe', 'rabthorpe53@census.gov', 'rabthorpe53', 'c8292b0b9aca241ed21d387018704b13', 'Female', '08134', '95108', 'San Jose', 'United States', '3234077947', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('86387403', 'Catina Seedhouse', 'cseedhouse54@who.int', 'cseedhouse54', 'd4b93c9cb23cdbb16e3879405b18c0b2', 'Female', '8098', NULL, 'Ngepoh Kidul', 'Indonesia', '9471568833', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('53355218', 'Reece Coogan', 'rcoogan55@topsy.com', 'rcoogan55', 'cbb482d7a7addd1bd2c7dd40fb1684ec', 'Male', '9809', NULL, 'Cijeungjing Kaler', 'Indonesia', '2085597155', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('24339154', 'Wilfred Londors', 'wlondors56@whitehouse.gov', 'wlondors56', '638a26045c781fc0e3d9ec544381ae50', 'Male', '7407', '105 22', 'Stockholm', 'Sweden', '1339750381', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('14072550', 'Loree Flowerdew', 'lflowerdew58@163.com', 'lflowerdew58', '3a02bdd5c249af8df5e7bb6784ce36d9', 'Female', '32260', '10208', 'Ciudad Nueva', 'Dominican Republic', '8924475257', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('44464871', 'Amy Janssen', 'ajanssen59@weather.com', 'ajanssen59', '7487f307cd4f0b388540232ddb1522e2', 'Female', '4998', '32-652', 'Targanice', 'Poland', '7727152674', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('86315760', 'Hamnet Struijs', 'hstruijs5a@miitbeian.gov.cn', 'hstruijs5a', '1975650c2177a50a3d02bb5ffba26cc7', 'Male', '63395', '664008', 'Quinchía', 'Colombia', '6189809091', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('45452029', 'Cozmo Toler', 'ctoler5d@cocolog-nifty.com', 'ctoler5d', 'c41d52e53bfd56a71e16d407b7c1f86f', 'Male', '1', NULL, 'Yunchi', 'China', '3965045716', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('34216705', 'Leopold Heritege', 'lheritege5e@springer.com', 'lheritege5e', '6cf030fa9b13b354669a53bc07f58878', 'Male', '9', NULL, 'Thị Trấn Yên Cát', 'Vietnam', '4292587901', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('32475907', 'Madella Stickley', 'mstickley5g@opensource.org', 'mstickley5g', '691fe5ea153e4d56d333b1c393f86fd3', 'Female', '2804', '12-160', 'Wielbark', 'Poland', '9105258653', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('99820309', 'Cortney Muncey', 'cmuncey5h@shareasale.com', 'cmuncey5h', '22c5450882898234bd50fb7e52bc7e03', 'Female', '0798', 'H9K', 'Sainte-Marthe-sur-le-Lac', 'Canada', '8606881884', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('57545499', 'Mario Jore', 'mjore5i@chronoengine.com', 'mjore5i', '220bdfa784ea07371093cd87539eab35', 'Male', '96', NULL, 'Luoping', 'China', '8925608609', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('43780906', 'Trey Vauter', 'tvauter5k@yahoo.com', 'tvauter5k', '1455b42ad60b4b625936dd642d580913', 'Male', '8', NULL, 'Llano Largo', 'Panama', '7784813892', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('36819758', 'Phil McOrkill', 'pmcorkill5l@amazonaws.com', 'pmcorkill5l', '38da9aae2ddc20d573ffc5fe7cfc6c8b', 'Male', '1', '3342', 'Gornji Grad', 'Slovenia', '5094285510', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('62745392', 'Lucienne Richardt', 'lrichardt5m@nhs.uk', 'lrichardt5m', 'f927a754d299e41e5125ea004b447623', 'Female', '3967', '6548', 'Caibiran', 'Philippines', '4471998274', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('67205938', 'Lazare Cadamy', 'lcadamy5n@mysql.com', 'lcadamy5n', 'e923cb5d9af03d786c5905e19415bc3c', 'Male', '47', NULL, 'Karangkancana', 'Indonesia', '6488915051', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('97526582', 'Brnaba Harfoot', 'bharfoot5o@quantcast.com', 'bharfoot5o', '843a6c40996d8fba47c321cf1f581029', 'Male', '3301', NULL, 'Garunggang', 'Indonesia', '6722076014', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('43711295', 'Dukie Pincked', 'dpincked5s@vk.com', 'dpincked5s', 'de7a05631a6c894fb559d78cac52396e', 'Male', '5400', '6440-104', 'Figueira Castelo Rodrigo', 'Portugal', '5721072458', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('68438849', 'Daniel Sterman', 'dsterman5t@skyrock.com', 'dsterman5t', '44d5882d13ac5313d4bb35a19631c837', 'Male', '16', '7220-043', 'Alqueva', 'Portugal', '6511211939', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('63208261', 'Rolph Prime', 'rprime5v@theatlantic.com', 'rprime5v', '56b94b781ae5253bc8d8ab457594e74d', 'Male', '0', '06102 CEDEX 2', 'Nice', 'France', '3368197262', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('59671371', 'Andrey Dowda', 'adowda5w@google.ca', 'adowda5w', '4e5da3e63707f2d1b7bdafe962fbce3e', 'Male', '6618', NULL, 'Zel’va', 'Belarus', '8059950449', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('95791952', 'Cheri de Zamora', 'cde5x@tiny.cc', 'cde5x', '8c4f86d232554f254c054745c136dfe5', 'Female', '7643', NULL, 'Wangjiahe', 'China', '2448585841', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('13966162', 'Kalina McCloid', 'kmccloid5y@diigo.com', 'kmccloid5y', '13178fca95be4812ac9856d95e7a4753', 'Female', '440', NULL, 'Gandorhun', 'Sierra Leone', '8538791880', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('31740760', 'Westbrooke Kubicek', 'wkubicek60@gravatar.com', 'wkubicek60', '1243a558f7c68dfc671f58c7fe8ade2b', 'Male', '39464', NULL, 'Ganhe', 'China', '3235001354', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('96111449', 'Shep Heintz', 'sheintz61@studiopress.com', 'sheintz61', '14a463cdb91c083aa75e60ae709c7a6a', 'Male', '7852', NULL, 'Warugunung', 'Indonesia', '6131228498', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('49515353', 'Darla Delue', 'ddelue62@icq.com', 'demo2', '81dc9bdb52d04dc20036dbd8313ed055', 'Female', '2', '7780-256', 'Monte Novo', 'Portugal', '4454484584', 'YES');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('73354078', 'Brynn Goretti', 'bgoretti63@homestead.com', 'bgoretti63', 'cb8cc591cff1caf4848ebaf06b757a2d', 'Female', '45801', NULL, 'Xiamazhuang', 'China', '3625651807', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('46568294', 'Gaylord Botwright', 'gbotwright65@yellowbook.com', 'gbotwright65', '8b1e0ff43661fcac27558d4345642bad', 'Male', '59482', '571-0002', 'Kishiwada', 'Japan', '7524987452', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('43582317', 'Hans Sitlington', 'hsitlington66@dot.gov', 'hsitlington66', 'dc847a6db3e95b89b9e39be2ad4e1d60', 'Male', '49', '44840-000', 'Tapiramutá', 'Brazil', '1242783507', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('94335854', 'Zorine Ianiello', 'zianiello67@aboutads.info', 'zianiello67', '87575e9a45769642aa3db2d3cfd72dae', 'Female', '16342', 'L4E', 'Cornwall', 'Canada', '1242272154', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('98450286', 'Janene Cissell', 'jcissell68@pen.io', 'jcissell68', '66a3e140eefdb23b333b1a6b6028944a', 'Female', '55532', '15170-000', 'Tanabi', 'Brazil', '7252286503', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('28128113', 'Kirsteni Giral', 'kgiral6a@sfgate.com', 'kgiral6a', '1c1e5cab788d7db4dbe1f3daab50f270', 'Female', '2266', NULL, 'Bajo Naranjillo', 'Peru', '3808680780', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('49998710', 'Stanleigh Rantoul', 'srantoul6b@typepad.com', 'srantoul6b', '848e7510c9a5d95ad8cca258f21d7c78', 'Male', '313', NULL, 'Kardhiq', 'Albania', '6116475092', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('13679480', 'Cecily Ollington', 'collington6c@alexa.com', 'collington6c', '36772cea3169d40b551273babba10062', 'Female', '30829', NULL, 'Quebrada Canoa', 'Panama', '5943709378', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('28457849', 'Jecho Rogerson', 'jrogerson6d@usgs.gov', 'jrogerson6d', '4e667998f84bb31536d6f8e775654ca3', 'Male', '95', '373 35', 'Horní Stropnice', 'Czech Republic', '5081396838', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('29369227', 'Sidonia Stelfox', 'sstelfox6e@shareasale.com', 'sstelfox6e', '2b69d7ccd7a478e3b37e382f88141f12', 'Female', '700', '175147', 'Teryayevo', 'Russia', '1591559647', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('85621646', 'Chelsie Barrable', 'cbarrable6f@multiply.com', 'cbarrable6f', '00b2ed23d2832eb9162a28b5a0979df9', 'Female', '8494', NULL, 'Akim Oda', 'Ghana', '3666980236', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('14885777', 'Brion Storry', 'bstorry6g@opensource.org', 'bstorry6g', '36376c13c4bfdedcea236b989e6407f2', 'Male', '428', NULL, 'Stari Bohorodchany', 'Ukraine', '9302805817', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('38503315', 'Paxton Mucklow', 'pmucklow6h@auda.org.au', 'pmucklow6h', '62a76f5b630a53594e5d3bef1ae7a0cb', 'Male', '8363', NULL, 'Huanggang', 'China', '2207151229', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('74498975', 'Marietta Von Hindenburg', 'mvon6i@reverbnation.com', 'mvon6i', 'cd3b479d10f9b47903c3a17bbd15b9d8', 'Male', '91986', NULL, 'Jiangwan', 'China', '3042341946', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('67185589', 'Genny Partrick', 'gpartrick6j@hubpages.com', 'gpartrick6j', '1803f03caca167e08de4371882fcf3dc', 'Female', '9092', '52420', 'Buzet', 'Croatia', '6963941193', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('94813110', 'Carny Oldcroft', 'coldcroft6k@bandcamp.com', 'coldcroft6k', 'd0c009a2eb2c35d46bd5cced26e3ce57', 'Male', '8054', NULL, 'Cidadap', 'Indonesia', '8702560151', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('48044987', 'Helena Breckwell', 'hbreckwell6m@issuu.com', 'hbreckwell6m', '724142b740978a51ce3fa8828086e0f0', 'Female', '70115', NULL, 'Yuquan', 'China', '2015573089', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('76684220', 'Junie Sharple', 'jsharple6n@weibo.com', 'jsharple6n', '27da93dd6ca7d76a04ef19aa3e13bad3', 'Female', '16216', NULL, 'Zaqatala', 'Azerbaijan', '2483271073', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('19407807', 'Putnem Domnick', 'pdomnick6o@ameblo.jp', 'pdomnick6o', '12fa23b5e22708e4acd2f08745535c0b', 'Male', '2', '91539', 'Lazaro Cardenas', 'Mexico', '9189328073', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('39932865', 'Waylan Duddell', 'wduddell6p@creativecommons.org', 'wduddell6p', 'c408770e8b3d38a5a27d66347e75efca', 'Male', '2874', NULL, 'Woloara', 'Indonesia', '7003026707', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('11002826', 'Lenard Lefeuvre', 'llefeuvre6q@imdb.com', 'llefeuvre6q', '2c760612f1fbf901014eac9cf74e3095', 'Male', '8', NULL, 'Shostka', 'Ukraine', '6349275141', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('10812366', 'Garret Gouny', 'ggouny6r@wikispaces.com', 'ggouny6r', '2a246bb70487de3895100835d807d3f5', 'Male', '0', '91664', 'El Arenal', 'Mexico', '2096424230', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('96304079', 'Christalle Brimman', 'cbrimman6s@qq.com', 'cbrimman6s', '7475d36d259d9acd3cc51186c4276ede', 'Female', '5', '21460', 'Emiliano Zapata', 'Mexico', '5507886388', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('52030417', 'Grady Marginson', 'gmarginson6t@marriott.com', 'gmarginson6t', 'd9c59ccbffc2d32c15bdf041b9ba759b', 'Male', '2', NULL, 'Isfana', 'Kyrgyzstan', '7479641293', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('58063828', 'Demetris Tranckle', 'dtranckle6u@g.co', 'dtranckle6u', 'ccad45fc1e54ae0ca999fb73c10e41aa', 'Female', '8441', '0773', 'Oslo', 'Norway', '6429011326', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('13831127', 'Edmund Veillard', 'eveillard6v@w3.org', 'eveillard6v', '9466976be920172e333851e627c36394', 'Male', '04923', '59058', 'Jieznas', 'Lithuania', '8549455939', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('84976605', 'Teirtza Bountiff', 'tbountiff6x@vk.com', 'tbountiff6x', '7ffc13bb5ce10b68df69f7a43b8981aa', 'Female', '62521', '6200-595', 'Teixoso', 'Portugal', '2096255313', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('88595421', 'Perri Kleinschmidt', 'pkleinschmidt6y@sciencedirect.com', 'pkleinschmidt6y', 'fd4cdcb36104daf528a269ec347692fc', 'Female', '265', NULL, 'Pingpo', 'China', '5065250119', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('11482087', 'Otis Lenihan', 'olenihan6z@ucoz.ru', 'olenihan6z', 'e474d103a92dba7ddf39190afe97e383', 'Male', '25', NULL, 'Široki Brijeg', 'Bosnia and Herzegovina', '8856456074', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('11793390', 'Lewiss Brazenor', 'lbrazenor71@npr.org', 'lbrazenor71', 'c84a77aad8fa0210bdd1cf481a209eaa', 'Male', '8', '83613 CEDEX', 'Fréjus', 'France', '5618210240', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('95988732', 'Leona Banes', 'lbanes72@globo.com', 'lbanes72', 'b415d3a6b063a71aa32681f0f62ba8d9', 'Female', '6900', NULL, 'Bedadung Kulon', 'Indonesia', '1571676682', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('37002245', 'Callida Parlor', 'cparlor73@dropbox.com', 'cparlor73', 'f09136768a29cbfbaf86795cefe37037', 'Female', '7', '4550-455', 'Paraíso', 'Portugal', '4151008232', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('18191391', 'Tybie Sewter', 'tsewter74@foxnews.com', 'tsewter74', '56cdf1a25d597345a4b7d0e1889f54b7', 'Female', '476', NULL, 'Khirbat Tīn Nūr', 'Syria', '4627158745', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('39918626', 'Blancha Tenney', 'btenney75@mail.ru', 'btenney75', '7084f131a8fd92621d041363f002b131', 'Female', '35894', NULL, 'Heshui', 'China', '9073805974', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('78437417', 'Latia Pohlke', 'lpohlke78@wikia.com', 'lpohlke78', '8349648763bc3198b73c805b53751404', 'Female', '48', NULL, 'Futian', 'China', '7294228273', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('87368749', 'Brandie Tottie', 'btottie79@photobucket.com', 'btottie79', 'dda8c45fccf048c838aba85ecd487d1d', 'Female', '428', NULL, 'Mangulewa', 'Indonesia', '2889807382', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('43211823', 'Tawsha Sutherington', 'tsutherington7a@sfgate.com', 'tsutherington7a', 'b2c79a274425de6421dba1e2f9898d02', 'Female', '402', NULL, 'Nanbao', 'China', '9728533230', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('18711601', 'Davidson Geddis', 'dgeddis7c@state.gov', 'dgeddis7c', '5e88765c991df7a2721d48ff0befba87', 'Male', '05', '4064', 'Stavanger', 'Norway', '6675805187', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('25594942', 'Teresina Ruffler', 'truffler7e@theatlantic.com', 'truffler7e', '6a2240fc191420cb4c667161631c6ba1', 'Female', '2188', '600902', 'Energetik', 'Russia', '9719994794', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('10019907', 'Say Greensall', 'sgreensall7g@paginegialle.it', 'sgreensall7g', '91b9c3b3370202010edc4935c4436144', 'Male', '71607', '1209', 'Hilversum', 'Netherlands', '1559123766', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('88585284', 'Merna Roycraft', 'mroycraft7h@wordpress.com', 'mroycraft7h', '6c1a46d55859f72b806a4605532b0c3f', 'Female', '42', NULL, 'Bongbong', 'Indonesia', '1565399324', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('34413639', 'Gianni Clace', 'gclace7i@google.ru', 'gclace7i', '46f63eb1961252feadcc21e1589f8b6b', 'Male', '821', '29390-000', 'Iúna', 'Brazil', '5842094229', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('94803020', 'Minnie Turmell', 'mturmell7k@opensource.org', 'mturmell7k', '57e13627f9bd8490a977b679b8479143', 'Female', '92', NULL, 'Tsyelyakhany', 'Belarus', '8051484157', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('45990993', 'Jorie McCamish', 'jmccamish7l@wp.com', 'jmccamish7l', 'abd5c927940065241f93b9e064298927', 'Female', '5832', '828 25', 'Edsbyn', 'Sweden', '9125454212', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('87903318', 'Nap Soares', 'nsoares7n@yahoo.co.jp', 'nsoares7n', 'c128a1c0e026061579dc5f1894fa37aa', 'Male', '1349', NULL, 'Weiyuan', 'China', '9644797564', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('52339802', 'Stacee Nobbs', 'snobbs7p@spotify.com', 'snobbs7p', 'aac1dc41512f688a284fe157de227284', 'Female', '3171', NULL, 'Yangpu', 'China', '2056969753', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('45003880', 'Taryn Chene', 'tchene7q@who.int', 'tchene7q', '964f603a9807f56b4dfa04dbeee4a2cc', 'Female', '7', NULL, 'Banjar Pangkungtibah Selatan', 'Indonesia', '1063507908', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('40287341', 'Timi Jeandot', 'tjeandot7r@globo.com', 'tjeandot7r', 'bf302143b519b23d8665e044236dac11', 'Female', '6', NULL, 'Lashio', 'Myanmar', '4824368657', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('83745905', 'Jamison Bowring', 'jbowring7s@ifeng.com', 'jbowring7s', '4b548bea671a6083420727f8ccb6d25b', 'Male', '437', NULL, 'Longping', 'China', '1932477357', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('75578483', 'Arnold Brotheridge', 'abrotheridge7u@latimes.com', 'abrotheridge7u', '1f91e0f3a99d211604740d1e5b467eac', 'Male', '339', '11680-000', 'Ubatuba', 'Brazil', '8105705301', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('13026430', 'Abbie Sunnex', 'asunnex7v@narod.ru', 'asunnex7v', '41109e2426e4347c5961e2623dd01e91', 'Male', '8', NULL, 'Todorovo', 'Bosnia and Herzegovina', '9533769952', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('68322432', 'Sarena Johnsson', 'sjohnsson7w@tamu.edu', 'sjohnsson7w', '1f9b2b162efcee328b114fbebcc416fe', 'Female', '31', NULL, 'Yanglinqiao', 'China', '2244225903', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('22443142', 'Yevette Beardshaw', 'ybeardshaw7x@hubpages.com', 'ybeardshaw7x', '698960c71463a2be66d459b06decc194', 'Female', '0', '4625-361', 'Prado', 'Portugal', '2132097670', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('98747530', 'Jami Grantham', 'jgrantham80@stumbleupon.com', 'jgrantham80', '1cc5095ddc822d12eb04c156c575f22b', 'Female', '572', '301233', 'Krapivna', 'Russia', '6648895077', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('14199948', 'Vinny Tremblot', 'vtremblot81@skype.com', 'vtremblot81', 'cb166c0f87e84a2ec90610f7bc093476', 'Female', '20053', NULL, 'Yangcun', 'China', '5956660165', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('98497686', 'Jermaine Ratnege', 'jratnege83@amazon.de', 'jratnege83', '06c28ac2ad368d6b38c2bd096b2e5236', 'Female', '57763', '77150', 'Kui Buri', 'Thailand', '3137927992', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('49480856', 'Joseph Tierney', 'jtierney84@fotki.com', 'jtierney84', 'bad8f6e346bb2d27e36a0a72082275d7', 'Male', '56897', NULL, 'Tisco', 'Peru', '7108335260', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('63799296', 'Jeff Caghy', 'jcaghy0@msn.com', 'jcaghy0', '6c98750843bbb7d953aee80757ae24f8', 'Male', '2', '503 51', 'Kladruby', 'Czech Republic', '1085564624', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('49424387', 'Almeda MacWhirter', 'amacwhirter1@hhs.gov', 'amacwhirter1', '883f8e22a762f94c90130b30a66676ed', 'Female', '9969', '664 84', 'Zbraslav', 'Czech Republic', '3045145810', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('41420808', 'Shellysheldon Smitherman', 'ssmitherman2@1und1.de', 'ssmitherman2', '881db570cd22aa80123dd82d5cb3390e', 'Male', '72004', '456049', 'Ust’-Katav', 'Russia', '2223281237', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('68118536', 'Francisca Cortese', 'fcortese3@nhs.uk', 'fcortese3', 'd5f1b1ae7d4eba24e28fa5f78a4f2771', 'Female', '7569', '94254 CEDEX', 'Gentilly', 'France', '1722301977', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('35979285', 'Sabina Posen', 'sposen4@soup.io', 'sposen4', 'f0650e7cfdd4bed061a94be32999933c', 'Female', '30722', NULL, 'Donghai', 'China', '6275405854', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('31182872', 'Kristofor Lyttle', 'klyttle5@wikimedia.org', 'klyttle5', 'f2b32237821d6f52380801a6dd08d2ec', 'Male', '025', '65011', 'Khairpur', 'Pakistan', '2094691558', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('31477791', 'Georgette Godly', 'ggodly6@home.pl', 'ggodly6', 'af04c1285cd8e3ec7d504f1dd5e86152', 'Female', '34', NULL, 'Xiaolongmen', 'China', '4473790871', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('64278564', 'Andrew Das', 'adas7@toplist.cz', 'adas7', 'b051430faef4361e24302f566a7c83ee', 'Male', '49598', NULL, 'Chaoyang', 'China', '9775545506', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('47960102', 'Sonnie Fearnside', 'sfearnside9@imgur.com', 'sfearnside9', 'beceb55d04fa197c22d23de443995557', 'Male', '7', NULL, 'Krutja e Poshtme', 'Albania', '8546886524', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('44415016', 'Temple Christol', 'tchristola@businesswire.com', 'tchristola', 'a088867db1c7e90d32e2d575a3e5600d', 'Male', '15431', NULL, 'Morbatoh', 'Indonesia', '8099538901', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('72327216', 'Valdemar Volk', 'vvolkb@t-online.de', 'vvolkb', 'c72c965e8c4b857ee425a11a4eceb95d', 'Male', '06484', NULL, 'Wujiayao', 'China', '3866205655', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('30597174', 'Harwilll Elson', 'helsonc@aol.com', 'helsonc', 'e941a00e237eef16261c5b14d707cbd7', 'Male', '7', '58305-000', 'Bayeux', 'Brazil', '7369191141', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('15755321', 'Eldridge Kuhl', 'ekuhld@ezinearticles.com', 'ekuhld', '556f8c4f1328daa9e775bcba23d7abe8', 'Male', '0178', '456918', 'Satka', 'Russia', '1786640270', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('29128768', 'Eugenia Gosart', 'egosarte@bluehost.com', 'egosarte', '1e4c305d6d06fd6b36e1e80f8e12e9a4', 'Female', '7321', '783 22', 'Vilémov', 'Czech Republic', '8912836823', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('54659137', 'Kevan Guerra', 'kguerraf@cam.ac.uk', 'kguerraf', '7737b50e50a9d79a34b680b5b3ad5c51', 'Male', '38130', NULL, 'Xiangyang', 'China', '1036589179', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('99369025', 'Travic Bolton', 'tbatcheldorg@quantcast.com', 'demo', '81dc9bdb52d04dc20036dbd8313ed055', 'Female', 'Nevada', '455639', 'Moscow', 'Russia', '01711202022', 'YES');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('66953281', 'Mellisent Jillins', 'mjillinsh@walmart.com', 'mjillinsh', '39ed4520d1510ce87bddc643ec7191d1', 'Female', '9741', '65430-000', 'Vargem Grande', 'Brazil', '6324716357', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('76765259', 'Morgan Schmuhl', 'mschmuhlk@instagram.com', 'mschmuhlk', '95adb76ee6fd2558d3f0fc67bb0b0d5c', 'Male', '30204', NULL, 'Qumudi', 'China', '3045325740', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('60354635', 'Ulric Sickamore', 'usickamorel@google.it', 'usickamorel', 'afe8f8f1cb68f0b3a4fba5d348dc71bd', 'Male', '46655', NULL, 'Sembungin', 'Indonesia', '1708457129', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('52082766', 'Maddy Kunath', 'mkunathm@va.gov', 'mkunathm', '56d5730ea1801708b25dbcedab2f785c', 'Female', '9757', '7743', 'Rakaia', 'New Zealand', '3327905424', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('80085073', 'Courtney Van der Kruijs', 'cvann@etsy.com', 'cvann', '7f3c7211f0e0a83dad0a53d41da2dbea', 'Male', '14727', NULL, 'Sanchahe', 'China', '7049658964', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('29024339', 'Hubey Payfoot', 'hpayfooto@pbs.org', 'hpayfooto', 'cad9f02d6fd4c98b27148c7e3c6b5638', 'Male', '35', '361624', 'Tyrnyauz', 'Russia', '2186768295', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('88975444', 'Ernie Thoma', 'ethomap@blinklist.com', 'ethomap', 'bdf148406b2fe0a7ea4bfa040e1e166d', 'Male', '9', NULL, 'Shijiao', 'China', '8472345099', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('25395286', 'Wally Preece', 'wpreeceq@woothemes.com', 'wpreeceq', '0535411a76d78dd60fb9057c1b84ffe8', 'Male', '71', '154648', 'Chiquinquirá', 'Colombia', '7929352486', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('61003865', 'Fenelia Carlisso', 'fcarlissor@mysql.com', 'fcarlissor', 'b02b0d07e84cefb4f272da434281e28d', 'Female', '77365', NULL, 'Rízoma', 'Greece', '3671485729', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('67432538', 'Elizabeth Tattersall', 'etattersalls@ucsd.edu', 'etattersalls', 'bf526f5003a44f8c14659d684e693189', 'Female', '8', '58880', 'Guadalupe', 'Mexico', '5141728616', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('90071131', 'Leonhard Gordon', 'lgordont@theatlantic.com', 'lgordont', 'e975985933098b4081a81ccf92c5de5b', 'Male', '719', NULL, 'Hongjiang', 'China', '2247587726', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('25751655', 'Steffane Harvatt', 'sharvattv@fastcompany.com', 'sharvattv', '6e7eb52dab2ae4ce146a3fdb6278aea9', 'Female', '9746', NULL, 'Mulifanua', 'Samoa', '1211438470', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('31307883', 'Carlynne Grimolbie', 'cgrimolbiew@mozilla.com', 'cgrimolbiew', '06ef84e82c07fdca671cef7d6ec7dfca', 'Female', '41644', NULL, 'Zhangcun', 'China', '8036876509', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('14524524', 'Devlin Iddenden', 'diddendenx@columbia.edu', 'diddendenx', 'e2b14f2d60b672eef1d21d2ea8484369', 'Male', '90', NULL, 'Cañete', 'Chile', '5439549011', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('77596787', 'Rubi Lathwood', 'rlathwoody@biglobe.ne.jp', 'rlathwoody', '6cfaf9e499331f84113c43f82291ed77', 'Female', '5288', NULL, 'Sukodono', 'Indonesia', '9972886902', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('32301185', 'Antonetta Sapey', 'asapey10@seesaa.net', 'asapey10', '8dc44c1074e86e26f8616fa942a1fae3', 'Female', '8015', '75640-000', 'Piracanjuba', 'Brazil', '2916775983', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('32977027', 'Jade Mozzini', 'jmozzini11@usatoday.com', 'jmozzini11', '530d56443e8964509436057bd99ee454', 'Female', '5', '91131', 'Pasadena', 'United States', '7173652565', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('43004036', 'Kristy Hassett', 'khassett12@abc.net.au', 'khassett12', 'aa179696b65709112dfb009124b7a579', 'Female', '2411', '5032', 'Igang', 'Philippines', '7012452472', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('68929679', 'Emmy Tinman', 'etinman13@boston.com', 'etinman13', 'eca7649e7fcca37c8ca6701eb4bce797', 'Male', '2051', NULL, 'Chenfangji', 'China', '5332762106', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('26927258', 'Uta Lintall', 'ulintall17@reverbnation.com', 'ulintall17', '62ecfd2189d2d2a790ebc635c665fa6b', 'Female', '8', NULL, 'Mernek', 'Indonesia', '9157279115', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('37142688', 'Elmo Jaze', 'ejaze18@arstechnica.com', 'ejaze18', 'e1bdfc5d66b34d54e278793ab59dc880', 'Male', '4148', NULL, 'Stizhkivs’ke', 'Ukraine', '8155552870', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('16949424', 'Wileen Brownrigg', 'wbrownrigg1a@mlb.com', 'wbrownrigg1a', '8c482059a192f5cb54c83cdea427315b', 'Female', '804', NULL, 'Larkird', 'Afghanistan', '7183031057', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('93394941', 'Sidonia de Najera', 'sde1b@ca.gov', 'sde1b', '08daeabfda9bd9e0bc9fd854536c6a6c', 'Female', '96', NULL, 'Bungbulang', 'Indonesia', '3616581349', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('91312311', 'Meris Von Salzberg', 'mvon1c@shinystat.com', 'mvon1c', '6d251facc87715b0e0d487592a0a69b1', 'Female', '754', NULL, 'Sukamaju', 'Indonesia', '5293403085', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('54862011', 'Lidia Stonard', 'lstonard1d@domainmarket.com', 'lstonard1d', 'e7d8fae1f90c42163f64fce282229c1e', 'Female', '2185', NULL, 'Pandak', 'Indonesia', '6083798677', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('49909947', 'Sergent Tatham', 'statham1f@hatena.ne.jp', 'statham1f', '39c0fa723bb9a601f8d441ea78dd7447', 'Male', '0719', '415088', 'La Argentina', 'Colombia', '2007700369', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('20136126', 'Ragnar Martinez', 'rmartinez1g@yellowbook.com', 'rmartinez1g', 'fe36e0eade70e0afb32019c8238c73f2', 'Male', '994', NULL, 'Henglian', 'China', '1108711238', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('81238210', 'Harris O''Caine', 'hocaine1h@nasa.gov', 'hocaine1h', 'e1d064523fba82e37a3a2295d421f944', 'Male', '27499', '3318', 'Pagsabangan', 'Philippines', '9456954636', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('57845972', 'Lazar Endrighi', 'lendrighi1k@washington.edu', 'lendrighi1k', '7bff4b2125a1b020e52c5b80f26f2772', 'Male', '48', '89294-000', 'Campo Alegre', 'Brazil', '3181462578', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('13871317', 'Leigha Perche', 'lperche1l@netlog.com', 'lperche1l', 'e11f16fe9735c1c6ef307fb5a612db19', 'Female', '33370', NULL, 'Gesing', 'Indonesia', '8782577628', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('24205525', 'Aaron Brothwood', 'abrothwood1m@chronoengine.com', 'abrothwood1m', '82a85d41e31e15a1f9ac891b6d1b9ed0', 'Male', '68', '8711', 'San Fernando', 'Philippines', '9626247412', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('20216027', 'Wally Bushnell', 'wbushnell1o@tinypic.com', 'wbushnell1o', '21ce1222268aae8b16d011dab21ac504', 'Male', '22626', '601642', 'Karabanovo', 'Russia', '2088971923', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('85154043', 'Greg Dingwall', 'gdingwall1p@symantec.com', 'gdingwall1p', '36f2edf845898e9113ea4824212f6803', 'Male', '02', NULL, 'Ivyanyets', 'Belarus', '6437974571', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('42533116', 'Dillon Quodling', 'dquodling1q@goodreads.com', 'dquodling1q', 'bb51c730995f8d2f332821e98fbd0725', 'Male', '40', '02070', 'Albacete', 'Spain', '5537456563', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('82819325', 'Natal Cow', 'ncow1r@cyberchimps.com', 'ncow1r', 'be83fecbf5eece2fccd17f38bcf24911', 'Male', '65584', NULL, 'Umm Ruwaba', 'Sudan', '5058840310', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('84193539', 'Pierson Karran', 'pkarran1t@cbsnews.com', 'pkarran1t', 'ccd4d290671d5f4ffb74425cf1f4f555', 'Male', '1543', NULL, 'Hufang', 'China', '5364090025', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('86647047', 'Jareb Graham', 'jgraham1u@cdc.gov', 'jgraham1u', 'a62f318327f12c2ea33727e99b032923', 'Male', '708', NULL, 'Wanliang', 'China', '9561029790', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('64006411', 'Andrei Staddom', 'astaddom1w@meetup.com', 'astaddom1w', '64116954a15ba4bf7630b8fc5904262f', 'Female', '96095', NULL, 'Shanban', 'China', '6264746863', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('41500951', 'Val Lydden', 'vlydden1y@state.gov', 'vlydden1y', 'a14d34874536713a359d6342775093dc', 'Male', '5', NULL, 'Badrah', 'Mongolia', '7623913747', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('32182552', 'Roxi Coryndon', 'rcoryndon1z@abc.net.au', 'rcoryndon1z', 'e9e6bf5de10d17785ec947b097a222a7', 'Female', '73', 'E1W', 'Lac La Biche', 'Canada', '8913407920', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('55071025', 'Brander Fitzackerley', 'bfitzackerley22@feedburner.com', 'bfitzackerley22', 'c96a8b537b68854f563779270887218b', 'Male', '15736', '1301', 'Belfast', 'South Africa', '5942820531', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('88511107', 'Ramisa Alam', 'ramisa2108@gmail.com', 'ramu', '931af583573227f0220bc568c65ce104', 'Female', 'Zigatola', '1209', 'Dhaka', 'Bangladesh', NULL, 'YES');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('94605305', 'akhao', 'tagah@as.com', 'uhfis', 'a4dbfd6aef3b4045fe61aa0146debdf8', 'Female', 'asfh', 'cjan', 'cniuac', 'co', NULL, 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('20352116', 'New User', 'ramisa2108@gmail.com', 'new_user', '81dc9bdb52d04dc20036dbd8313ed055', 'Female', 'ad', '123', 'Dhaka', 'Bangladesh', NULL, 'YES');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('27281358', 'Leonardo Dicaprio', 'ramisa2108@gmail.com', 'leo', '81dc9bdb52d04dc20036dbd8313ed055', 'Male', 'Brooklyn', '18038', 'New York', 'United States of America', '01751703524', 'YES');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('44652748', 'new', 'newuser@gmail.com', 'mynew', '81dc9bdb52d04dc20036dbd8313ed055', 'Male', '123', '123', 'Dhaka', 'bangladesh', NULL, 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('70199973', 'user', 'ramisa2108@gmail.com', 'user', '81dc9bdb52d04dc20036dbd8313ed055', 'Male', 'Zigatola', '1209', 'Dhaka', 'Bangladesh', NULL, 'YES');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('59213803', 'rr', 'adsd@GMAL.CM', 'rr', '12', 'Female', 'awe', '123', 'adsd', 'dasd', NULL, 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('98080750', 'rr', 'nadkjn@bfkah', 'rr', '123', 'Male', 'majfoi', 'cjaoijf', 'joij', 'ajdiaj', NULL, 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('41623534', 'test', 'test@email.com', 'test', 'c4ca4238a0b923820dcc509a6f75849b', 'Male', '123', '1234', 'chittagong', 'ban', NULL, 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('45903861', 'Pink Panther', 'pp@gmail.com', 'pink', 'af990d62fd53137ddadc6f22a8e2753e', 'Female', 'dhanmondi', '1209', 'dhaka', 'bangladesh', NULL, 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('89418085', 'Halsy Glasner', 'hglasner2d@stanford.edu', 'hglasner2d', 'c16e6a0658e7311b70e97c158e622569', 'Male', '07717', NULL, 'Novovolyns’k', 'Ukraine', '8924362423', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('77850608', 'demouser', 'newuser@gmail.com', 'demouser', '202cb962ac59075b964b07152d234b70', 'Female', 'Zigatola', '1209', 'dhaka', 'bangladesh', NULL, 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('79052797', 'namira', 'namu@gmail.com', 'namu', '81dc9bdb52d04dc20036dbd8313ed055', 'Female', 'bloomingdales', '1239', 'new york', 'usa', NULL, 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('71817616', 'Mendie Paterno', 'mpaterno2o@google.com.hk', 'mpaterno2o', '0eece3a1e7a7392463e3487691796658', 'Male', '07', '86730-000', 'Astorga', 'Brazil', '4512280819', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('88846787', 'Helli Kummerlowe', 'hkummerlowe2z@cornell.edu', 'hkummerlowe2z', '203f2dd03d97d3d741844591bb5b5edc', 'Female', '44', '33715', 'Saint Petersburg', 'United States', '3415034696', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('61342201', 'Fax Fairholme', 'ffairholme3h@answers.com', 'ffairholme3h', '5129d441e5ce8f26b46f4641409b58c2', 'Male', '857', NULL, 'Huangshan', 'China', '8176533238', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('25741863', 'Barth Jovic', 'bjovic3v@wikipedia.org', 'bjovic3v', '64750a4354405788c4c1234f27da90b6', 'Male', '611', NULL, 'Mehrān', 'Iran', '2157827791', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('37530793', 'Melva Coulthard', 'mcoulthard86@joomla.org', 'mcoulthard86', '53f865dda0cd9007bf3fa917edfbd2d4', 'Female', '6682', NULL, 'Boncis', 'Indonesia', '3384816560', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('43470033', 'Hallie McIlwaine', 'hmcilwaine8h@soup.io', 'hmcilwaine8h', 'a63171511a6833feb3fa26f009196b10', 'Female', '508', NULL, 'Stony Hill', 'Jamaica', '9726367259', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('83336439', 'Hurleigh Padula', 'hpadula8s@hhs.gov', 'hpadula8s', '5cf16f9ce2dfd10b3c144030797ca077', 'Male', '95496', NULL, 'Yangdang', 'China', '7135789054', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('64625951', 'Granger Pasterfield', 'gpasterfield94@mapy.cz', 'gpasterfield94', '31cc20521e1c506c7f9bb96522a7f0b1', 'Male', '75713', NULL, 'Tambura', 'South Sudan', '8142554538', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('58948973', 'Fredric Perrottet', 'fperrottet9j@independent.co.uk', 'fperrottet9j', '469b36a96206b38246b923174c9c9f13', 'Male', '74', NULL, 'Huanghe', 'China', '7438412033', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('72244638', 'Odie Mealand', 'omealand9x@51.la', 'omealand9x', '029fc6f5828ea169ad4b176cb3663c09', 'Male', '5618', NULL, 'Qesarya', 'Israel', '4497822861', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('36428384', 'Marsh Carik', 'mcarik4e@skype.com', 'mcarik4e', 'b25036786ecff9b0b687bc4c0ea83320', 'Male', '57512', '176048', 'Palestina', 'Colombia', '4756152464', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('92824210', 'Kirsti Baggalley', 'kbaggalley4p@prweb.com', 'kbaggalley4p', '3ef36369b4fd9c1fe8c2886bdaf07b1d', 'Female', '215', NULL, 'Tonggakjati', 'Indonesia', '9987505897', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('49382076', 'Libby Allkins', 'lallkins50@jiathis.com', 'lallkins50', '69482758f496344a5ad12983211fc896', 'Female', '08', NULL, 'Yihe', 'China', '6774899202', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('56441596', 'Faye Kuschek', 'fkuschek5c@multiply.com', 'fkuschek5c', '3d32c01e0ed18192d4993565d78100e6', 'Female', '33798', NULL, 'Tehetu', 'China', '8286178246', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('52083514', 'Xerxes Aspland', 'xaspland5q@nymag.com', 'xaspland5q', '8c8e08ee394e11dba97449f0b845023c', 'Male', '6391', NULL, 'Prozor', 'Bosnia and Herzegovina', '3549441328', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('62040942', 'Tedman Gyppes', 'tgyppes69@businessweek.com', 'tgyppes69', '8477c4dc612674663c9040e54a3ddeed', 'Male', '7950', '396882', 'Nizhnedevitsk', 'Russia', '3745125338', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('27409335', 'Anabal Ionnidis', 'aionnidis6l@wufoo.com', 'aionnidis6l', '9c0669912f68f68639191cabf7929084', 'Female', '82', NULL, 'Wonorejo', 'Indonesia', '4037417779', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('74370008', 'Geno Florez', 'gflorez6w@senate.gov', 'gflorez6w', '97e630451a32d2e2b04189f909346e41', 'Male', '9872', NULL, 'Cibalung', 'Indonesia', '6613278268', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('86320169', 'Lisha Balderson', 'lbalderson77@free.fr', 'lbalderson77', '07706fe57f753309b24e6376227bb091', 'Female', '4541', '59-630', 'Mirsk', 'Poland', '7189511950', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('92290129', 'Hansiain Laurant', 'hlaurant7m@uol.com.br', 'hlaurant7m', '3e55df6f77052f292f6d5e0f9e871970', 'Male', '9', NULL, 'Mopti', 'Mali', '6596813608', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('87276680', 'Dorthea Pandie', 'dpandie7z@github.com', 'dpandie7z', '1aab4188fb1c2c8ff81bca4e2d3a21b2', 'Female', '17202', '19610', 'Reading', 'United States', '3268817143', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('99106853', 'Timothea Kinghorne', 'tkinghorne8@flavors.me', 'tkinghorne8', 'b652b0bc8839e5a6283c39d895e76faf', 'Female', '9', NULL, 'Corail', 'Haiti', '5873022396', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('40405067', 'Jacqui Roggeman', 'jroggemanj@bravesites.com', 'jroggemanj', '5d7dcce39437475f37510ccbb811b3ac', 'Female', '6', NULL, 'Sukasirna', 'Indonesia', '2685730154', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('84228198', 'Wallas Snell', 'wsnellu@goo.gl', 'wsnellu', 'ce4f91b773511ba6d4354f4cbcd405c7', 'Male', '8', NULL, 'Ha’erlong', 'China', '1125557021', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('17692824', 'Hillie McCleary', 'hmccleary16@nature.com', 'hmccleary16', '5c4fc8906875392b5957428dc9d35259', 'Male', '214', NULL, 'Bobai', 'China', '2408476658', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('85481677', 'Coop De Giovanni', 'cde1j@soundcloud.com', 'cde1j', 'bf8f3205828f1dc94d035bf984071137', 'Male', '2', NULL, 'G’uzor', 'Uzbekistan', '5984057832', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('18542858', 'Rustin Ashe', 'rashe1v@usnews.com', 'rashe1v', '5b7a1f7cbff1a57861f9d5f5ff0a5baf', 'Male', '082', 'A63', 'Greystones', 'Ireland', '8677976777', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('68107710', 'Catherine Golthorpp', 'cgolthorppa5@disqus.com', 'cgolthorppa5', '4d70859c13e155873d37a09e284d374f', 'Female', '6', NULL, 'Cheongju-si', 'South Korea', '6097367516', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('23270878', 'Antoinette Vaune', 'avauneah@ucla.edu', 'avauneah', '3e4ddf8cf0e246e477eacec5188ab4ed', 'Female', '21124', '45911 CEDEX 9', 'Orléans', 'France', '2809174700', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('46482981', 'Hastings Benninck', 'hbenninckat@squidoo.com', 'hbenninckat', 'ca5d17d4faca83620a2390f06c6f30fa', 'Male', '99', NULL, 'Rosario del Ingre', 'Bolivia', '5417221415', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('26056271', 'Aubert Marien', 'amarienb6@sourceforge.net', 'amarienb6', 'ea4bfb4ac5b8d0e3af70551a7e0ba820', 'Male', '9', NULL, 'Gabasumdo', 'China', '2043557965', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('92915330', 'Hobie Adran', 'hadranbk@sina.com.cn', 'hadranbk', 'dfc98b1bbbd92490079c39da0c949a3b', 'Male', '47', '687509', 'El Playón', 'Colombia', '5401007075', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('38952625', 'Ettore Agirre', 'eagirrebw@icq.com', 'eagirrebw', '5811bfa372bcab177609b090df49369b', 'Male', '23', NULL, 'Ourovéni', 'Comoros', '7344511185', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('56835858', 'Wilmer Fidelus', 'wfidelusci@ifeng.com', 'wfidelusci', '73c132e37b36c936e682d088705c2325', 'Male', '427', NULL, 'Waipukang', 'Indonesia', '5105285064', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('94316377', 'Andre Driver', 'adriverct@wikipedia.org', 'adriverct', 'd1b46d2b390ba32e5df6b2a346730833', 'Male', '7', NULL, 'Zhuxi', 'China', '9033629492', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('88801156', 'Tanny Ruckman', 'truckmand3@webmd.com', 'truckmand3', 'b833b23177231e38f7f24816843dc0f8', 'Male', '4', NULL, 'Gadon', 'Indonesia', '6704917570', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('42975160', 'Fredelia Druhan', 'fdruhandd@ca.gov', 'fdruhandd', '5c6156b51d40e2736ec50e8d37cbb481', 'Female', '9082', NULL, 'Jihui', 'China', '6505716460', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('88422339', 'Camile Haimes', 'chaimesdn@bbc.co.uk', 'chaimesdn', '1db27eec8a1bdca510ebad2db3b46964', 'Female', '527', '5875', 'San Javier', 'Argentina', '4862087363', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('51806562', 'Nelie Abells', 'nabells2b@elpais.com', 'nabells2b', '3eff72163e4755afbf56d0818059664a', 'Female', '256', NULL, 'Barrouallie', 'Saint Vincent and the Grenadines', '8093735525', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('50712648', 'Cynthia Landrick', 'clandricki@businessweek.com', 'clandricki', '724d29e583083e69c2f8be373d971e7c', 'Female', '7', NULL, 'Batan', 'China', '5975170474', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('44947749', 'Melva Ornelas', 'mornelas20@is.gd', 'mornelas20', '026e8d408b6b805482c2012007b95407', 'Female', '61', NULL, 'Xinxing', 'China', '5282724000', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('52109675', 'Karilynn Rowlson', 'krowlson2f@yahoo.co.jp', 'krowlson2f', '25a25c8844af28bba0658081b480a15c', 'Female', '6428', '2445', 'Bantog', 'Philippines', '8837017714', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('57860689', 'Moria Slowey', 'mslowey47@newsvine.com', 'mslowey47', '69ee6d4606c22531397c4666e6964ad7', 'Female', '72', '188832', 'Korobitsyno', 'Russia', '2865620799', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('73225274', 'Greer Sircomb', 'gsircomb7d@weibo.com', 'gsircomb7d', '8ed48a75847b34dfe566c14b3935e412', 'Female', '286', '261 45', 'Landskrona', 'Sweden', '9968326348', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('99759360', 'Harlin Streeten', 'hstreeten8v@soundcloud.com', 'hstreeten8v', 'f31ae4f305e03f7b7cceecfb04ad2d9c', 'Male', '533', NULL, 'Mingshui', 'China', '8493648996', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('89175564', 'Ber Riglesford', 'briglesfordas@tmall.com', 'briglesfordas', '8d1ae6d77b8eee81f1dd3c981de13b81', 'Male', '67', NULL, 'Dongfanghong', 'China', '2592021278', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('63674114', 'Danyette Andryunin', 'dandryunincc@cafepress.com', 'dandryunincc', 'b0bb8db1963a20107286eb616b17f401', 'Female', '858', '546058', 'La Esperanza', 'Colombia', '1348354070', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('83292738', 'Herb Blonden', 'hblonden42@businesswire.com', 'hblonden42', '6f5a2d92ecdbaf485932b530ccb162e5', 'Male', '1595', '2430', 'Lunec', 'Philippines', '8481336932', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('23807220', 'Westbrook Barkworth', 'wbarkworth8p@nyu.edu', 'wbarkworth8p', 'c07458d3ddccb540f8db5a193caf06d7', 'Male', '161', '601808', 'Sosnovyy Bor', 'Russia', '3299728660', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('49586771', 'Selma Challis', 'schallis4a@twitpic.com', 'schallis4a', 'e0b6314f7d24f9925a733eff508d26d6', 'Female', '7683', 'A84', 'Ashbourne', 'Ireland', '5071605901', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('62180158', 'Felice Weymont', 'fweymont5r@soup.io', 'fweymont5r', '3ecb7ee9d91d5abaa56d93278c60fdfd', 'Male', '21668', '47-330', 'Rozwadza', 'Poland', '8498665197', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('73915372', 'Bobinette Milbourn', 'bmilbourn70@amazon.de', 'bmilbourn70', '766dfa39a89d23b7fdd0eb464755992d', 'Female', '13', NULL, 'An Naşr', 'Palestinian Territory', '9851360622', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('75049110', 'Odey Meegan', 'omeegan15@taobao.com', 'omeegan15', '4aed5c4a5253d939a33433532bbe178d', 'Male', '997', '944 73', 'Piteå', 'Sweden', '5853850071', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('31538682', 'Bobby Struijs', 'bstruijsan@mail.ru', 'bstruijsan', 'ece81bd8b4744e126b16bc995971d05a', 'Male', '69', '71122', 'Vicente Guerrero', 'Mexico', '9285771723', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('87506712', 'Alfy Cake', 'acakecj@yandex.ru', 'acakecj', 'd5e6fe740180514bc439cc5b14e95e9a', 'Female', '68472', NULL, 'Sanqishi', 'China', '2765106354', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('52457421', 'Berton Dinning', 'bdinningdp@webs.com', 'bdinningdp', 'f80e9156925370955ba09a6e309a8ffe', 'Male', '4503', NULL, 'Nedryhayliv', 'Ukraine', '1825284046', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('43985349', 'Tris Riordan', 'triordan31@tumblr.com', 'triordan31', 'd0ad9dd62cba59ecd5209357cbde0cbc', 'Male', '4', '77109 CEDEX', 'Meaux', 'France', '8997753952', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('66212304', 'Mickey Waple', 'mwaple36@etsy.com', 'mwaple36', 'c8b1485c650d7919e811ba64794644d4', 'Male', '251', NULL, 'Shibīn al Kawm', 'Egypt', '8115380238', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('32578032', 'Mikael Lympany', 'mlympany3b@ucla.edu', 'mlympany3b', '815d228379d7b80b902ecc7769d28ec3', 'Male', '1197', '5730', 'Fort Beaufort', 'South Africa', '7899543367', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('21920243', 'Bartholomew Danielsky', 'bdanielsky3g@mapquest.com', 'bdanielsky3g', 'c53a96c9695f31f5f79c12dc42e92b37', 'Male', '3', NULL, 'Leiyang', 'China', '8783789230', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('70003216', 'Roze Blitz', 'rblitz3l@irs.gov', 'rblitz3l', 'b3360b2dbc3b811eea9084a9e4bc277e', 'Female', '772', NULL, 'Al ‘Alamayn', 'Egypt', '3196703632', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('86700566', 'Enrica Papierz', 'epapierz3p@privacy.gov.au', 'epapierz3p', '97dc502736c3f473b0dbb13d280c413f', 'Female', '6', NULL, 'Xiangfu', 'China', '2005736423', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('23886374', 'Gaylor Danton', 'gdanton3u@163.com', 'gdanton3u', 'dfb4a4e03dfff74c2939a5c1bbe10977', 'Male', '3', NULL, 'Dajie', 'China', '4995656835', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('87870005', 'Sibyl Layus', 'slayus3y@dailymotion.com', 'slayus3y', 'c0c338f7d845da283587720fcf00aa69', 'Female', '13', '738 34', 'Norberg', 'Sweden', '2034072742', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('69028419', 'Drucie Michelotti', 'dmichelotti43@weebly.com', 'dmichelotti43', 'f60aab377e1bfc1fc3dfa740a5772379', 'Female', '1', NULL, 'Krajan C Wonorejo', 'Indonesia', '7709955554', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('11506974', 'Perice Fritschel', 'pfritschel93@aboutads.info', 'pfritschel93', '578d84ff833e715c7098b9f60ab9c9de', 'Male', '16', NULL, 'San Patricio', 'Paraguay', '4665190071', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('37950771', 'Montgomery Jeff', 'mjeff98@yolasite.com', 'mjeff98', '4dc8e8fce4cfe597908ef09e9453c83c', 'Male', '3346', NULL, 'Druju', 'Indonesia', '7403916218', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('15988048', 'Marsh Maw', 'mmaw9c@g.co', 'mmaw9c', 'a6b0722e287d0116b26c6ecafba5812e', 'Male', '8344', 'V3B', 'Bay Roberts', 'Canada', '4727621473', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('13671780', 'Pip Levi', 'plevi9g@about.com', 'plevi9g', '0e4dffb8098ba3cf3dbe9e2c9b858a11', 'Male', '3', '9101', 'Tupsan', 'Philippines', '5765606547', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('67847535', 'Wilhelm Pinor', 'wpinor9l@bbb.org', 'wpinor9l', '0e466cea2111763032fae92cab27f51e', 'Male', '41', '73209 CEDEX', 'Albertville', 'France', '8279753485', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('32218496', 'Marcie Dennison', 'mdennison9p@hugedomains.com', 'mdennison9p', '56e6674fcfbe53c715da51cb88952c19', 'Female', '353', '10607', 'Azua', 'Dominican Republic', '2039207986', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('95090073', 'Cosetta MacCracken', 'cmaccracken9v@edublogs.org', 'cmaccracken9v', '8f9ce5cbb8e4afc7861b361fad0b9d97', 'Female', '44', NULL, 'Klagen', 'Indonesia', '4278358282', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('37709227', 'Earlie Coard', 'ecoarda0@hp.com', 'ecoarda0', 'cd9a05911eef0a0043945c354fecf441', 'Male', '231', '56109 CEDEX', 'Lorient', 'France', '1427363852', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('65805016', 'Libbey Busst', 'lbusst57@businessweek.com', 'lbusst57', '1d3f410b038b9693fea61c23997a2a5f', 'Female', '7867', NULL, 'Lajarik', 'Indonesia', '5663771151', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('31812344', 'Essa Ivantyev', 'eivantyev5b@wisc.edu', 'eivantyev5b', 'f102552ed52c7c094c45c1486dba4c29', 'Female', '82', NULL, 'Dingtao', 'China', '4171057855', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('31179521', 'Bibby Raper', 'braper5f@cnet.com', 'braper5f', '73edcc3e7e94b301dd2e058cdf428d91', 'Female', '446', NULL, 'Shijia', 'China', '5191890668', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('20976417', 'Giorgia Coviello', 'gcoviello5j@blogtalkradio.com', 'gcoviello5j', 'ed119f1f0d5e6c835ea67e583848fc9f', 'Female', '2361', NULL, 'Al Muharraq', 'Bahrain', '3884869399', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('49701690', 'Laina Motte', 'lmotte5p@utexas.edu', 'lmotte5p', 'd3a2ed39429dc0450310125d92aeb54d', 'Female', '50502', NULL, 'Long Loreh', 'Indonesia', '2349961994', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('25684802', 'Mireielle Taverner', 'mtaverner5u@apache.org', 'mtaverner5u', 'dff74336f6cef209d5c649c7141493bf', 'Female', '16', '26360', 'Lāchi', 'Pakistan', '1315666070', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('85261140', 'Roxane Doble', 'rdoble5z@smh.com.au', 'rdoble5z', '08a482866f8e2f2fc4b0b633a4edd952', 'Female', '18653', NULL, 'Tajike’abati', 'China', '6583065400', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('78494561', 'Delmor Wiper', 'dwiper64@blog.com', 'dwiper64', '7b316408b6a23add39594a4d8044e76c', 'Male', '5628', '934-0099', 'Nishishinminato', 'Japan', '7899093551', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('68441127', 'Willette Sowray', 'wsowray76@live.com', 'wsowray76', '7c69a0a4953ab651716eb3de1b49dd31', 'Female', '74570', NULL, 'Xinlong', 'China', '7572619464', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('57592880', 'Luigi Hamby', 'lhamby7b@nature.com', 'lhamby7b', 'fb1b7a613bef1df79434bd434ec10447', 'Male', '346', NULL, 'Lukićevo', 'Serbia', '7195034799', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('69436480', 'Cherice Sorbie', 'csorbie7f@ning.com', 'csorbie7f', '88ec63a923b19b590b3083fac24f29fc', 'Female', '725', NULL, 'Buket Teukuh', 'Indonesia', '5121156122', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('57105482', 'Donia Barta', 'dbarta7j@bing.com', 'dbarta7j', 'a7aa7fc331d27783a8f345d6392da43f', 'Female', '6282', NULL, 'Aranos', 'Namibia', '9563524573', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('35714135', 'Georgina Lycett', 'glycett7o@biglobe.ne.jp', 'glycett7o', 'b0c7dc4452876405a20965f884dabb34', 'Female', '91', '30502', 'La Suiza', 'Costa Rica', '6142009459', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('44289139', 'Mickie Scarlet', 'mscarlet7t@mozilla.org', 'mscarlet7t', '26e2525cf7eb443b96e66a6eee9a76e7', 'Female', '57429', '69001', 'Chishtiān Mandi', 'Pakistan', '9944398640', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('81144966', 'Jobi Gass', 'jgass7y@japanpost.jp', 'jgass7y', 'd66e9f7666d6985975e0442197f98025', 'Female', '5', NULL, 'Weishan', 'China', '4593692311', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('18476174', 'Gerrard Wyllis', 'gwyllis82@dot.gov', 'gwyllis82', '6e2acdc65d5343b3fec33139b3be9ec0', 'Male', '93', NULL, 'Toubao', 'China', '9188658689', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('45756539', 'Carlyle Madelin', 'cmadelinz@privacy.gov.au', 'cmadelinz', '98054cbe70c276872b54c1ae199571ac', 'Male', '5', 'M1M', 'Pictou', 'Canada', '4852547381', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('82307219', 'Pembroke Deshorts', 'pdeshorts14@opera.com', 'pdeshorts14', '80d38c8ffd8aac4d5963f9aebf32cc59', 'Male', '74', '989-1505', 'Ono', 'Japan', '5126692234', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('75561123', 'Essy Doul', 'edoul19@1688.com', 'edoul19', 'a7095b9384467984a07080680b9d9a26', 'Female', '38', '2989', 'Ridderkerk', 'Netherlands', '5179515710', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('96653499', 'Husein Gayne', 'hgayne1e@illinois.edu', 'hgayne1e', 'bb3d848ce5b7d3f6497a13ba9728673e', 'Male', '7', NULL, 'Fengxi', 'China', '2207638713', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('75907267', 'Fina Clementel', 'fclementel1i@google.com', 'fclementel1i', 'b25eff05bf2599e5b98288c9398b920e', 'Female', '868', NULL, 'Molepolole', 'Botswana', '7607906206', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('34408667', 'Amalee Rohlfs', 'arohlfs1n@eepurl.com', 'arohlfs1n', '3a4337d53456c4c4a5dc4f1858f021ee', 'Female', '17441', '18706', 'Wilkes Barre', 'United States', '6669840087', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('39266562', 'Kathryne Faber', 'kfaber1s@ovh.net', 'kfaber1s', '68e9efc80293f9c1661fe0f695c2e20c', 'Female', '67', '2436', 'Binalonan', 'Philippines', '8034876239', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('12278032', 'Haze Casterton', 'hcasterton1x@yolasite.com', 'hcasterton1x', '95f5068beac613ac481a2e746c127d99', 'Male', '792', NULL, 'Argavand', 'Armenia', '3416753474', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('86860078', 'Aigneis Jedrys', 'ajedrys21@goo.gl', 'ajedrys21', '2fb6bfec6137c39dbb978a58569cdeb5', 'Female', '0', '1114', 'Punolu', 'Philippines', '8923503947', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('90795597', 'Gretal Roscam', 'groscamb5@miitbeian.gov.cn', 'groscamb5', '57bc47b6e5920a7c4c146c644e2ffdf2', 'Female', '078', NULL, 'Ebute Ikorodu', 'Nigeria', '3076012241', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('95387224', 'Godwin De Ath', 'gdeba@narod.ru', 'gdeba', '5da838000a08201362b1847c9e00621c', 'Male', '09641', NULL, 'Pengjia Zhaizi', 'China', '5637550823', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('71005804', 'Lyndsie Duplock', 'lduplockbe@ucla.edu', 'lduplockbe', '89d004ab74beecc35033e071372528e9', 'Female', '558', '145 69', 'Norsborg', 'Sweden', '9695634988', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('78982780', 'Babara Sleightholme', 'bsleightholmebj@hp.com', 'bsleightholmebj', '5394029bb8ff3d323d5a90cf83cf657f', 'Female', '8037', '2989', 'Ridderkerk', 'Netherlands', '1262876926', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('51242642', 'Katha Grove', 'kgrovebo@pagesperso-orange.fr', 'kgrovebo', '94678ed46b5d591d4b8b9cafca3cb305', 'Female', '90661', '13360-000', 'Capivari', 'Brazil', '2682004026', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('28898985', 'Nico Beckers', 'nbeckersbu@skyrock.com', 'nbeckersbu', '84e9e712bbad22dc68d593d3d58ee6c0', 'Male', '33920', '8501', 'San Francisco', 'Philippines', '9643329889', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('82982329', 'Gigi Cassel', 'gcassela4@webs.com', 'gcassela4', '3a7320c2d76430479bc7e1b8bf2cb92f', 'Female', '353', '98146', 'Messina', 'Italy', '1993188216', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('34071999', 'Josie Mammatt', 'jmammatta6@un.org', 'jmammatta6', '6ccee6681016951c5c4efbf15a830c0f', 'Female', '9', '58175', 'Enonkoski', 'Finland', '8514839800', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('38811083', 'Russ Casewell', 'rcasewella7@omniture.com', 'rcasewella7', '356fb34f90218f5e2663806d04bbc9b5', 'Male', '517', NULL, 'Tillabéri', 'Niger', '6349161513', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('70022603', 'Maximilianus Venner', 'mvennera8@lycos.com', 'mvennera8', '4596342c95bf94153a9b5ef347cbe18d', 'Male', '9065', '171 14', 'Solna', 'Sweden', '8906615300', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('62741964', 'Christiane MacRanald', 'cmacranalda9@huffingtonpost.com', 'cmacranalda9', '5407d46c2064971fbecb30169a81c79c', 'Female', '9377', NULL, 'Pedregal', 'Panama', '7451603986', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('11206094', 'Zebadiah Twitty', 'ztwittyaa@redcross.org', 'ztwittyaa', '0167576906be947c31c4534d9ec71f64', 'Male', '73068', '801-0885', 'Shimonoseki', 'Japan', '2387273797', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('14069199', 'Cherin Cobbold', 'ccobboldab@t.co', 'ccobboldab', '8d6b040e735d10f2f7a3f97782ab1a94', 'Female', '458', NULL, 'Pereyaslav-Khmel’nyts’kyy', 'Ukraine', '5723493574', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('63131088', 'Felicity Mc Caghan', 'fmcac@naver.com', 'fmcac', '226904b02b7315a307a9c7deb22325cb', 'Female', '81161', '4900-005', 'Viana do Castelo', 'Portugal', '9808520273', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('84188629', 'Barnebas Bowland', 'bbowlandad@hatena.ne.jp', 'bbowlandad', 'a90f3fdf206df395c3aa525fade1583e', 'Male', '3599', '52215', 'Vodnjan', 'Croatia', '1727777384', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('98706904', 'Maxie Caverhill', 'mcaverhillae@forbes.com', 'mcaverhillae', 'a3faaf9165551d2e457386c04da35524', 'Male', '7252', '425 33', 'Hisings Kärra', 'Sweden', '1637862161', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('32677336', 'Allison Chessor', 'achessoraf@tamu.edu', 'achessoraf', '66bf580b019c146ef96390b9729b6972', 'Female', '67590', '78250-000', 'Pontes e Lacerda', 'Brazil', '8522293936', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('58242520', 'Koral McCrohon', 'kmccrohonag@sogou.com', 'kmccrohonag', '54d5992a23870cbf2bffafdec62c4743', 'Female', '4041', NULL, 'Baisha', 'China', '5084919569', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('80000478', 'Florance Wibrow', 'fwibrowai@xing.com', 'fwibrowai', 'bdfe5c3c0de0b4b6a1e8e0265653674f', 'Female', '5772', '8331', 'Kostel', 'Slovenia', '7065672794', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('79447522', 'Alessandra Veschi', 'aveschiaj@ebay.com', 'aveschiaj', '40305c86c59861525f1b76ee7cef6c5b', 'Female', '2523', NULL, 'Pohbango', 'Indonesia', '7667545270', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('33613296', 'Gael Piggin', 'gpigginak@ucoz.com', 'gpigginak', '052d6a49c3327c43efd79911e04359e1', 'Male', '2927', '618245', 'Kalino', 'Russia', '9454591165', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('72719857', 'Pauline Trail', 'ptrailal@statcounter.com', 'ptrailal', '7cc9777dea396f5232b09253c2dea9ff', 'Female', '66051', NULL, 'Lancar', 'Indonesia', '7984862039', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('72975863', 'Hagen Lautie', 'hlautieam@facebook.com', 'hlautieam', 'fb69427d878f77ede30f11fbdd7ba53a', 'Male', '21712', NULL, 'Ruyigi', 'Burundi', '8613107432', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('31567354', 'Benni Iskower', 'biskowerao@squidoo.com', 'biskowerao', 'cf3502149aec18646be76a921d0d5097', 'Female', '660', '13-230', 'Lidzbark', 'Poland', '9529259961', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('98913792', 'Parsifal Cristofori', 'pcristoforiap@blogtalkradio.com', 'pcristoforiap', 'c6d9ac796b2705415c3e4fc5d10843e1', 'Male', '1633', '249360', 'Khvastovichi', 'Russia', '5041280007', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('71591425', 'Cristie Fidock', 'cfidockaq@wired.com', 'cfidockaq', '2c17a4b54464946e8880f9ba8006ced4', 'Female', '3', '85019', 'Venta', 'Lithuania', '8173721826', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('81419786', 'Jermaine Downes', 'jdownesar@webs.com', 'jdownesar', 'e359008b8db3f3275ecb953b0898237b', 'Female', '55', NULL, 'Jiquilillo', 'Nicaragua', '6405172000', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('97973799', 'Barrett Chetwin', 'bchetwinau@un.org', 'bchetwinau', '9200711bf1d373ff6e9a8340b024ce40', 'Male', '3', '1812', 'Frederiksberg', 'Denmark', '8501872191', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('13493800', 'Bailey Drewet', 'bdrewetav@qq.com', 'bdrewetav', 'b5ca5bf90c91d6ccdcbb93812f539143', 'Male', '9739', '2425-254', 'Carreira', 'Portugal', '8036415032', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('21632554', 'Launce Dyett', 'ldyettaw@amazon.de', 'ldyettaw', '4674d99b733fc6df515fe82b879106cc', 'Male', '8', '01760', 'Kronoby', 'Finland', '7685662423', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('80223786', 'Jeanette Gredden', 'jgreddenax@homestead.com', 'jgreddenax', 'a3cbd0314a2f1910f2aeb19ab166f7c6', 'Female', '1470', NULL, 'Pacaycasa', 'Peru', '2347143366', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('52026929', 'Ginnie Loalday', 'gloaldayay@fastcompany.com', 'gloaldayay', '363630a2b795302e6768e987ac417e61', 'Female', '01523', NULL, 'Ketanggungan', 'Indonesia', '3486890492', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('16979505', 'Sebastiano Hof', 'shofaz@google.fr', 'shofaz', '0351ee514da9714707452e8c7302b8b0', 'Male', '7', NULL, 'Pātan', 'Nepal', '3755583428', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('20647475', 'Ogdan Mc Giffin', 'omcb0@linkedin.com', 'omcb0', '46c9c415b1577fc45e24b7c1b668ec43', 'Male', '87', NULL, 'Dongtuan', 'China', '7323976108', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('29539894', 'Joete Francesc', 'jfrancescb1@pagesperso-orange.fr', 'jfrancescb1', '9fee2b097f2d958442087992e5e97c04', 'Female', '863', NULL, 'Parychy', 'Belarus', '2129730895', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('47787576', 'Nelia Grubb', 'ngrubbb2@icq.com', 'ngrubbb2', 'a004593dad8f7898814f9f04d71bda12', 'Female', '42', NULL, 'Zhongying', 'China', '8665930374', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('74190407', 'Everett Westmore', 'ewestmoreb3@xing.com', 'ewestmoreb3', '4ac66eed77587c229ac068d654c2792a', 'Male', '96863', '63-910', 'Konary', 'Poland', '1836229014', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('78775883', 'Parker Eisikovitsh', 'peisikovitshb4@hp.com', 'peisikovitshb4', '8641e4d4f9828df72159ddda4c30ae5a', 'Male', '5', '61150', 'Lazaro Cardenas', 'Mexico', '9476802314', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('32962129', 'Claudie Feaver', 'cfeaverb7@umn.edu', 'cfeaverb7', '138ffde52dc1ddc46559df3d7e23d232', 'Female', '5900', NULL, 'Huilongshan', 'China', '7662127529', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('62060118', 'Leslie MacInnes', 'lmacinnesb8@reddit.com', 'lmacinnesb8', '7ef9f3a1b864dcdee459601a1f687f15', 'Female', '8031', '131029', 'Arjona', 'Colombia', '2755930689', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('29771352', 'Janelle Preston', 'jprestonb9@alibaba.com', 'jprestonb9', 'a36981a9f9da39cd9cd0c20491da6644', 'Female', '981', NULL, 'Pasirmukti', 'Indonesia', '5016487416', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('98436696', 'Welby O''Dulchonta', 'wodulchontabb@naver.com', 'wodulchontabb', '6632e4278252a1bc64a000dc6cb9f63e', 'Male', '221', NULL, 'Xiagong', 'China', '9774629715', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('75873883', 'Margie Mulrenan', 'mmulrenanbc@wp.com', 'mmulrenanbc', 'ef77f0068082afb372548fdb563bb111', 'Female', '42853', NULL, 'Gowurdak', 'Turkmenistan', '5434035793', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('17677914', 'Elnar MacTague', 'emactaguebd@chicagotribune.com', 'emactaguebd', 'c46be405bcff6ee78f726ce50879b5b0', 'Male', '19', NULL, 'Masjid', 'Indonesia', '5531468486', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('24888941', 'Ninnette McGeady', 'nmcgeadybf@example.com', 'nmcgeadybf', '688ed684f63cb366aac3e805afb6a2bb', 'Female', '53', NULL, 'Bedayu', 'Indonesia', '4118237453', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('97082989', 'Tamiko Dakin', 'tdakinbg@1und1.de', 'tdakinbg', 'c536a104fd59462ebe33c073459d878e', 'Female', '544', NULL, 'Smārde', 'Latvia', '7829401608', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('57597552', 'Elonore Rodwell', 'erodwellbh@umn.edu', 'erodwellbh', 'bafe526734b626a0f5c863c535cfcb63', 'Female', '947', NULL, 'Tengjia', 'China', '3171964987', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('86095481', 'Bond Freyne', 'bfreynebi@google.com.au', 'bfreynebi', '2768a6ef51e38ea30b69ce43e835a695', 'Male', '47', '553 33', 'Jönköping', 'Sweden', '1036714494', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('63305349', 'Conrade Penke', 'cpenkebl@digg.com', 'cpenkebl', 'e0b0824a8699e568b9abdd04d5448276', 'Male', '1848', NULL, 'Tongzhong', 'China', '3915202995', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('61402759', 'Estella Abbatini', 'eabbatinibm@indiatimes.com', 'eabbatinibm', 'a07d0f40b72e75b312537f507a16ff60', 'Female', '27', NULL, 'Wuyang', 'China', '7335306520', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('23139983', 'Felice Treacher', 'ftreacherbn@smugmug.com', 'ftreacherbn', 'a3691f702f582a80207c11e2a1710ab4', 'Male', '654', '177089', 'Anserma', 'Colombia', '6127290365', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('25884309', 'Nickolas Boxall', 'nboxallbp@typepad.com', 'nboxallbp', '0c2f6dd4b14679500c9aadb83b4e38c5', 'Male', '8', '88535-000', 'Correia Pinto', 'Brazil', '6354078342', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('80649879', 'Briggs Aikenhead', 'baikenheadbq@mysql.com', 'baikenheadbq', '8e67789e7f86f605f97ab3f610aed531', 'Male', '20983', NULL, 'Tsagaan-Olom', 'Mongolia', '5329004491', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('99980954', 'Debor McParland', 'dmcparlandbr@virginia.edu', 'dmcparlandbr', '2f1b2b3d72b9dcef846db27d716afdc2', 'Female', '78', NULL, 'Baixi', 'China', '7204149600', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('98266788', 'Robers Yandell', 'ryandellbs@yandex.ru', 'ryandellbs', 'f8e340bad6be79056a6960a03ef035d4', 'Male', '57484', '709-4306', 'Mino', 'Japan', '8964945185', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('98268836', 'Adriane Degoix', 'adegoixbt@huffingtonpost.com', 'adegoixbt', 'b4f84b86523a197cca545d29e33c6309', 'Female', '8', '7165', 'Villa Gesell', 'Argentina', '2741757003', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('43667118', 'Thorsten Malcolmson', 'tmalcolmsonbv@tiny.cc', 'tmalcolmsonbv', '91f8ddee59c8ea842b6a51dd7cb3ff23', 'Male', '81', '162250', 'Kharovsk', 'Russia', '5831438423', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('11329201', 'Kit Fosh', 'kfoshbx@ehow.com', 'kfoshbx', '85adc19c3e9cd8eaaa19b48d5df48a31', 'Female', '97', 'V92', 'Tralee', 'Ireland', '8574371465', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('34836162', 'Nanine Vasilenko', 'nvasilenkoby@yahoo.com', 'nvasilenkoby', 'df4405fed7fabc3fcf9839735adf965b', 'Female', '3', 'L-3755', 'Rumelange', 'Luxembourg', '1124757428', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('21896902', 'Modesty Balffye', 'mbalffyec0@reddit.com', 'mbalffyec0', '2d1e1f463a6e26c4f586807aa670e5f5', 'Female', '22', NULL, 'Spas', 'Ukraine', '9475261871', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('84127445', 'Tuck Crummey', 'tcrummeyc1@jalbum.net', 'tcrummeyc1', 'd01ce3bcd402e657df07e4dc25f405d3', 'Male', '4850', '94627', 'Oakland', 'United States', '6722409547', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('95790808', 'Bethina Wealthall', 'bwealthallc2@dell.com', 'bwealthallc2', 'faa4a6f549d5ab5624526f2a3f04f6c0', 'Female', '5252', '669 02', 'Konice', 'Czech Republic', '7907144396', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('30086877', 'Rosy Demkowicz', 'rdemkowiczc3@ning.com', 'rdemkowiczc3', '6c882df97a2b5d3c214a540b035c56d1', 'Female', '22265', NULL, 'Liucheng', 'China', '7741339342', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('96009951', 'Carilyn Dunsmore', 'cdunsmorec4@mayoclinic.com', 'cdunsmorec4', 'e8da8142846dd1ef540305fbeeaa08c0', 'Female', '861', '9730', 'Groningen', 'Netherlands', '7542237744', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('32071395', 'Brockie Bravington', 'bbravingtonc5@plala.or.jp', 'bbravingtonc5', 'b25589fd30998ccf5721b87c91db8c6c', 'Male', '3587', NULL, 'Kebon', 'Indonesia', '9081933129', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('40083177', 'Irita Colin', 'icolinc6@discovery.com', 'icolinc6', '5f921906035d2a09214665fc27784972', 'Female', '33', NULL, 'Pulaupinang', 'Indonesia', '1231621489', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('28626667', 'Justus Stirtle', 'jstirtlec7@marriott.com', 'jstirtlec7', 'c98a190a06a4c0facf4d4b9a375b4416', 'Male', '542', NULL, 'Xiamazhuang', 'China', '1641157256', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('12369644', 'Burton Middlemist', 'bmiddlemistc8@wiley.com', 'bmiddlemistc8', '85d7cd2e90b4a5a362301d7f835a555e', 'Male', '15', NULL, 'Tulungagung', 'Indonesia', '7646994540', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('63223537', 'Lucias Joannic', 'ljoannicc9@redcross.org', 'ljoannicc9', 'cb65ccc1c7b9d9721463ecca4697f739', 'Male', '56', NULL, 'Altay', 'China', '3156226133', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('39573236', 'Joly Mallia', 'jmalliaca@wix.com', 'jmalliaca', '454b64b71ea12d67e1bf0d612d965bb8', 'Female', '7604', NULL, 'Guanting', 'China', '9667412719', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('71243519', 'Leanora Bygrove', 'lbygrovecb@nature.com', 'lbygrovecb', '5f47874b3c76b7786b536a9731f802dd', 'Female', '0', '655752', 'Abaza', 'Russia', '7031979791', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('41619208', 'Marilin Worshall', 'mworshallcd@reference.com', 'mworshallcd', '8dd2635220acc9156c12bcde7375b22a', 'Female', '0238', NULL, 'Xiangride', 'China', '9674818130', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('86834953', 'Trixy Deerr', 'tdeerrce@army.mil', 'tdeerrce', 'b4790056c655e9ebb669b31e08addd2d', 'Female', '0', NULL, 'Shuitianzhuang', 'China', '8157188807', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('70616843', 'Manolo Greenacre', 'mgreenacrecf@nytimes.com', 'mgreenacrecf', 'e640974a9614d98e2bfa703a57a1b93f', 'Male', '1', '0247', 'Paihia', 'New Zealand', '1851085124', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('50978572', 'Tucky Zecchetti', 'tzecchetticg@joomla.org', 'tzecchetticg', 'cb7648c5619480ac450fcea4435083b6', 'Male', '354', '21041', 'Batgrām', 'Pakistan', '8234246485', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('58220301', 'Derk Dayne', 'ddaynech@sourceforge.net', 'ddaynech', '0f006d2748dca4b04eb50a25b741b7d2', 'Male', '1', NULL, 'Blantyre', 'Malawi', '4302501106', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('91508506', 'Cindi Paulmann', 'cpaulmannck@yelp.com', 'cpaulmannck', '7f335df5f48b0d691f9af5fa78b48bae', 'Female', '2416', NULL, 'Shuangtang', 'China', '7614510110', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('14874402', 'Kalle Lowrance', 'klowrancecl@scientificamerican.com', 'klowrancecl', 'b6584fa3e2880959582233f9bbf6b9c6', 'Male', '59', '86-318', 'Rogóźno', 'Poland', '4133570524', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('87895854', 'Gordy Yendall', 'gyendallcm@surveymonkey.com', 'gyendallcm', '7b99e6f8d1bae508c4185caa2e80e541', 'Male', '0', '01057', 'Mixco', 'Guatemala', '6895927596', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('84334388', 'Franklin Iacovino', 'fiacovinocn@nature.com', 'fiacovinocn', '5c64f4236a3b1e5c5e1a6b55cdb00fbe', 'Male', '227', NULL, 'Krajan Pakel', 'Indonesia', '8881983703', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('49966902', 'Blakeley Rowbotham', 'browbothamco@spiegel.de', 'browbothamco', 'b5565a6fe38d9338f485e47be42fe097', 'Female', '5283', NULL, 'Zhagang', 'China', '7084488995', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('27969349', 'Baudoin Drinkall', 'bdrinkallcp@reverbnation.com', 'bdrinkallcp', 'de9238c50e56b015391fb657790e2ab1', 'Male', '72', NULL, 'Radès', 'Tunisia', '9726352373', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('44922696', 'Emory Olivi', 'eolivicq@cnn.com', 'eolivicq', 'a5d90642439c677e48de16f13cd73dc4', 'Male', '1', NULL, 'Hutang', 'China', '8665182356', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('53319499', 'Deedee Santora', 'dsantoracr@hubpages.com', 'dsantoracr', 'f4725ed2a86c083df6a2cf4386493ec1', 'Female', '3926', '44321', 'Akron', 'United States', '8761139475', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('12990296', 'Veriee Gayforth', 'vgayforthcs@chicagotribune.com', 'vgayforthcs', '96110c8af719da763c9c260949f28cfe', 'Female', '1', NULL, 'Gyangqai', 'China', '3955295715', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('78624603', 'Gene Martyns', 'gmartynscu@ucoz.ru', 'gmartynscu', '347b0e78c37bfc6dd17c519d060132b2', 'Male', '3', '99-352', 'Dąbrowice', 'Poland', '1085280337', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('67188572', 'Markus Nansom', 'mnansomcv@homestead.com', 'mnansomcv', 'dcd3ec5f1ecd3fb072b86497bb277d80', 'Male', '40117', '22205', 'Arlington', 'United States', '2724282119', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('12572511', 'Stephie Sherringham', 'ssherringhamcw@istockphoto.com', 'ssherringhamcw', '75c3170c1f4274c321a3739f18e1a082', 'Female', '7', NULL, 'Velykyi Bereznyi', 'Ukraine', '8802194072', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('66813796', 'Gradeigh Di Gregorio', 'gdicx@woothemes.com', 'gdicx', 'afd8d9019bd7a5b923322ac0e1583e13', 'Male', '4', NULL, 'Hưng Nguyên', 'Vietnam', '3565311407', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('79710055', 'Vassily Conyard', 'vconyardcy@de.vu', 'vconyardcy', 'c9f27ff5f280775cabfb8ccc83f311ac', 'Male', '0', NULL, 'Gandu', 'Indonesia', '1315283186', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('50599783', 'Dyan Dmych', 'ddmychcz@joomla.org', 'ddmychcz', 'f7ea4d3c40a862a10d087a6c7101ad93', 'Female', '38', NULL, 'Shirgjan', 'Albania', '7255565181', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('64704363', 'Nanci McElwee', 'nmcelweed0@apple.com', 'nmcelweed0', '1ba0c7e9a8a749d97da860b995e1dfac', 'Female', '32464', '793 95', 'Město Albrechtice', 'Czech Republic', '3877836658', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('21510011', 'Doro Danaher', 'ddanaherd1@amazon.co.jp', 'ddanaherd1', 'a95235093c346e22e42cdcd779ccf7c7', 'Female', '8', '93650', 'Ricardo Flores Magon', 'Mexico', '5185275237', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('30396289', 'Ricard Hambers', 'rhambersd2@liveinternet.ru', 'rhambersd2', '9ab7a41781df20c5d329a50d1cbd227d', 'Male', '50060', '37-240', 'Przeworsk', 'Poland', '2695480847', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('56090506', 'Frazer Bourcq', 'fbourcqd4@ycombinator.com', 'fbourcqd4', 'a81ef0b18950f531279db6b8bb1f992a', 'Male', '3', '5037', 'Dado', 'Philippines', '6535433660', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('91996044', 'Bayard Covert', 'bcovertd5@hugedomains.com', 'bcovertd5', 'd4f16f9ae1be85c1d2686ee3791397a0', 'Male', '92', '37-560', 'Kramarzówka', 'Poland', '9161964678', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('96096143', 'Pia Seif', 'pseifd6@harvard.edu', 'pseifd6', 'c8952e6b4deb4ee89444fd25772c985f', 'Female', '812', NULL, 'Zhangcun', 'China', '3113630251', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('21239701', 'Colet Hansell', 'chanselld7@statcounter.com', 'chanselld7', 'fe6ac39135f7f366cab5f66b16b5d1f9', 'Male', '5918', NULL, 'Menara', 'Indonesia', '2125005695', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('83310487', 'Adriena Manwaring', 'amanwaringd8@elpais.com', 'amanwaringd8', '49c7e408bde608e94e6a05afee2354aa', 'Female', '3909', NULL, 'Sambongmulyo', 'Indonesia', '1538125781', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('98150308', 'Frances Bakeup', 'fbakeupd9@webs.com', 'fbakeupd9', 'eda1dc7856d3008ca01169a65cb0c53e', 'Female', '554', NULL, 'Shagedu', 'China', '6409670514', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('79439786', 'Tyson Apted', 'taptedda@answers.com', 'taptedda', 'd4e8f1500213ee01e808569976b770a5', 'Male', '36543', NULL, 'Kampungladang', 'Indonesia', '5194742250', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('81629109', 'Smitty Bourgour', 'sbourgourdb@army.mil', 'sbourgourdb', '468e6ff3a7bb844bacc158e778d813da', 'Male', '7', '182370', 'Krasnogorodskoye', 'Russia', '9708107621', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('43694005', 'Syd Gravestone', 'sgravestonedc@abc.net.au', 'sgravestonedc', '7e31b8e6c3122b4be0a5d6b911b18adc', 'Male', '34', NULL, 'Genteng', 'Indonesia', '3126642534', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('45361081', 'Jeffie McNirlin', 'jmcnirlinde@washingtonpost.com', 'jmcnirlinde', '05e8802d2035f38fda8e2f021675086d', 'Male', '0056', NULL, 'Deshan', 'China', '3401574139', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('40257466', 'Eada Florio', 'efloriodf@bandcamp.com', 'efloriodf', 'b0de61f752a43a60755891807f8e2f57', 'Female', '457', NULL, 'Hepo', 'China', '2489583030', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('39014328', 'Corine Andriveau', 'candriveaudg@pbs.org', 'candriveaudg', 'ba69ec9138cedfcbc15a3d5cf697e48b', 'Female', '98713', '26-307', 'Białaczów', 'Poland', '7489847199', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('44232636', 'Johnette Sibly', 'jsiblydh@abc.net.au', 'jsiblydh', '52f3d156854dc0adf7e9ec05d5d19e51', 'Female', '53', NULL, 'Cilimus Kulon', 'Indonesia', '8772968592', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('64808893', 'Thibaud Deners', 'tdenersdi@sitemeter.com', 'tdenersdi', 'db4feac3a97220b863f3ad9114e3eafe', 'Male', '4', '10060', 'New York City', 'United States', '3045256236', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('79278014', 'Crystie Ende', 'cendedj@intel.com', 'cendedj', '5322cbec8e2fd58e1232bcd0899095e0', 'Female', '965', NULL, 'Parawan', 'Indonesia', '4351085316', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('26554303', 'Mikael Luffman', 'mluffmandk@npr.org', 'mluffmandk', 'ed09227ad8531548a7628878ccad704d', 'Male', '2336', '11130', 'Bangkok', 'Thailand', '6145960767', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('96790458', 'Yolanthe Lemasney', 'ylemasneydl@behance.net', 'ylemasneydl', '9a402014e792d137e8d4814c862e26a7', 'Female', '510', NULL, 'Aimin', 'China', '9757747517', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('92456889', 'Freda Valencia', 'fvalenciadm@t.co', 'fvalenciadm', 'c2a3fdd9b7c94852c8e82f4e6853b600', 'Female', '7028', NULL, 'Vyshneve', 'Ukraine', '5034830156', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('85964739', 'Rodger Salt', 'rsaltdo@vk.com', 'rsaltdo', '4157907c71293737c911d504fc30902f', 'Male', '6', '763029', 'Tuluá', 'Colombia', '7815306608', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('81844178', 'Shermy Deverale', 'sdeveraledq@home.pl', 'sdeveraledq', '8b6b4c98db8c82b8ad5ccccdf705b8c8', 'Male', '7', '6606', 'Plettenberg Bay', 'South Africa', '6357237299', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('97333203', 'Chadd Zahor', 'czahordr@dell.com', 'czahordr', '9bd7482991c43e5a88b98bff745d2389', 'Male', '8770', '34-382', 'Bystra', 'Poland', '5073068213', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('72734676', 'Angeli Muriel', 'amurields@eventbrite.com', 'amurields', '1032a1d8eac8edd32079b2aa82f83430', 'Male', '80', NULL, 'As Saddah', 'Yemen', '8046846493', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('84299733', 'Tynan Queyos', 'tqueyosdt@naver.com', 'tqueyosdt', '99a2bc3fb8fde1737a77c2c003a28ec0', 'Male', '75', NULL, 'Aţ Ţurrah', 'Jordan', '3982988423', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('96325606', 'Graeme Boddy', 'gboddydu@shop-pro.jp', 'gboddydu', '8621a44456b76bca0dcb01d856a7ad97', 'Male', '2', NULL, 'Biljača', 'Serbia', '8492493616', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('44486631', 'Cooper Pelcheur', 'cpelcheurdv@phpbb.com', 'cpelcheurdv', '5e209ef5ac6f6bde7b91645e7db25287', 'Male', '85', NULL, 'Lingshan', 'China', '9264042265', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('55301829', 'Romonda Roberson', 'rrobersonbz@discovery.com', 'rrobersonbz', '7ccfe5c668a04d21373868c5d28cb64c', 'Female', '5244', NULL, 'Shkodër', 'Albania', '3253050977', 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('20013033', 'ramisa', 'abjhs@adih.com', 'ramisa', '1234', 'Female', 'ada', '1331', 'dhaka', 'bangladesh', NULL, 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('62064622', 'Mayisha Alam', 'mayishaalam@yahoo.com', 'mayisha', '81dc9bdb52d04dc20036dbd8313ed055', 'Female', 'Zigatola', '1209', 'Dhaka', 'bangladesh', NULL, 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('49328123', 'rr', 'rr@gmail.com', 'rr', '202cb962ac59075b964b07152d234b70', 'Female', 'th', '123', 'dankj', 'dnakjn', NULL, 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('71860223', 'myuser', 'myuser@gmail.com', 'myuser', '81dc9bdb52d04dc20036dbd8313ed055', 'Male', 'lala', '1234', 'istanbul', 'turkey', NULL, 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('51642476', 'dakals', 'dakal@gmail.com', 'dakal', '81dc9bdb52d04dc20036dbd8313ed055', 'Male', 'dhanmondi', '1209', 'Dhaka', 'bangladesh', NULL, 'NO');
INSERT INTO "INNOCITY"."CUSTOMER" VALUES ('11113187', 'customer', 'customer@gmail.com', 'customer', '827ccb0eea8a706c4c34a16891f84e7b', 'Female', 'Zigatola', '1209', 'Dhaka', 'bangladesh', NULL, 'NO');

-- ----------------------------
-- Primary Key structure for table CUSTOMER
-- ----------------------------
ALTER TABLE "INNOCITY"."CUSTOMER" ADD CONSTRAINT "SYS_C0011094" PRIMARY KEY ("CUSTOMERID");
