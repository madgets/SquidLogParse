/*
Navicat MySQL Data Transfer

Source Server         : panjmMysql
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : testdb

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2014-12-20 16:22:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `squid_log_analyse`
-- ----------------------------
DROP TABLE IF EXISTS `squid_log_analyse`;
CREATE TABLE `squid_log_analyse` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `visit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `response_time` int(10) DEFAULT NULL,
  `Squid_status` varchar(40) DEFAULT NULL,
  `http_status` varchar(20) DEFAULT NULL,
  `size_reply` int(11) DEFAULT NULL,
  `Request_method` varchar(20) DEFAULT NULL,
  `Request_URL` varchar(500) DEFAULT NULL,
  `code_rate` int(10) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `Squid_hierarchy_code` varchar(100) DEFAULT NULL,
  `Server_IP_address` varchar(100) DEFAULT NULL,
  `MIME_type_request` varchar(100) DEFAULT NULL,
  `Client_IP` varchar(100) DEFAULT NULL,
  `All_request_header` varchar(300) DEFAULT NULL,
  `domain_name` varchar(25) DEFAULT NULL,
  `tsOr_m3u8` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of squid_log_analyse
-- ----------------------------
INSERT INTO `squid_log_analyse` VALUES ('1', '2014-12-05 09:00:05', '418', 'TCP_HIT', '200', '1667473', 'GET', 'http://asp.cntv.lxdns.com/asp/hls/850/0303000a/3/default/1843f7b8bfe54aab8d38a291b562c15b/115.ts', '850', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.35', '180.122.213.203,%20180.97.178.48,%20125.78.240.145,%20125.78.240.156', 'asp.cntv.lxdns.com', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('2', '2014-12-05 09:00:05', '234', 'TCP_MISS', '304', '310', 'GET', 'http://asp.cntv.lxdns.com/asp/hls/450/0303000a/3/default/11a149e375f747153032e79f86d81678/178.ts', '450', '-', 'SOURCEHASH_PARENT', '10.80.2.110', '-', '218.205.75.39', '223.86.235.69,%20223.85.134.8,%20218.205.75.27', 'asp.cntv.lxdns.com', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('3', '2014-12-05 09:00:05', '12', 'TCP_REFRESH_HIT', '304', '241', 'GET', 'http://asp.cntv.lxdns.com/asp/hls/main/0303000a/3/default/32cfd664c7eb3dde9f9835430a4e5c44/main.m3u8', '0', '-', 'SOURCEHASH_PARENT', '10.80.2.106', '-', '10.80.4.19', '223.83.209.209,%20223.82.254.236,%20218.205.75.27,%20218.205.75.49', 'asp.cntv.lxdns.com', 'm3u8');
INSERT INTO `squid_log_analyse` VALUES ('4', '2014-12-05 09:00:05', '0', 'TCP_IMS_HIT', '304', '242', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/450/0303000a/3/default/7c5c48ef3972443537cb839789882488/111.ts', '450', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.19', '106.116.180.119,%20116.211.122.168,%20116.211.122.169,%2061.139.127.214', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('5', '2014-12-05 09:00:05', '0', 'TCP_IMS_HIT', '304', '242', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/850/0303000a/3/default/1e62a13884b54f98b864ef5c0648ecec/122.ts', '850', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.19', '183.224.1.81,%20123.94.25.131,%20123.94.4.41', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('6', '2014-12-05 09:00:05', '0', 'TCP_IMS_HIT', '304', '240', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/450/0303000a/3/default/b97ea033d4a649888c6ad357f223be6b/88.ts', '450', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.19', '112.25.25.178,%20123.94.21.5,%20211.98.96.31', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('7', '2014-12-05 09:00:05', '0', 'TCP_IMS_HIT', '304', '242', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/850/0303000a/3/default/353168b01f624815a5b8b60ec333a938/5.ts', '850', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.19', '112.25.25.15,%20123.94.21.5,%20123.94.4.41', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('8', '2014-12-05 09:00:05', '481', 'TCP_MISS', '200', '1400878', 'GET', 'http://122.224.185.5/asp/hls/850/0303000a/3/default/ff930c69f90e4f177fcb5986257e850c/211.ts', '850', '-', 'SOURCEHASH_PARENT', '10.80.2.106', 'video/MP2T', '10.80.4.35', '125.121.186.100,%2010.96.0.9,%20122.224.184.166', '122.224.185.5', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('9', '2014-12-05 09:00:05', '554', 'TCP_MISS', '200', '1977291', 'GET', 'http://asp.cntv.lxdns.com/asp/hls/850/0303000a/3/default/65dafdde5f5e4d33b11fc85a832baa4e/150.ts', '850', '-', 'SOURCEHASH_PARENT', '10.80.2.106', 'video/MP2T', '10.80.4.80', '59.60.197.207,%2042.81.5.36,%2059.56.26.173,%2059.56.26.181', 'asp.cntv.lxdns.com', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('10', '2014-12-05 09:00:05', '322', 'TCP_MISS', '200', '1673290', 'GET', 'http://asp.cntv.lxdns.com/asp/hls/850/0303000a/3/default/1cbac168b5484513707fd097b3d16d77/60.ts', '850', '-', 'SOURCEHASH_PARENT', '10.80.2.106', 'video/MP2T', '10.80.4.35', '14.114.85.196,%20125.90.207.30,%20218.92.226.49,%20218.92.226.56', 'asp.cntv.lxdns.com', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('11', '2014-12-05 09:00:05', '14701', 'TCP_HIT', '200', '1600551', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/850/0303000a/3/default/829ef33581ce4fcdbce21241e25e5d96/9.ts', '850', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.20', '223.73.11.14,%20123.94.21.2,%20211.98.96.28', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('12', '2014-12-05 09:00:05', '293', 'TCP_MISS', '304', '305', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/450/0303000a/3/default/5f87ec128ff541ea7497ac8bd133439b/46.ts', '450', '-', 'SOURCEHASH_PARENT', '10.80.2.109', '-', '123.94.4.40', '112.25.25.178,%20123.94.21.5', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('13', '2014-12-05 09:00:05', '309', 'TCP_HIT', '200', '1403902', 'GET', 'http://asp.cntv.lxdns.com/asp/hls/850/0303000a/3/default/7b92d761b7864e9c9b90c97a9ebae8bc/66.ts', '850', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.205', '27.190.235.173,%20182.34.127.28,%2059.56.26.173,%2059.56.26.178', 'asp.cntv.lxdns.com', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('14', '2014-12-05 09:00:05', '457', 'TCP_MISS', '200', '879370', 'GET', 'http://asp.cntv.lxdns.com/asp/hls/450/0303000a/3/default/ad621bf949c34f0a9a3e16fc90383635/76.ts', '450', '-', 'SOURCEHASH_PARENT', '10.80.2.106', 'video/MP2T', '10.80.4.80', '27.155.103.183,%2059.56.26.29,%20125.78.240.140,%20125.78.240.150', 'asp.cntv.lxdns.com', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('15', '2014-12-05 09:00:05', '194', 'TCP_MISS', '304', '242', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/850/0303000a/3/default/bfb206a7f65348428f7348ab727602b0/102.ts', '850', '-', 'SOURCEHASH_PARENT', '10.80.2.106', '-', '10.80.4.19', '112.25.25.13,%20123.94.21.2,%20211.98.96.31', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('16', '2014-12-05 09:00:05', '217', 'TCP_MISS', '200', '307281', 'GET', 'http://asp.cntv.lxdns.com/asp/hls/200/0303000a/3/default/ffd5dcde1d1a49899bb1aba97e02c5d5/164.ts', '200', '-', 'SOURCEHASH_PARENT', '10.80.2.106', 'video/MP2T', '10.80.4.35', '36.100.254.157,%20118.180.9.150,%20125.78.240.140,%20125.78.240.148', 'asp.cntv.lxdns.com', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('17', '2014-12-05 09:00:05', '483', 'TCP_MISS', '304', '242', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/450/0303000a/3/default/acc6145372bc42936c9d429ba8b94965/183.ts', '450', '-', 'SOURCEHASH_PARENT', '10.80.2.106', '-', '10.80.2.107', '111.226.43.183,%20116.211.122.168,%20116.211.122.169,%2061.139.127.214', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('18', '2014-12-05 09:00:05', '194', 'TCP_REFRESH_HIT', '304', '241', 'GET', 'http://asp.cntv.lxdns.com/asp/hls/main/0303000a/3/default/b1aeb78910544cfa9608f4fc53effebc/main.m3u8', '0', '-', 'SOURCEHASH_PARENT', '10.80.2.106', '-', '10.80.4.20', '117.173.196.55,%20223.85.134.7,%20218.205.75.29,%20218.205.75.40', 'asp.cntv.lxdns.com', 'm3u8');
INSERT INTO `squid_log_analyse` VALUES ('19', '2014-12-05 09:00:05', '278', 'TCP_MISS', '200', '703966', 'GET', 'http://asp.cntv.lxdns.com/asp/hls/450/0303000a/3/default/d15e5afca99a4ad221120788071b481c/97.ts', '450', '-', 'SOURCEHASH_PARENT', '10.80.2.106', 'video/MP2T', '10.80.4.80', '222.247.71.78,%20218.75.154.12,%20218.75.154.32,%20218.75.154.39', 'asp.cntv.lxdns.com', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('20', '2014-12-05 09:00:05', '0', 'TCP_IMS_HIT', '304', '241', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/850/0303000a/3/default/8202e3067b3044b089d06709958dc96a/38.ts', '850', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.206', '112.25.25.15,%20123.94.21.5,%20211.98.96.28', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('21', '2014-12-05 09:00:05', '0', 'TCP_IMS_HIT', '304', '240', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/450/0303000a/3/default/0c07a3b972304d9b8e2244de16c67559/9.ts', '450', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.53', '112.25.25.24,%20123.94.11.3,%20211.98.96.37', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('22', '2014-12-05 09:00:05', '0', 'TCP_IMS_HIT', '304', '242', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/450/0303000a/3/default/64dac3b1b59c49bea1524385709cd898/2.ts', '450', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.19', '183.206.87.195,%20123.94.10.2,%20211.98.96.36', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('23', '2014-12-05 09:00:05', '1', 'TCP_IMS_HIT', '304', '239', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/850/0303000a/3/default/02858b342ac43ddfc685ec190a4e5c44/123.ts', '850', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.53', '112.25.25.196,%20123.94.21.2,%20123.94.4.40', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('24', '2014-12-05 09:00:05', '2748', 'TCP_MISS', '304', '303', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/450/0303000a/3/default/4199ad395be84b7c7eebd5912936d4b2/74.ts', '450', '-', 'SOURCEHASH_PARENT', '10.80.4.24', '-', '61.139.127.214', '119.99.172.197,%20116.211.122.168,%20116.211.122.169', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('25', '2014-12-05 09:00:05', '3', 'TCP_IMS_HIT', '304', '237', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/450/0303000a/3/default/525a24c4044048858e46e41b27c9c250/49.ts', '450', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.24', '112.25.25.88,%20123.94.21.4,%20123.94.4.41', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('26', '2014-12-05 09:00:05', '0', 'TCP_IMS_HIT', '304', '235', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/850/0303000a/3/default/9905fb870d464dc98a4972cbb1b8ce90/79.ts', '850', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.24', '182.36.13.196,%20112.117.221.37,%2061.139.127.214', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('27', '2014-12-05 09:00:05', '0', 'TCP_IMS_HIT', '304', '235', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/850/0303000a/3/default/be02ccf1a94b4e84b4f59483a9db6b93/126.ts', '850', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.24', '113.121.214.35,%20112.117.221.37,%2061.139.127.214', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('28', '2014-12-05 09:00:05', '1', 'TCP_IMS_HIT', '304', '237', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/450/0303000a/3/default/7c5c48ef3972443537cb839789882488/111.ts', '450', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.24', '106.116.180.119,%20116.211.122.169,%20116.211.122.169,%2061.139.127.214', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('29', '2014-12-05 09:00:05', '1', 'TCP_IMS_HIT', '304', '237', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/850/0303000a/3/default/6e54a8f96e944fec998bf342f6faa99f/53.ts', '850', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.24', '183.224.1.81,%20123.94.25.131,%20211.98.96.28', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('30', '2014-12-05 09:00:05', '0', 'TCP_IMS_HIT', '304', '236', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/2000/0303000a/3/default/39028c21a8ca402e87cf4de16d505449/82.ts', '2000', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.24', '112.25.25.88,%20123.94.21.4,%20211.98.96.28', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('31', '2014-12-05 09:00:05', '4', 'TCP_IMS_HIT', '304', '236', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/850/0303000a/3/default/9f83a62add4647a7b7b3e2c5ee30acff/9.ts', '850', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.24', '120.195.1.35,%20123.94.21.2,%20211.98.96.28', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('32', '2014-12-05 09:00:05', '100', 'TCP_MISS', '304', '237', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/450/0303000a/3/default/ed4b85fdaa65437b98871da590b99e6a/27.ts', '450', '-', 'SOURCEHASH_PARENT', '10.80.2.106', '-', '10.80.4.24', '112.25.25.17,%20123.94.21.3,%20211.98.96.31', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('33', '2014-12-05 09:00:05', '1', 'TCP_IMS_HIT', '304', '236', 'GET', 'http://asp.cntv.lxdns.com/asp/hls/850/0303000a/3/default/76d10504df9745a59dcb35d8fbf5f868/13.ts', '850', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.22', '116.232.76.28,%20122.226.185.31,%20125.78.240.139,%20125.78.240.153', 'asp.cntv.lxdns.com', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('34', '2014-12-05 09:00:05', '0', 'TCP_IMS_HIT', '304', '258', 'GET', 'http://asp.cntv.lxdns.com/asp/hls/main/0303000a/3/default/547e1c6791ee44bab55eda7ffc6f76d5/main.m3u8', '0', '-', 'NONE', '172.20.163.95', 'application/x-mpegURL', '10.80.4.22', '124.240.188.26,%2061.184.249.29,%20222.245.77.28,%20222.245.77.43', 'asp.cntv.lxdns.com', 'm3u8');
INSERT INTO `squid_log_analyse` VALUES ('35', '2014-12-05 09:00:05', '0', 'TCP_NEGATIVE_HIT', '405', '437', 'GET', 'http://asp.cntv.lxdns.com/asp/hls/450/0303000a/3/default/703967c24cb44ee8016affbce5552e08/169.ts', '450', '-', 'NONE', '172.20.163.95', 'text/html', '10.80.4.22', '42.242.248.152,%20116.55.236.28,%2060.174.242.20,%2060.174.242.39', 'asp.cntv.lxdns.com', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('36', '2014-12-05 09:00:05', '7', 'TCP_IMS_HIT', '304', '237', 'GET', 'http://asp.cntv.lxdns.com//asp/hls/850/0303000a/3/default/87ac5067e9884d22b5c4d78b60e9676c/143.ts', '850', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.22', '183.249.4.126,%20218.205.75.145,%20218.205.75.29,%20218.205.75.51', 'asp.cntv.lxdns.com', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('37', '2014-12-05 09:00:05', '21821', 'TCP_HIT', '200', '727848', 'GET', 'http://asp.cntv.lxdns.com/asp/hls/450/0303000a/3/default/5a0d518eefbd4cc63f0631a797c9c3c8/75.ts', '450', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.24', '117.151.81.26,%20183.203.10.194,%20111.8.9.226,%20111.8.9.219', 'asp.cntv.lxdns.com', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('38', '2014-12-05 09:00:05', '0', 'TCP_IMS_HIT', '304', '236', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/850/0303000a/3/default/7731fd3f9c2c40a2bd16d4a1d899abbe/25.ts', '850', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.22', '221.131.81.252,%20123.94.11.3,%20123.94.4.40', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('39', '2014-12-05 09:00:05', '6459', 'TCP_HIT', '200', '1889694', 'GET', 'http://asp.cntv.lxdns.com/asp/hls/850/0303000a/3/default/ab729d731c8f426d7d446dbdab68b761/46.ts', '850', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.206', '112.7.210.244,%20112.25.55.202,%20111.8.9.215,%20111.8.9.198', 'asp.cntv.lxdns.com', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('40', '2014-12-05 09:00:05', '0', 'TCP_IMS_HIT', '304', '236', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/2000/0303000a/3/default/9905fb870d464dc98a4972cbb1b8ce90/78.ts', '2000', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.22', '112.25.25.178,%20123.94.21.5,%20123.94.4.40', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('41', '2014-12-05 09:00:05', '44659', 'TCP_MISS', '200', '1183817', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/850/0303000a/3/default/7de307cd45d040ad9372d27942f742b7/73.ts', '850', '-', 'SOURCEHASH_PARENT', '10.80.4.22', 'video/MP2T', '175.6.9.197', '182.36.220.78,%20116.211.122.168,%20116.211.122.168,%20175.6.9.196', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('42', '2014-12-05 09:00:05', '23', 'TCP_MISS', '304', '237', 'GET', 'http://asp.cntv.lxdns.com/asp/hls/main/0303000a/3/default/2175a2d4e84c4a647138f986deb8f6db/main.m3u8', '0', '-', 'SOURCEHASH_PARENT', '10.80.2.106', '-', '10.80.4.22', '112.117.164.86,%20116.55.236.29,%20218.75.154.37,%20218.75.154.40', 'asp.cntv.lxdns.com', 'm3u8');
INSERT INTO `squid_log_analyse` VALUES ('43', '2014-12-05 09:00:05', '0', 'TCP_IMS_HIT', '304', '238', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/450/0303000a/3/default/84c1a106eacd47e58024829c99ace1be/3.ts', '450', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.24', '223.104.4.50,%20123.94.21.5,%20211.98.96.28', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('44', '2014-12-05 09:00:05', '0', 'TCP_IMS_HIT', '304', '237', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/2000/0303000a/3/default/7de04da9c8f04261808976d52ccb220d/212.ts', '2000', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.24', '122.7.103.74,%20112.117.221.37,%2061.139.127.214', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('45', '2014-12-05 09:00:05', '0', 'TCP_IMS_HIT', '304', '241', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/850/0303000a/3/default/4b2af0396def4325bb992ce86c015356/3.ts', '850', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.53', '211.139.115.20,%20123.94.21.4,%20123.94.4.40', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('46', '2014-12-05 09:00:05', '22', 'TCP_IMS_HIT', '304', '237', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/850/0303000a/3/default/87ac5067e9884d22b5c4d78b60e9676c/112.ts', '850', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.24', '211.103.24.154,%20123.94.21.5,%20123.94.4.41', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('47', '2014-12-05 09:00:06', '70', 'TCP_IMS_HIT', '304', '236', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/850/0303000a/3/default/7c48274c609341cca23c2e0aa316e4d8/10.ts', '850', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.22', '124.238.131.8,%20116.211.122.169,%20116.211.122.169,%2061.139.127.214', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('48', '2014-12-05 09:00:06', '1', 'TCP_IMS_HIT', '304', '235', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/850/0303000a/3/default/02858b342ac43ddfc685ec190a4e5c44/132.ts', '850', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.15', '112.25.25.178,%20123.94.21.5,%20123.94.4.41', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('49', '2014-12-05 09:00:06', '0', 'TCP_IMS_HIT', '304', '236', 'GET', 'http://asp.cntv.lxdns.com/asp/hls/850/0303000a/3/default/31b7256f89ee4f36e6fe1bbe815aa112/47.ts', '850', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.15', '218.78.132.10,%20115.231.22.20,%20218.75.154.36,%20218.75.154.63', 'asp.cntv.lxdns.com', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('50', '2014-12-05 09:00:06', '1', 'TCP_IMS_HIT', '304', '263', 'GET', 'http://asp.cntv.lxdns.com/asp/hls/main/0303000a/3/default/e9b269b942de47f31bb367879bc706b4/main.m3u8', '0', '-', 'NONE', '172.20.163.95', 'application/x-mpegURL', '10.80.4.205', '49.77.143.162,%20180.97.178.46,%2059.56.26.174,%2059.56.26.183', 'asp.cntv.lxdns.com', 'm3u8');
INSERT INTO `squid_log_analyse` VALUES ('51', '2014-12-05 09:00:06', '3432', 'TCP_HIT', '200', '453365', 'GET', 'http://asp.v.cntv.cn/asp/hls/200/0303000a/3/default/2747ccf3a20b4b2c8084e4288d172929/4.ts', '200', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.15', '188.71.220.188,%20217.69.176.21,%2092.122.49.22,%2023.15.247.39', 'asp.v.cntv.cn', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('52', '2014-12-05 09:00:06', '0', 'TCP_IMS_HIT', '304', '243', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/850/0303000a/3/default/e417e2058ed94a57b62fd6a9724e8d04/151.ts', '850', '-', 'NONE', '172.20.163.95', 'video/MP2T', '10.80.4.205', '112.25.25.41,%20123.94.21.4,%20211.98.96.28', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('53', '2014-12-05 09:00:06', '992', 'TCP_MISS', '200', '634406', 'GET', 'http://asp.cntv.lxdns.com/asp/hls/450/0303000a/3/default/ed01c170124d44c887a79c3a9c7af64f/77.ts', '450', '-', 'SOURCEHASH_PARENT', '10.80.2.106', 'video/MP2T', '10.80.4.206', '117.149.103.250,%20112.17.2.59,%20218.205.75.23,%20218.205.75.47', 'asp.cntv.lxdns.com', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('54', '2014-12-05 09:00:06', '339', 'TCP_MISS', '304', '242', 'GET', 'http://asp.cctv.ccgslb.net/asp/hls/450/0303000a/3/default/6fc2b5b106894325cd5597ad3b25accf/20.ts', '450', '-', 'SOURCEHASH_PARENT', '10.80.2.106', '-', '10.80.4.19', '183.207.178.234,%20123.94.21.5,%20211.98.96.28', 'asp.cctv.ccgslb.net', 'ts');
INSERT INTO `squid_log_analyse` VALUES ('55', '2014-12-05 09:00:06', '650', 'TCP_MISS', '200', '392140', 'GET', 'http://asp.cntv.lxdns.com/asp/hls/200/0303000a/3/default/96ed7b91a8e548e29f155b889c7353b0/9.ts', '200', '-', 'SOURCEHASH_PARENT', '10.80.4.88', 'video/MP2T', '218.92.226.56', '113.106.146.82,%20125.90.207.60,%20218.92.226.82', 'asp.cntv.lxdns.com', 'ts');

-- ----------------------------
-- Table structure for `squid_log_coderate`
-- ----------------------------
DROP TABLE IF EXISTS `squid_log_coderate`;
CREATE TABLE `squid_log_coderate` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_time` varchar(20) DEFAULT NULL,
  `to_time` varchar(20) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  `year` varchar(20) DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `hour` varchar(20) DEFAULT NULL,
  `week` int(11) DEFAULT NULL,
  `code_rate` int(10) DEFAULT NULL,
  `num` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of squid_log_coderate
-- ----------------------------
INSERT INTO `squid_log_coderate` VALUES ('1', '2014-12-05 09:00:00', '2014-12-05 10:00:00', '2014-12-05 10:28:43', '2014', '12', '05', '09', '49', '0', '5');
INSERT INTO `squid_log_coderate` VALUES ('2', '2014-12-05 09:00:00', '2014-12-05 10:00:00', '2014-12-05 10:28:43', '2014', '12', '05', '09', '49', '200', '3');
INSERT INTO `squid_log_coderate` VALUES ('3', '2014-12-05 09:00:00', '2014-12-05 10:00:00', '2014-12-05 10:28:43', '2014', '12', '05', '09', '49', '450', '18');
INSERT INTO `squid_log_coderate` VALUES ('4', '2014-12-05 09:00:00', '2014-12-05 10:00:00', '2014-12-05 10:28:43', '2014', '12', '05', '09', '49', '850', '26');
INSERT INTO `squid_log_coderate` VALUES ('5', '2014-12-05 09:00:00', '2014-12-05 10:00:00', '2014-12-05 10:28:43', '2014', '12', '05', '09', '49', '2000', '3');

-- ----------------------------
-- Table structure for `squid_log_domain`
-- ----------------------------
DROP TABLE IF EXISTS `squid_log_domain`;
CREATE TABLE `squid_log_domain` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_time` varchar(20) DEFAULT NULL,
  `to_time` varchar(20) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  `year` varchar(20) DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `hour` varchar(20) DEFAULT NULL,
  `week` int(11) DEFAULT NULL,
  `domain_name` varchar(20) DEFAULT NULL,
  `num` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of squid_log_domain
-- ----------------------------
INSERT INTO `squid_log_domain` VALUES ('1', '2014-12-05 09:00:00', '2014-12-05 10:00:00', '2014-12-05 10:28:43', '2014', '12', '05', '09', '49', 'asp.cctv.ccgslb.net', '32');
INSERT INTO `squid_log_domain` VALUES ('2', '2014-12-05 09:00:00', '2014-12-05 10:00:00', '2014-12-05 10:28:43', '2014', '12', '05', '09', '49', 'asp.cntv.lxdns.com', '21');
INSERT INTO `squid_log_domain` VALUES ('3', '2014-12-05 09:00:00', '2014-12-05 10:00:00', '2014-12-05 10:28:43', '2014', '12', '05', '09', '49', 'asp.v.cntv.cn', '1');
INSERT INTO `squid_log_domain` VALUES ('4', '2014-12-05 09:00:00', '2014-12-05 10:00:00', '2014-12-05 10:28:43', '2014', '12', '05', '09', '49', 'otherdomain', '1');

-- ----------------------------
-- Table structure for `squid_log_hitmiss`
-- ----------------------------
DROP TABLE IF EXISTS `squid_log_hitmiss`;
CREATE TABLE `squid_log_hitmiss` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_time` varchar(20) DEFAULT NULL,
  `to_time` varchar(20) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  `year` varchar(20) DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `hour` varchar(20) DEFAULT NULL,
  `week` int(11) DEFAULT NULL,
  `hitmiss_info` varchar(20) DEFAULT NULL,
  `num` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of squid_log_hitmiss
-- ----------------------------
INSERT INTO `squid_log_hitmiss` VALUES ('1', '2014-12-05 09:00:00', '2014-12-05 10:00:00', '2014-12-05 10:28:43', '2014', '12', '05', '09', '49', 'TCP_HIT', '6');
INSERT INTO `squid_log_hitmiss` VALUES ('2', '2014-12-05 09:00:00', '2014-12-05 10:00:00', '2014-12-05 10:28:43', '2014', '12', '05', '09', '49', 'TCP_IMS_HIT', '29');
INSERT INTO `squid_log_hitmiss` VALUES ('3', '2014-12-05 09:00:00', '2014-12-05 10:00:00', '2014-12-05 10:28:43', '2014', '12', '05', '09', '49', 'TCP_MISS', '17');
INSERT INTO `squid_log_hitmiss` VALUES ('4', '2014-12-05 09:00:00', '2014-12-05 10:00:00', '2014-12-05 10:28:43', '2014', '12', '05', '09', '49', 'TCP_NEGATIVE_HIT', '1');
INSERT INTO `squid_log_hitmiss` VALUES ('5', '2014-12-05 09:00:00', '2014-12-05 10:00:00', '2014-12-05 10:28:43', '2014', '12', '05', '09', '49', 'TCP_REFRESH_HIT', '2');

-- ----------------------------
-- Table structure for `squid_log_serverrpinfo`
-- ----------------------------
DROP TABLE IF EXISTS `squid_log_serverrpinfo`;
CREATE TABLE `squid_log_serverrpinfo` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_time` varchar(20) DEFAULT NULL,
  `to_time` varchar(20) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  `year` varchar(20) DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `hour` varchar(20) DEFAULT NULL,
  `week` int(11) DEFAULT NULL,
  `resp_time` bigint(20) DEFAULT NULL,
  `resp_szie` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of squid_log_serverrpinfo
-- ----------------------------
INSERT INTO `squid_log_serverrpinfo` VALUES ('1', '2014-12-05 09:00:00', '2014-12-05 10:00:00', '2014-12-05 10:28:43', '2014', '12', '05', '09', '49', '230', '1240');

-- ----------------------------
-- Table structure for `squid_log_statcode`
-- ----------------------------
DROP TABLE IF EXISTS `squid_log_statcode`;
CREATE TABLE `squid_log_statcode` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_time` varchar(20) DEFAULT NULL,
  `to_time` varchar(20) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  `year` varchar(20) DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `hour` varchar(20) DEFAULT NULL,
  `week` int(11) DEFAULT NULL,
  `statcode` varchar(20) DEFAULT NULL,
  `num` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of squid_log_statcode
-- ----------------------------
INSERT INTO `squid_log_statcode` VALUES ('1', '2014-12-05 09:00:00', '2014-12-05 10:00:00', '2014-12-05 10:28:43', '2014', '12', '05', '09', '49', '200', '15');
INSERT INTO `squid_log_statcode` VALUES ('2', '2014-12-05 09:00:00', '2014-12-05 10:00:00', '2014-12-05 10:28:43', '2014', '12', '05', '09', '49', '304', '39');
INSERT INTO `squid_log_statcode` VALUES ('3', '2014-12-05 09:00:00', '2014-12-05 10:00:00', '2014-12-05 10:28:43', '2014', '12', '05', '09', '49', '405', '1');

-- ----------------------------
-- Table structure for `squid_log_tsorm3u8`
-- ----------------------------
DROP TABLE IF EXISTS `squid_log_tsorm3u8`;
CREATE TABLE `squid_log_tsorm3u8` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_time` varchar(20) DEFAULT NULL,
  `to_time` varchar(20) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  `year` varchar(20) DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `hour` varchar(20) DEFAULT NULL,
  `week` int(11) DEFAULT NULL,
  `ts_num` bigint(20) DEFAULT NULL,
  `m3u8_num` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of squid_log_tsorm3u8
-- ----------------------------
INSERT INTO `squid_log_tsorm3u8` VALUES ('1', '2014-12-05 09:00:00', '2014-12-05 10:00:00', '2014-12-05 10:28:43', '2014', '12', '05', '09', '49', '50', '5');

-- ----------------------------
-- Table structure for `squid_log_vvinfo`
-- ----------------------------
DROP TABLE IF EXISTS `squid_log_vvinfo`;
CREATE TABLE `squid_log_vvinfo` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_time` varchar(20) DEFAULT NULL,
  `to_time` varchar(20) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  `year` varchar(20) DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `hour` varchar(20) DEFAULT NULL,
  `week` int(11) DEFAULT NULL,
  `visit_vv` bigint(20) DEFAULT NULL,
  `visit_uv` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of squid_log_vvinfo
-- ----------------------------
INSERT INTO `squid_log_vvinfo` VALUES ('1', '2014-12-05 09:00:00', '2014-12-05 10:00:00', '2014-12-05 10:28:43', '2014', '12', '05', '09', '49', '55', '16');
