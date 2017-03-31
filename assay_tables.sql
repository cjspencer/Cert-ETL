/*
 Navicat MySQL Data Transfer

 Source Server         : chadwick
 Source Server Version : 50625
 Source Host           : localhost
 Source Database       : chadwick

 Target Server Version : 50625
 File Encoding         : utf-8

 Date: 02/11/2017 20:17:17 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `client_assay_data`
-- ----------------------------
DROP TABLE IF EXISTS `client_assay_data`;
CREATE TABLE `client_assay_data` (
  `client_assay_data_id` int(11) NOT NULL,
  `client_assay_id` int(11) NOT NULL,
  `sample_id` int(11) NOT NULL,
  `element` varchar(2) NOT NULL,
  `value` decimal(8,4) DEFAULT NULL,
  `min_value` tinyint(4) NOT NULL DEFAULT '0',
  `max_value` tinyint(4) NOT NULL DEFAULT '0',
  `units` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`client_assay_data_id`),
  KEY `report_id` (`client_assay_id`),
  CONSTRAINT `client_assay_data_ibfk_1` FOREIGN KEY (`client_assay_id`) REFERENCES `client_assays` (`client_assay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `client_assays`
-- ----------------------------
DROP TABLE IF EXISTS `client_assays`;
CREATE TABLE `client_assays` (
  `client_assay_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `lab_batch_number` varchar(255) DEFAULT NULL,
  `po_number` varchar(255) DEFAULT NULL,
  `date_received` datetime NOT NULL,
  `date_completed` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`client_assay_id`),
  KEY `lab_id` (`client_id`),
  KEY `lab_id_2` (`client_id`),
  KEY `lab_id_3` (`client_id`),
  KEY `lab_id_4` (`client_id`),
  CONSTRAINT `client_assays_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `clients`
-- ----------------------------
DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `lab_report_data`
-- ----------------------------
DROP TABLE IF EXISTS `lab_report_data`;
CREATE TABLE `lab_report_data` (
  `report_data_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `sample_id` int(11) NOT NULL,
  `element` varchar(2) NOT NULL,
  `value` decimal(8,4) DEFAULT NULL,
  `min_value` tinyint(4) NOT NULL DEFAULT '0',
  `max_value` tinyint(4) NOT NULL DEFAULT '0',
  `units` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`report_data_id`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `report_id_key` FOREIGN KEY (`report_id`) REFERENCES `lab_reports` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `lab_reports`
-- ----------------------------
DROP TABLE IF EXISTS `lab_reports`;
CREATE TABLE `lab_reports` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_id` int(11) NOT NULL,
  `lab_batch_number` varchar(255) DEFAULT NULL,
  `po_number` varchar(255) DEFAULT NULL,
  `date_received` datetime NOT NULL,
  `date_completed` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`report_id`),
  KEY `lab_id` (`lab_id`),
  KEY `lab_id_2` (`lab_id`),
  KEY `lab_id_3` (`lab_id`),
  KEY `lab_id_4` (`lab_id`),
  CONSTRAINT `lab_id_key` FOREIGN KEY (`lab_id`) REFERENCES `labs` (`lab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `labs`
-- ----------------------------
DROP TABLE IF EXISTS `labs`;
CREATE TABLE `labs` (
  `lab_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`lab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

