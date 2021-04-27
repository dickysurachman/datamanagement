-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2021 at 07:54 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE database `datamagement`;

--
-- Database: `datamagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblacls`
--

CREATE TABLE `tblacls` (
  `id` int(11) NOT NULL,
  `target` int(11) NOT NULL DEFAULT '0',
  `targetType` tinyint(4) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '-1',
  `groupID` int(11) NOT NULL DEFAULT '-1',
  `mode` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblacos`
--

CREATE TABLE `tblacos` (
  `id` int(11) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `model` text NOT NULL,
  `foreignid` int(11) NOT NULL DEFAULT '0',
  `alias` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblaros`
--

CREATE TABLE `tblaros` (
  `id` int(11) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `model` text NOT NULL,
  `foreignid` int(11) NOT NULL DEFAULT '0',
  `alias` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblarosacos`
--

CREATE TABLE `tblarosacos` (
  `id` int(11) NOT NULL,
  `aro` int(11) NOT NULL DEFAULT '0',
  `aco` int(11) NOT NULL DEFAULT '0',
  `create` tinyint(4) NOT NULL DEFAULT '-1',
  `read` tinyint(4) NOT NULL DEFAULT '-1',
  `update` tinyint(4) NOT NULL DEFAULT '-1',
  `delete` tinyint(4) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblattributedefinitions`
--

CREATE TABLE `tblattributedefinitions` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `objtype` tinyint(4) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `multiple` tinyint(4) NOT NULL DEFAULT '0',
  `minvalues` int(11) NOT NULL DEFAULT '0',
  `maxvalues` int(11) NOT NULL DEFAULT '0',
  `valueset` text,
  `regex` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblcachedaccess`
--

CREATE TABLE `tblcachedaccess` (
  `id` int(11) NOT NULL,
  `document` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `mode` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbldocumentapprovelog`
--

CREATE TABLE `tbldocumentapprovelog` (
  `approveLogID` int(11) NOT NULL,
  `approveID` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date` datetime NOT NULL,
  `userID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbldocumentapprovers`
--

CREATE TABLE `tbldocumentapprovers` (
  `approveID` int(11) NOT NULL,
  `documentID` int(11) NOT NULL DEFAULT '0',
  `version` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `required` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbldocumentattributes`
--

CREATE TABLE `tbldocumentattributes` (
  `id` int(11) NOT NULL,
  `document` int(11) DEFAULT NULL,
  `attrdef` int(11) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbldocumentcategory`
--

CREATE TABLE `tbldocumentcategory` (
  `categoryID` int(11) NOT NULL DEFAULT '0',
  `documentID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbldocumentcheckouts`
--

CREATE TABLE `tbldocumentcheckouts` (
  `document` int(11) NOT NULL DEFAULT '0',
  `version` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `filename` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbldocumentcontent`
--

CREATE TABLE `tbldocumentcontent` (
  `id` int(11) NOT NULL,
  `document` int(11) NOT NULL DEFAULT '0',
  `version` smallint(5) UNSIGNED NOT NULL,
  `comment` text,
  `date` int(12) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dir` varchar(255) NOT NULL DEFAULT '',
  `orgFileName` varchar(150) NOT NULL DEFAULT '',
  `fileType` varchar(10) NOT NULL DEFAULT '',
  `mimeType` varchar(100) NOT NULL DEFAULT '',
  `fileSize` bigint(20) DEFAULT NULL,
  `checksum` char(32) DEFAULT NULL,
  `revisiondate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbldocumentcontentattributes`
--

CREATE TABLE `tbldocumentcontentattributes` (
  `id` int(11) NOT NULL,
  `content` int(11) DEFAULT NULL,
  `attrdef` int(11) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbldocumentfiles`
--

CREATE TABLE `tbldocumentfiles` (
  `id` int(11) NOT NULL,
  `document` int(11) NOT NULL DEFAULT '0',
  `version` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0',
  `comment` text,
  `name` varchar(150) DEFAULT NULL,
  `date` int(12) DEFAULT NULL,
  `dir` varchar(255) NOT NULL DEFAULT '',
  `orgFileName` varchar(150) NOT NULL DEFAULT '',
  `fileType` varchar(10) NOT NULL DEFAULT '',
  `mimeType` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbldocumentlinks`
--

CREATE TABLE `tbldocumentlinks` (
  `id` int(11) NOT NULL,
  `document` int(11) NOT NULL DEFAULT '0',
  `target` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0',
  `public` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbldocumentlocks`
--

CREATE TABLE `tbldocumentlocks` (
  `document` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbldocumentreceiptlog`
--

CREATE TABLE `tbldocumentreceiptlog` (
  `receiptLogID` int(11) NOT NULL,
  `receiptID` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date` datetime NOT NULL,
  `userID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbldocumentrecipients`
--

CREATE TABLE `tbldocumentrecipients` (
  `receiptID` int(11) NOT NULL,
  `documentID` int(11) NOT NULL DEFAULT '0',
  `version` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `required` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbldocumentreviewers`
--

CREATE TABLE `tbldocumentreviewers` (
  `reviewID` int(11) NOT NULL,
  `documentID` int(11) NOT NULL DEFAULT '0',
  `version` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `required` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbldocumentreviewlog`
--

CREATE TABLE `tbldocumentreviewlog` (
  `reviewLogID` int(11) NOT NULL,
  `reviewID` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date` datetime NOT NULL,
  `userID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbldocumentrevisionlog`
--

CREATE TABLE `tbldocumentrevisionlog` (
  `revisionLogID` int(11) NOT NULL,
  `revisionID` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date` datetime NOT NULL,
  `userID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbldocumentrevisors`
--

CREATE TABLE `tbldocumentrevisors` (
  `revisionID` int(11) NOT NULL,
  `documentID` int(11) NOT NULL DEFAULT '0',
  `version` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `required` int(11) NOT NULL DEFAULT '0',
  `startdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbldocuments`
--

CREATE TABLE `tbldocuments` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `comment` text,
  `date` int(12) DEFAULT NULL,
  `expires` int(12) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `folder` int(11) DEFAULT NULL,
  `folderList` text NOT NULL,
  `inheritAccess` tinyint(1) NOT NULL DEFAULT '1',
  `defaultAccess` tinyint(4) NOT NULL DEFAULT '0',
  `locked` int(11) NOT NULL DEFAULT '-1',
  `keywords` text NOT NULL,
  `sequence` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbldocumentstatus`
--

CREATE TABLE `tbldocumentstatus` (
  `statusID` int(11) NOT NULL,
  `documentID` int(11) NOT NULL DEFAULT '0',
  `version` smallint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbldocumentstatuslog`
--

CREATE TABLE `tbldocumentstatuslog` (
  `statusLogID` int(11) NOT NULL,
  `statusID` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date` datetime NOT NULL,
  `userID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblevents`
--

CREATE TABLE `tblevents` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `comment` text,
  `start` int(12) DEFAULT NULL,
  `stop` int(12) DEFAULT NULL,
  `date` int(12) DEFAULT NULL,
  `userID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblfolderattributes`
--

CREATE TABLE `tblfolderattributes` (
  `id` int(11) NOT NULL,
  `folder` int(11) DEFAULT NULL,
  `attrdef` int(11) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblfolders`
--

CREATE TABLE `tblfolders` (
  `id` int(11) NOT NULL,
  `name` varchar(70) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `folderList` text NOT NULL,
  `comment` text,
  `date` int(12) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `inheritAccess` tinyint(1) NOT NULL DEFAULT '1',
  `defaultAccess` tinyint(4) NOT NULL DEFAULT '0',
  `sequence` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblfolders`
--

INSERT INTO `tblfolders` (`id`, `name`, `parent`, `folderList`, `comment`, `date`, `owner`, `inheritAccess`, `defaultAccess`, `sequence`) VALUES
(1, 'DMS', 0, '', 'DMS root', 1619499263, 1, 0, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblgroupmembers`
--

CREATE TABLE `tblgroupmembers` (
  `groupID` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0',
  `manager` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblgroups`
--

CREATE TABLE `tblgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblkeywordcategories`
--

CREATE TABLE `tblkeywordcategories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `owner` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblkeywords`
--

CREATE TABLE `tblkeywords` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL DEFAULT '0',
  `keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblmandatoryapprovers`
--

CREATE TABLE `tblmandatoryapprovers` (
  `userID` int(11) NOT NULL DEFAULT '0',
  `approverUserID` int(11) NOT NULL DEFAULT '0',
  `approverGroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblmandatoryreviewers`
--

CREATE TABLE `tblmandatoryreviewers` (
  `userID` int(11) NOT NULL DEFAULT '0',
  `reviewerUserID` int(11) NOT NULL DEFAULT '0',
  `reviewerGroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblnotify`
--

CREATE TABLE `tblnotify` (
  `target` int(11) NOT NULL DEFAULT '0',
  `targetType` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '-1',
  `groupID` int(11) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblroles`
--

CREATE TABLE `tblroles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `role` smallint(1) NOT NULL DEFAULT '0',
  `noaccess` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblroles`
--

INSERT INTO `tblroles` (`id`, `name`, `role`, `noaccess`) VALUES
(1, 'Admin', 1, ''),
(2, 'Guest', 2, ''),
(3, 'User', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tblschedulertask`
--

CREATE TABLE `tblschedulertask` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `disabled` smallint(1) NOT NULL DEFAULT '0',
  `extension` varchar(100) DEFAULT NULL,
  `task` varchar(100) DEFAULT NULL,
  `frequency` varchar(100) DEFAULT NULL,
  `params` text,
  `nextrun` datetime DEFAULT NULL,
  `lastrun` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblsessions`
--

CREATE TABLE `tblsessions` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `userID` int(11) NOT NULL DEFAULT '0',
  `lastAccess` int(11) NOT NULL DEFAULT '0',
  `theme` varchar(30) NOT NULL DEFAULT '',
  `language` varchar(30) NOT NULL DEFAULT '',
  `clipboard` text,
  `su` int(11) DEFAULT NULL,
  `splashmsg` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbltransmittalitems`
--

CREATE TABLE `tbltransmittalitems` (
  `id` int(11) NOT NULL,
  `transmittal` int(11) NOT NULL DEFAULT '0',
  `document` int(11) DEFAULT NULL,
  `version` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbltransmittals`
--

CREATE TABLE `tbltransmittals` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `comment` text NOT NULL,
  `userID` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbluserimages`
--

CREATE TABLE `tbluserimages` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL DEFAULT '0',
  `image` blob NOT NULL,
  `mimeType` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbluserpasswordhistory`
--

CREATE TABLE `tbluserpasswordhistory` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL DEFAULT '0',
  `pwd` varchar(50) DEFAULT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbluserpasswordrequest`
--

CREATE TABLE `tbluserpasswordrequest` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL DEFAULT '0',
  `hash` varchar(50) DEFAULT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL,
  `login` varchar(50) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `secret` varchar(50) DEFAULT NULL,
  `fullName` varchar(100) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `language` varchar(32) NOT NULL,
  `theme` varchar(32) NOT NULL,
  `comment` text NOT NULL,
  `role` int(11) NOT NULL,
  `hidden` smallint(1) NOT NULL DEFAULT '0',
  `pwdExpiration` datetime DEFAULT NULL,
  `loginfailures` tinyint(4) NOT NULL DEFAULT '0',
  `disabled` smallint(1) NOT NULL DEFAULT '0',
  `quota` bigint(20) DEFAULT NULL,
  `homefolder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`, `login`, `pwd`, `secret`, `fullName`, `email`, `language`, `theme`, `comment`, `role`, `hidden`, `pwdExpiration`, `loginfailures`, `disabled`, `quota`, `homefolder`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '', 'Administrator', 'address@server.com', 'en_GB', '', '', 1, 0, NULL, 0, 0, 0, NULL),
(2, 'guest', NULL, '', 'Guest User', NULL, '', '', '', 2, 0, NULL, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblusersubstitutes`
--

CREATE TABLE `tblusersubstitutes` (
  `id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `substitute` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblversion`
--

CREATE TABLE `tblversion` (
  `date` datetime NOT NULL,
  `major` smallint(6) DEFAULT NULL,
  `minor` smallint(6) DEFAULT NULL,
  `subminor` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblversion`
--

INSERT INTO `tblversion` (`date`, `major`, `minor`, `subminor`) VALUES
('2021-04-27 11:54:23', 6, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblworkflowactions`
--

CREATE TABLE `tblworkflowactions` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblworkflowdocumentcontent`
--

CREATE TABLE `tblworkflowdocumentcontent` (
  `id` int(11) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `workflow` int(11) DEFAULT NULL,
  `document` int(11) DEFAULT NULL,
  `version` smallint(5) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblworkflowlog`
--

CREATE TABLE `tblworkflowlog` (
  `id` int(11) NOT NULL,
  `workflowdocumentcontent` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) DEFAULT NULL,
  `transition` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblworkflowmandatoryworkflow`
--

CREATE TABLE `tblworkflowmandatoryworkflow` (
  `userid` int(11) DEFAULT NULL,
  `workflow` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblworkflows`
--

CREATE TABLE `tblworkflows` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `initstate` int(11) NOT NULL,
  `layoutdata` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblworkflowstates`
--

CREATE TABLE `tblworkflowstates` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `visibility` smallint(5) DEFAULT '0',
  `maxtime` int(11) DEFAULT '0',
  `precondfunc` text,
  `documentstatus` smallint(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblworkflowtransitiongroups`
--

CREATE TABLE `tblworkflowtransitiongroups` (
  `id` int(11) NOT NULL,
  `transition` int(11) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  `minusers` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblworkflowtransitions`
--

CREATE TABLE `tblworkflowtransitions` (
  `id` int(11) NOT NULL,
  `workflow` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `action` int(11) DEFAULT NULL,
  `nextstate` int(11) DEFAULT NULL,
  `maxtime` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblworkflowtransitionusers`
--

CREATE TABLE `tblworkflowtransitionusers` (
  `id` int(11) NOT NULL,
  `transition` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblacls`
--
ALTER TABLE `tblacls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblacos`
--
ALTER TABLE `tblacos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblaros`
--
ALTER TABLE `tblaros`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblarosacos`
--
ALTER TABLE `tblarosacos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `aco` (`aco`,`aro`),
  ADD KEY `tblArosAcos_aros` (`aro`);

--
-- Indexes for table `tblattributedefinitions`
--
ALTER TABLE `tblattributedefinitions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tblcachedaccess`
--
ALTER TABLE `tblcachedaccess`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tblCachedAccess_document` (`document`),
  ADD KEY `tblCachedAccess_user` (`user`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbldocumentapprovelog`
--
ALTER TABLE `tbldocumentapprovelog`
  ADD PRIMARY KEY (`approveLogID`),
  ADD KEY `tblDocumentApproveLog_approve` (`approveID`),
  ADD KEY `tblDocumentApproveLog_user` (`userID`);

--
-- Indexes for table `tbldocumentapprovers`
--
ALTER TABLE `tbldocumentapprovers`
  ADD PRIMARY KEY (`approveID`),
  ADD UNIQUE KEY `documentID` (`documentID`,`version`,`type`,`required`),
  ADD KEY `indDocumentApproversRequired` (`required`);

--
-- Indexes for table `tbldocumentattributes`
--
ALTER TABLE `tbldocumentattributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `document` (`document`,`attrdef`),
  ADD KEY `tblDocumentAttributes_attrdef` (`attrdef`);

--
-- Indexes for table `tbldocumentcategory`
--
ALTER TABLE `tbldocumentcategory`
  ADD KEY `tblDocumentCategory_category` (`categoryID`),
  ADD KEY `tblDocumentCategory_document` (`documentID`);

--
-- Indexes for table `tbldocumentcheckouts`
--
ALTER TABLE `tbldocumentcheckouts`
  ADD PRIMARY KEY (`document`),
  ADD KEY `tblDocumentCheckOuts_user` (`userID`);

--
-- Indexes for table `tbldocumentcontent`
--
ALTER TABLE `tbldocumentcontent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `document` (`document`,`version`);

--
-- Indexes for table `tbldocumentcontentattributes`
--
ALTER TABLE `tbldocumentcontentattributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content` (`content`,`attrdef`),
  ADD KEY `tblDocumentContentAttributes_attrdef` (`attrdef`);

--
-- Indexes for table `tbldocumentfiles`
--
ALTER TABLE `tbldocumentfiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tblDocumentFiles_document` (`document`),
  ADD KEY `tblDocumentFiles_user` (`userID`);

--
-- Indexes for table `tbldocumentlinks`
--
ALTER TABLE `tbldocumentlinks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tblDocumentLinks_document` (`document`),
  ADD KEY `tblDocumentLinks_target` (`target`),
  ADD KEY `tblDocumentLinks_user` (`userID`);

--
-- Indexes for table `tbldocumentlocks`
--
ALTER TABLE `tbldocumentlocks`
  ADD PRIMARY KEY (`document`),
  ADD KEY `tblDocumentLocks_user` (`userID`);

--
-- Indexes for table `tbldocumentreceiptlog`
--
ALTER TABLE `tbldocumentreceiptlog`
  ADD PRIMARY KEY (`receiptLogID`),
  ADD KEY `tblDocumentReceiptLog_receipt` (`receiptID`),
  ADD KEY `tblDocumentReceiptLog_user` (`userID`);

--
-- Indexes for table `tbldocumentrecipients`
--
ALTER TABLE `tbldocumentrecipients`
  ADD PRIMARY KEY (`receiptID`),
  ADD UNIQUE KEY `documentID` (`documentID`,`version`,`type`,`required`),
  ADD KEY `indDocumentRecipientsRequired` (`required`);

--
-- Indexes for table `tbldocumentreviewers`
--
ALTER TABLE `tbldocumentreviewers`
  ADD PRIMARY KEY (`reviewID`),
  ADD UNIQUE KEY `documentID` (`documentID`,`version`,`type`,`required`),
  ADD KEY `indDocumentReviewersRequired` (`required`);

--
-- Indexes for table `tbldocumentreviewlog`
--
ALTER TABLE `tbldocumentreviewlog`
  ADD PRIMARY KEY (`reviewLogID`),
  ADD KEY `tblDocumentReviewLog_review` (`reviewID`),
  ADD KEY `tblDocumentReviewLog_user` (`userID`);

--
-- Indexes for table `tbldocumentrevisionlog`
--
ALTER TABLE `tbldocumentrevisionlog`
  ADD PRIMARY KEY (`revisionLogID`),
  ADD KEY `tblDocumentRevisionLog_revision` (`revisionID`),
  ADD KEY `tblDocumentRevisionLog_user` (`userID`);

--
-- Indexes for table `tbldocumentrevisors`
--
ALTER TABLE `tbldocumentrevisors`
  ADD PRIMARY KEY (`revisionID`),
  ADD UNIQUE KEY `documentID` (`documentID`,`version`,`type`,`required`),
  ADD KEY `indDocumentRevisorsRequired` (`required`);

--
-- Indexes for table `tbldocuments`
--
ALTER TABLE `tbldocuments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tblDocuments_folder` (`folder`),
  ADD KEY `tblDocuments_owner` (`owner`);

--
-- Indexes for table `tbldocumentstatus`
--
ALTER TABLE `tbldocumentstatus`
  ADD PRIMARY KEY (`statusID`),
  ADD UNIQUE KEY `documentID` (`documentID`,`version`);

--
-- Indexes for table `tbldocumentstatuslog`
--
ALTER TABLE `tbldocumentstatuslog`
  ADD PRIMARY KEY (`statusLogID`),
  ADD KEY `statusID` (`statusID`),
  ADD KEY `tblDocumentStatusLog_user` (`userID`);

--
-- Indexes for table `tblevents`
--
ALTER TABLE `tblevents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblfolderattributes`
--
ALTER TABLE `tblfolderattributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `folder` (`folder`,`attrdef`),
  ADD KEY `tblFolderAttributes_attrdef` (`attrdef`);

--
-- Indexes for table `tblfolders`
--
ALTER TABLE `tblfolders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `tblFolders_owner` (`owner`);

--
-- Indexes for table `tblgroupmembers`
--
ALTER TABLE `tblgroupmembers`
  ADD UNIQUE KEY `groupID` (`groupID`,`userID`),
  ADD KEY `tblGroupMembers_user` (`userID`);

--
-- Indexes for table `tblgroups`
--
ALTER TABLE `tblgroups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblkeywordcategories`
--
ALTER TABLE `tblkeywordcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblkeywords`
--
ALTER TABLE `tblkeywords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tblKeywords_category` (`category`);

--
-- Indexes for table `tblmandatoryapprovers`
--
ALTER TABLE `tblmandatoryapprovers`
  ADD PRIMARY KEY (`userID`,`approverUserID`,`approverGroupID`);

--
-- Indexes for table `tblmandatoryreviewers`
--
ALTER TABLE `tblmandatoryreviewers`
  ADD PRIMARY KEY (`userID`,`reviewerUserID`,`reviewerGroupID`);

--
-- Indexes for table `tblnotify`
--
ALTER TABLE `tblnotify`
  ADD PRIMARY KEY (`target`,`targetType`,`userID`,`groupID`);

--
-- Indexes for table `tblroles`
--
ALTER TABLE `tblroles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tblschedulertask`
--
ALTER TABLE `tblschedulertask`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsessions`
--
ALTER TABLE `tblsessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tblSessions_user` (`userID`);

--
-- Indexes for table `tbltransmittalitems`
--
ALTER TABLE `tbltransmittalitems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transmittal` (`transmittal`,`document`,`version`),
  ADD KEY `tblTransmittalItems_document` (`document`);

--
-- Indexes for table `tbltransmittals`
--
ALTER TABLE `tbltransmittals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tblTransmittals_user` (`userID`);

--
-- Indexes for table `tbluserimages`
--
ALTER TABLE `tbluserimages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tblUserImages_user` (`userID`);

--
-- Indexes for table `tbluserpasswordhistory`
--
ALTER TABLE `tbluserpasswordhistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tblUserPasswordHistory_user` (`userID`);

--
-- Indexes for table `tbluserpasswordrequest`
--
ALTER TABLE `tbluserpasswordrequest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tblUserPasswordRequest_user` (`userID`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `tblUsers_role` (`role`),
  ADD KEY `tblUsers_homefolder` (`homefolder`);

--
-- Indexes for table `tblusersubstitutes`
--
ALTER TABLE `tblusersubstitutes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user` (`user`,`substitute`);

--
-- Indexes for table `tblworkflowactions`
--
ALTER TABLE `tblworkflowactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblworkflowdocumentcontent`
--
ALTER TABLE `tblworkflowdocumentcontent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tblWorkflowDocument_document` (`document`),
  ADD KEY `tblWorkflowDocument_workflow` (`workflow`),
  ADD KEY `tblWorkflowDocument_state` (`state`),
  ADD KEY `tblWorkflowDocumentContent_parent` (`parent`);

--
-- Indexes for table `tblworkflowlog`
--
ALTER TABLE `tblworkflowlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tblWorkflowLog_userid` (`userid`),
  ADD KEY `tblWorkflowLog_transition` (`transition`),
  ADD KEY `tblWorkflowLog_workflowdocumentcontent` (`workflowdocumentcontent`);

--
-- Indexes for table `tblworkflowmandatoryworkflow`
--
ALTER TABLE `tblworkflowmandatoryworkflow`
  ADD UNIQUE KEY `userid` (`userid`,`workflow`),
  ADD KEY `tblWorkflowMandatoryWorkflow_workflow` (`workflow`);

--
-- Indexes for table `tblworkflows`
--
ALTER TABLE `tblworkflows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tblWorkflow_initstate` (`initstate`);

--
-- Indexes for table `tblworkflowstates`
--
ALTER TABLE `tblworkflowstates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblworkflowtransitiongroups`
--
ALTER TABLE `tblworkflowtransitiongroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tblWorkflowTransitionGroups_transition` (`transition`),
  ADD KEY `tblWorkflowTransitionGroups_groupid` (`groupid`);

--
-- Indexes for table `tblworkflowtransitions`
--
ALTER TABLE `tblworkflowtransitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tblWorkflowTransitions_workflow` (`workflow`),
  ADD KEY `tblWorkflowTransitions_state` (`state`),
  ADD KEY `tblWorkflowTransitions_action` (`action`),
  ADD KEY `tblWorkflowTransitions_nextstate` (`nextstate`);

--
-- Indexes for table `tblworkflowtransitionusers`
--
ALTER TABLE `tblworkflowtransitionusers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tblWorkflowTransitionUsers_transition` (`transition`),
  ADD KEY `tblWorkflowTransitionUsers_userid` (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblacls`
--
ALTER TABLE `tblacls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblacos`
--
ALTER TABLE `tblacos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblaros`
--
ALTER TABLE `tblaros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblarosacos`
--
ALTER TABLE `tblarosacos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblattributedefinitions`
--
ALTER TABLE `tblattributedefinitions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblcachedaccess`
--
ALTER TABLE `tblcachedaccess`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbldocumentapprovelog`
--
ALTER TABLE `tbldocumentapprovelog`
  MODIFY `approveLogID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbldocumentapprovers`
--
ALTER TABLE `tbldocumentapprovers`
  MODIFY `approveID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbldocumentattributes`
--
ALTER TABLE `tbldocumentattributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbldocumentcontent`
--
ALTER TABLE `tbldocumentcontent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbldocumentcontentattributes`
--
ALTER TABLE `tbldocumentcontentattributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbldocumentfiles`
--
ALTER TABLE `tbldocumentfiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbldocumentlinks`
--
ALTER TABLE `tbldocumentlinks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbldocumentreceiptlog`
--
ALTER TABLE `tbldocumentreceiptlog`
  MODIFY `receiptLogID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbldocumentrecipients`
--
ALTER TABLE `tbldocumentrecipients`
  MODIFY `receiptID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbldocumentreviewers`
--
ALTER TABLE `tbldocumentreviewers`
  MODIFY `reviewID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbldocumentreviewlog`
--
ALTER TABLE `tbldocumentreviewlog`
  MODIFY `reviewLogID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbldocumentrevisionlog`
--
ALTER TABLE `tbldocumentrevisionlog`
  MODIFY `revisionLogID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbldocumentrevisors`
--
ALTER TABLE `tbldocumentrevisors`
  MODIFY `revisionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbldocuments`
--
ALTER TABLE `tbldocuments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbldocumentstatus`
--
ALTER TABLE `tbldocumentstatus`
  MODIFY `statusID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbldocumentstatuslog`
--
ALTER TABLE `tbldocumentstatuslog`
  MODIFY `statusLogID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblevents`
--
ALTER TABLE `tblevents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblfolderattributes`
--
ALTER TABLE `tblfolderattributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblfolders`
--
ALTER TABLE `tblfolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblgroups`
--
ALTER TABLE `tblgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblkeywordcategories`
--
ALTER TABLE `tblkeywordcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblkeywords`
--
ALTER TABLE `tblkeywords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblroles`
--
ALTER TABLE `tblroles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblschedulertask`
--
ALTER TABLE `tblschedulertask`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbltransmittalitems`
--
ALTER TABLE `tbltransmittalitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbltransmittals`
--
ALTER TABLE `tbltransmittals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbluserimages`
--
ALTER TABLE `tbluserimages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbluserpasswordhistory`
--
ALTER TABLE `tbluserpasswordhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbluserpasswordrequest`
--
ALTER TABLE `tbluserpasswordrequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblusersubstitutes`
--
ALTER TABLE `tblusersubstitutes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblworkflowactions`
--
ALTER TABLE `tblworkflowactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblworkflowdocumentcontent`
--
ALTER TABLE `tblworkflowdocumentcontent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblworkflowlog`
--
ALTER TABLE `tblworkflowlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblworkflows`
--
ALTER TABLE `tblworkflows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblworkflowstates`
--
ALTER TABLE `tblworkflowstates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblworkflowtransitiongroups`
--
ALTER TABLE `tblworkflowtransitiongroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblworkflowtransitions`
--
ALTER TABLE `tblworkflowtransitions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblworkflowtransitionusers`
--
ALTER TABLE `tblworkflowtransitionusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblarosacos`
--
ALTER TABLE `tblarosacos`
  ADD CONSTRAINT `tblArosAcos_acos` FOREIGN KEY (`aco`) REFERENCES `tblacos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblArosAcos_aros` FOREIGN KEY (`aro`) REFERENCES `tblaros` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tblcachedaccess`
--
ALTER TABLE `tblcachedaccess`
  ADD CONSTRAINT `tblCachedAccess_document` FOREIGN KEY (`document`) REFERENCES `tbldocuments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblCachedAccess_user` FOREIGN KEY (`user`) REFERENCES `tblusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbldocumentapprovelog`
--
ALTER TABLE `tbldocumentapprovelog`
  ADD CONSTRAINT `tblDocumentApproveLog_approve` FOREIGN KEY (`approveID`) REFERENCES `tbldocumentapprovers` (`approveID`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblDocumentApproveLog_user` FOREIGN KEY (`userID`) REFERENCES `tblusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbldocumentapprovers`
--
ALTER TABLE `tbldocumentapprovers`
  ADD CONSTRAINT `tblDocumentApprovers_document` FOREIGN KEY (`documentID`) REFERENCES `tbldocuments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbldocumentattributes`
--
ALTER TABLE `tbldocumentattributes`
  ADD CONSTRAINT `tblDocumentAttributes_attrdef` FOREIGN KEY (`attrdef`) REFERENCES `tblattributedefinitions` (`id`),
  ADD CONSTRAINT `tblDocumentAttributes_document` FOREIGN KEY (`document`) REFERENCES `tbldocuments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbldocumentcategory`
--
ALTER TABLE `tbldocumentcategory`
  ADD CONSTRAINT `tblDocumentCategory_category` FOREIGN KEY (`categoryID`) REFERENCES `tblcategory` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblDocumentCategory_document` FOREIGN KEY (`documentID`) REFERENCES `tbldocuments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbldocumentcheckouts`
--
ALTER TABLE `tbldocumentcheckouts`
  ADD CONSTRAINT `tblDocumentCheckOuts_document` FOREIGN KEY (`document`) REFERENCES `tbldocuments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblDocumentCheckOuts_user` FOREIGN KEY (`userID`) REFERENCES `tblusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbldocumentcontent`
--
ALTER TABLE `tbldocumentcontent`
  ADD CONSTRAINT `tblDocumentContent_document` FOREIGN KEY (`document`) REFERENCES `tbldocuments` (`id`);

--
-- Constraints for table `tbldocumentcontentattributes`
--
ALTER TABLE `tbldocumentcontentattributes`
  ADD CONSTRAINT `tblDocumentContentAttributes_attrdef` FOREIGN KEY (`attrdef`) REFERENCES `tblattributedefinitions` (`id`),
  ADD CONSTRAINT `tblDocumentContentAttributes_document` FOREIGN KEY (`content`) REFERENCES `tbldocumentcontent` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbldocumentfiles`
--
ALTER TABLE `tbldocumentfiles`
  ADD CONSTRAINT `tblDocumentFiles_document` FOREIGN KEY (`document`) REFERENCES `tbldocuments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblDocumentFiles_user` FOREIGN KEY (`userID`) REFERENCES `tblusers` (`id`);

--
-- Constraints for table `tbldocumentlinks`
--
ALTER TABLE `tbldocumentlinks`
  ADD CONSTRAINT `tblDocumentLinks_document` FOREIGN KEY (`document`) REFERENCES `tbldocuments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblDocumentLinks_target` FOREIGN KEY (`target`) REFERENCES `tbldocuments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblDocumentLinks_user` FOREIGN KEY (`userID`) REFERENCES `tblusers` (`id`);

--
-- Constraints for table `tbldocumentlocks`
--
ALTER TABLE `tbldocumentlocks`
  ADD CONSTRAINT `tblDocumentLocks_document` FOREIGN KEY (`document`) REFERENCES `tbldocuments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblDocumentLocks_user` FOREIGN KEY (`userID`) REFERENCES `tblusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbldocumentreceiptlog`
--
ALTER TABLE `tbldocumentreceiptlog`
  ADD CONSTRAINT `tblDocumentReceiptLog_recipient` FOREIGN KEY (`receiptID`) REFERENCES `tbldocumentrecipients` (`receiptID`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblDocumentReceiptLog_user` FOREIGN KEY (`userID`) REFERENCES `tblusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbldocumentrecipients`
--
ALTER TABLE `tbldocumentrecipients`
  ADD CONSTRAINT `tblDocumentRecipients_document` FOREIGN KEY (`documentID`) REFERENCES `tbldocuments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbldocumentreviewers`
--
ALTER TABLE `tbldocumentreviewers`
  ADD CONSTRAINT `tblDocumentReviewers_document` FOREIGN KEY (`documentID`) REFERENCES `tbldocuments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbldocumentreviewlog`
--
ALTER TABLE `tbldocumentreviewlog`
  ADD CONSTRAINT `tblDocumentReviewLog_review` FOREIGN KEY (`reviewID`) REFERENCES `tbldocumentreviewers` (`reviewID`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblDocumentReviewLog_user` FOREIGN KEY (`userID`) REFERENCES `tblusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbldocumentrevisionlog`
--
ALTER TABLE `tbldocumentrevisionlog`
  ADD CONSTRAINT `tblDocumentRevisionLog_revision` FOREIGN KEY (`revisionID`) REFERENCES `tbldocumentrevisors` (`revisionID`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblDocumentRevisionLog_user` FOREIGN KEY (`userID`) REFERENCES `tblusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbldocumentrevisors`
--
ALTER TABLE `tbldocumentrevisors`
  ADD CONSTRAINT `tblDocumentRevisors_document` FOREIGN KEY (`documentID`) REFERENCES `tbldocuments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbldocuments`
--
ALTER TABLE `tbldocuments`
  ADD CONSTRAINT `tblDocuments_folder` FOREIGN KEY (`folder`) REFERENCES `tblfolders` (`id`),
  ADD CONSTRAINT `tblDocuments_owner` FOREIGN KEY (`owner`) REFERENCES `tblusers` (`id`);

--
-- Constraints for table `tbldocumentstatus`
--
ALTER TABLE `tbldocumentstatus`
  ADD CONSTRAINT `tblDocumentStatus_document` FOREIGN KEY (`documentID`) REFERENCES `tbldocuments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbldocumentstatuslog`
--
ALTER TABLE `tbldocumentstatuslog`
  ADD CONSTRAINT `tblDocumentStatusLog_status` FOREIGN KEY (`statusID`) REFERENCES `tbldocumentstatus` (`statusID`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblDocumentStatusLog_user` FOREIGN KEY (`userID`) REFERENCES `tblusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tblfolderattributes`
--
ALTER TABLE `tblfolderattributes`
  ADD CONSTRAINT `tblFolderAttributes_attrdef` FOREIGN KEY (`attrdef`) REFERENCES `tblattributedefinitions` (`id`),
  ADD CONSTRAINT `tblFolderAttributes_folder` FOREIGN KEY (`folder`) REFERENCES `tblfolders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tblfolders`
--
ALTER TABLE `tblfolders`
  ADD CONSTRAINT `tblFolders_owner` FOREIGN KEY (`owner`) REFERENCES `tblusers` (`id`);

--
-- Constraints for table `tblgroupmembers`
--
ALTER TABLE `tblgroupmembers`
  ADD CONSTRAINT `tblGroupMembers_group` FOREIGN KEY (`groupID`) REFERENCES `tblgroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblGroupMembers_user` FOREIGN KEY (`userID`) REFERENCES `tblusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tblkeywords`
--
ALTER TABLE `tblkeywords`
  ADD CONSTRAINT `tblKeywords_category` FOREIGN KEY (`category`) REFERENCES `tblkeywordcategories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tblmandatoryapprovers`
--
ALTER TABLE `tblmandatoryapprovers`
  ADD CONSTRAINT `tblMandatoryApprovers_user` FOREIGN KEY (`userID`) REFERENCES `tblusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tblmandatoryreviewers`
--
ALTER TABLE `tblmandatoryreviewers`
  ADD CONSTRAINT `tblMandatoryReviewers_user` FOREIGN KEY (`userID`) REFERENCES `tblusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tblsessions`
--
ALTER TABLE `tblsessions`
  ADD CONSTRAINT `tblSessions_user` FOREIGN KEY (`userID`) REFERENCES `tblusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbltransmittalitems`
--
ALTER TABLE `tbltransmittalitems`
  ADD CONSTRAINT `tblTransmittalItem_transmittal` FOREIGN KEY (`transmittal`) REFERENCES `tbltransmittals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblTransmittalItems_document` FOREIGN KEY (`document`) REFERENCES `tbldocuments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbltransmittals`
--
ALTER TABLE `tbltransmittals`
  ADD CONSTRAINT `tblTransmittals_user` FOREIGN KEY (`userID`) REFERENCES `tblusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbluserimages`
--
ALTER TABLE `tbluserimages`
  ADD CONSTRAINT `tblUserImages_user` FOREIGN KEY (`userID`) REFERENCES `tblusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbluserpasswordhistory`
--
ALTER TABLE `tbluserpasswordhistory`
  ADD CONSTRAINT `tblUserPasswordHistory_user` FOREIGN KEY (`userID`) REFERENCES `tblusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbluserpasswordrequest`
--
ALTER TABLE `tbluserpasswordrequest`
  ADD CONSTRAINT `tblUserPasswordRequest_user` FOREIGN KEY (`userID`) REFERENCES `tblusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD CONSTRAINT `tblUsers_homefolder` FOREIGN KEY (`homefolder`) REFERENCES `tblfolders` (`id`),
  ADD CONSTRAINT `tblUsers_role` FOREIGN KEY (`role`) REFERENCES `tblroles` (`id`);

--
-- Constraints for table `tblusersubstitutes`
--
ALTER TABLE `tblusersubstitutes`
  ADD CONSTRAINT `tblUserSubstitutes_substitute` FOREIGN KEY (`user`) REFERENCES `tblusers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblUserSubstitutes_user` FOREIGN KEY (`user`) REFERENCES `tblusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tblworkflowdocumentcontent`
--
ALTER TABLE `tblworkflowdocumentcontent`
  ADD CONSTRAINT `tblWorkflowDocumentContent_parent` FOREIGN KEY (`parent`) REFERENCES `tblworkflowdocumentcontent` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblWorkflowDocument_document` FOREIGN KEY (`document`) REFERENCES `tbldocuments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblWorkflowDocument_state` FOREIGN KEY (`state`) REFERENCES `tblworkflowstates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblWorkflowDocument_workflow` FOREIGN KEY (`workflow`) REFERENCES `tblworkflows` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tblworkflowlog`
--
ALTER TABLE `tblworkflowlog`
  ADD CONSTRAINT `tblWorkflowLog_transition` FOREIGN KEY (`transition`) REFERENCES `tblworkflowtransitions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblWorkflowLog_userid` FOREIGN KEY (`userid`) REFERENCES `tblusers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblWorkflowLog_workflowdocumentcontent` FOREIGN KEY (`workflowdocumentcontent`) REFERENCES `tblworkflowdocumentcontent` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tblworkflowmandatoryworkflow`
--
ALTER TABLE `tblworkflowmandatoryworkflow`
  ADD CONSTRAINT `tblWorkflowMandatoryWorkflow_userid` FOREIGN KEY (`userid`) REFERENCES `tblusers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblWorkflowMandatoryWorkflow_workflow` FOREIGN KEY (`workflow`) REFERENCES `tblworkflows` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tblworkflows`
--
ALTER TABLE `tblworkflows`
  ADD CONSTRAINT `tblWorkflow_initstate` FOREIGN KEY (`initstate`) REFERENCES `tblworkflowstates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tblworkflowtransitiongroups`
--
ALTER TABLE `tblworkflowtransitiongroups`
  ADD CONSTRAINT `tblWorkflowTransitionGroups_groupid` FOREIGN KEY (`groupid`) REFERENCES `tblgroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblWorkflowTransitionGroups_transition` FOREIGN KEY (`transition`) REFERENCES `tblworkflowtransitions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tblworkflowtransitions`
--
ALTER TABLE `tblworkflowtransitions`
  ADD CONSTRAINT `tblWorkflowTransitions_action` FOREIGN KEY (`action`) REFERENCES `tblworkflowactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblWorkflowTransitions_nextstate` FOREIGN KEY (`nextstate`) REFERENCES `tblworkflowstates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblWorkflowTransitions_state` FOREIGN KEY (`state`) REFERENCES `tblworkflowstates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblWorkflowTransitions_workflow` FOREIGN KEY (`workflow`) REFERENCES `tblworkflows` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tblworkflowtransitionusers`
--
ALTER TABLE `tblworkflowtransitionusers`
  ADD CONSTRAINT `tblWorkflowTransitionUsers_transition` FOREIGN KEY (`transition`) REFERENCES `tblworkflowtransitions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblWorkflowTransitionUsers_userid` FOREIGN KEY (`userid`) REFERENCES `tblusers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
