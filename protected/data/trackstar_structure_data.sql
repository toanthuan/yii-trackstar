-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2013 at 11:34 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: 'trackstar_dev'
--

-- --------------------------------------------------------

--
-- Table structure for table 'tbl_assignment'
--

DROP TABLE IF EXISTS tbl_assignment;
CREATE TABLE IF NOT EXISTS tbl_assignment (
  itemname varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  userid varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  bizrule text COLLATE utf8_unicode_ci,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (itemname,userid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'tbl_comment'
--

DROP TABLE IF EXISTS tbl_comment;
CREATE TABLE IF NOT EXISTS tbl_comment (
  id int(11) NOT NULL AUTO_INCREMENT,
  content text COLLATE utf8_unicode_ci NOT NULL,
  issue_id int(11) DEFAULT NULL,
  create_time datetime DEFAULT NULL,
  create_user_id int(11) DEFAULT NULL,
  update_time datetime DEFAULT NULL,
  update_user_id int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY FK_comment_issue (issue_id),
  KEY FK_comment_author (create_user_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table 'tbl_comment'
--

INSERT INTO tbl_comment VALUES(1, 'Test comment.', 1, '2013-06-07 11:28:00', 1, '2013-06-07 11:28:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table 'tbl_issue'
--

DROP TABLE IF EXISTS tbl_issue;
CREATE TABLE IF NOT EXISTS tbl_issue (
  id int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) CHARACTER SET latin1 NOT NULL,
  description varchar(2000) CHARACTER SET latin1 DEFAULT NULL,
  project_id int(11) DEFAULT NULL,
  type_id int(11) DEFAULT NULL,
  status_id int(11) DEFAULT NULL,
  owner_id int(11) DEFAULT NULL,
  requester_id int(11) DEFAULT NULL,
  create_time datetime DEFAULT NULL,
  create_user_id int(11) DEFAULT NULL,
  update_time datetime DEFAULT NULL,
  update_user_id int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY FK_issue_owner (owner_id),
  KEY FK_issue_requester (requester_id),
  KEY project_id (project_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table 'tbl_issue'
--

INSERT INTO tbl_issue VALUES(1, 'Issue 1 @ Project 1', 'Test Issue 1', 1, 0, 0, 1, 1, '2013-06-07 11:17:53', 1, '2013-06-07 11:17:53', 1);

-- --------------------------------------------------------

--
-- Table structure for table 'tbl_item'
--

DROP TABLE IF EXISTS tbl_item;
CREATE TABLE IF NOT EXISTS tbl_item (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  description text COLLATE utf8_unicode_ci,
  bizrule text COLLATE utf8_unicode_ci,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table 'tbl_item'
--

INSERT INTO tbl_item VALUES('createIssue', 0, '', '', 's:0:"";');
INSERT INTO tbl_item VALUES('createProject', 0, 'Create a new project', '', 's:0:"";');
INSERT INTO tbl_item VALUES('createUser', 0, 'Create a new user', '', 's:0:"";');
INSERT INTO tbl_item VALUES('deleteIssue', 0, '', '', 's:0:"";');
INSERT INTO tbl_item VALUES('deleteProject', 0, '', '', 's:0:"";');
INSERT INTO tbl_item VALUES('deleteUser', 0, '', '', 's:0:"";');
INSERT INTO tbl_item VALUES('manageIssueTask', 1, '', '', 's:0:"";');
INSERT INTO tbl_item VALUES('manageProjectTask', 1, '', '', 's:0:"";');
INSERT INTO tbl_item VALUES('manageUserTask', 1, '', '', 's:0:"";');
INSERT INTO tbl_item VALUES('Member', 2, '', '', 's:0:"";');
INSERT INTO tbl_item VALUES('Owner', 2, '', '', 's:0:"";');
INSERT INTO tbl_item VALUES('Reader', 2, '', '', 's:0:"";');
INSERT INTO tbl_item VALUES('readIssue', 0, '', '', 's:0:"";');
INSERT INTO tbl_item VALUES('readProject', 0, '', '', 's:0:"";');
INSERT INTO tbl_item VALUES('readTask', 1, '', '', 's:0:"";');
INSERT INTO tbl_item VALUES('readUser', 0, '', '', 's:0:"";');

-- --------------------------------------------------------

--
-- Table structure for table 'tbl_itemchild'
--

DROP TABLE IF EXISTS tbl_itemchild;
CREATE TABLE IF NOT EXISTS tbl_itemchild (
  parent varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  child varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (parent,child),
  KEY child (child)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table 'tbl_itemchild'
--

INSERT INTO tbl_itemchild VALUES('manageIssueTask', 'createIssue');
INSERT INTO tbl_itemchild VALUES('manageProjectTask', 'createProject');
INSERT INTO tbl_itemchild VALUES('manageUserTask', 'createUser');
INSERT INTO tbl_itemchild VALUES('manageIssueTask', 'deleteIssue');
INSERT INTO tbl_itemchild VALUES('manageProjectTask', 'deleteProject');
INSERT INTO tbl_itemchild VALUES('manageUserTask', 'deleteUser');
INSERT INTO tbl_itemchild VALUES('Member', 'manageIssueTask');
INSERT INTO tbl_itemchild VALUES('Owner', 'manageIssueTask');
INSERT INTO tbl_itemchild VALUES('Owner', 'manageProjectTask');
INSERT INTO tbl_itemchild VALUES('Owner', 'manageUserTask');
INSERT INTO tbl_itemchild VALUES('manageIssueTask', 'readIssue');
INSERT INTO tbl_itemchild VALUES('readTask', 'readIssue');
INSERT INTO tbl_itemchild VALUES('manageProjectTask', 'readProject');
INSERT INTO tbl_itemchild VALUES('readTask', 'readProject');
INSERT INTO tbl_itemchild VALUES('Member', 'readTask');
INSERT INTO tbl_itemchild VALUES('Owner', 'readTask');
INSERT INTO tbl_itemchild VALUES('Reader', 'readTask');
INSERT INTO tbl_itemchild VALUES('manageUserTask', 'readUser');
INSERT INTO tbl_itemchild VALUES('readTask', 'readUser');

-- --------------------------------------------------------

--
-- Table structure for table 'tbl_project'
--

DROP TABLE IF EXISTS tbl_project;
CREATE TABLE IF NOT EXISTS tbl_project (
  id int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  description text CHARACTER SET latin1,
  create_time datetime DEFAULT NULL,
  create_user_id int(11) DEFAULT NULL,
  update_time datetime DEFAULT NULL,
  update_user_id int(11) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table 'tbl_project'
--

INSERT INTO tbl_project VALUES(1, 'Project 1', 'Test project 1', '2013-06-07 11:16:39', 1, '2013-06-07 11:16:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table 'tbl_project_user_assignment'
--

DROP TABLE IF EXISTS tbl_project_user_assignment;
CREATE TABLE IF NOT EXISTS tbl_project_user_assignment (
  project_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  create_time datetime DEFAULT NULL,
  create_user_id int(11) DEFAULT NULL,
  update_time datetime DEFAULT NULL,
  update_user_id int(11) DEFAULT NULL,
  PRIMARY KEY (project_id,user_id),
  KEY user_id (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'tbl_project_user_role'
--

DROP TABLE IF EXISTS tbl_project_user_role;
CREATE TABLE IF NOT EXISTS tbl_project_user_role (
  project_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  role varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (project_id,user_id,role),
  KEY user_id (user_id),
  KEY role (role)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'tbl_user'
--

DROP TABLE IF EXISTS tbl_user;
CREATE TABLE IF NOT EXISTS tbl_user (
  id int(11) NOT NULL AUTO_INCREMENT,
  email varchar(256) CHARACTER SET latin1 NOT NULL,
  username varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  `password` varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  last_login_time datetime DEFAULT NULL,
  create_time datetime DEFAULT NULL,
  create_user_id int(11) DEFAULT NULL,
  update_time datetime DEFAULT NULL,
  update_user_id int(11) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table 'tbl_user'
--

INSERT INTO tbl_user VALUES(1, 'admin@noemail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2013-06-03 03:26:02', '2013-06-02 16:02:51', NULL, '2013-06-02 16:02:51', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_assignment`
--
ALTER TABLE `tbl_assignment`
  ADD CONSTRAINT tbl_assignment_ibfk_1 FOREIGN KEY (itemname) REFERENCES tbl_item (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD CONSTRAINT FK_comment_author FOREIGN KEY (create_user_id) REFERENCES tbl_user (id),
  ADD CONSTRAINT FK_comment_issue FOREIGN KEY (issue_id) REFERENCES tbl_issue (id);

--
-- Constraints for table `tbl_issue`
--
ALTER TABLE `tbl_issue`
  ADD CONSTRAINT FK_issue_owner FOREIGN KEY (owner_id) REFERENCES tbl_user (id) ON DELETE CASCADE,
  ADD CONSTRAINT FK_issue_requester FOREIGN KEY (requester_id) REFERENCES tbl_user (id) ON DELETE CASCADE,
  ADD CONSTRAINT tbl_issue_ibfk_2 FOREIGN KEY (project_id) REFERENCES tbl_project (id) ON DELETE CASCADE;

--
-- Constraints for table `tbl_itemchild`
--
ALTER TABLE `tbl_itemchild`
  ADD CONSTRAINT tbl_itemchild_ibfk_1 FOREIGN KEY (parent) REFERENCES tbl_item (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT tbl_itemchild_ibfk_2 FOREIGN KEY (child) REFERENCES tbl_item (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_project_user_assignment`
--
ALTER TABLE `tbl_project_user_assignment`
  ADD CONSTRAINT tbl_project_user_assignment_ibfk_1 FOREIGN KEY (project_id) REFERENCES tbl_project (id) ON DELETE CASCADE,
  ADD CONSTRAINT tbl_project_user_assignment_ibfk_2 FOREIGN KEY (user_id) REFERENCES tbl_user (id) ON DELETE CASCADE;

--
-- Constraints for table `tbl_project_user_role`
--
ALTER TABLE `tbl_project_user_role`
  ADD CONSTRAINT tbl_project_user_role_ibfk_1 FOREIGN KEY (project_id) REFERENCES tbl_project (id) ON DELETE CASCADE,
  ADD CONSTRAINT tbl_project_user_role_ibfk_2 FOREIGN KEY (user_id) REFERENCES tbl_user (id) ON DELETE CASCADE,
  ADD CONSTRAINT tbl_project_user_role_ibfk_3 FOREIGN KEY (role) REFERENCES tbl_item (`name`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
