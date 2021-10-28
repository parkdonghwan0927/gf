-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.8-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- test5 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `test5` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test5`;

-- 테이블 test5.comments 구조 내보내기
CREATE TABLE IF NOT EXISTS `comments` (
  `c_time` datetime DEFAULT current_timestamp(),
  `c_group` int(11) DEFAULT NULL,
  `c_order` int(11) DEFAULT NULL,
  `c_depth` int(11) DEFAULT NULL,
  `c_master` int(11) DEFAULT NULL,
  `c_no` int(11) NOT NULL AUTO_INCREMENT,
  `c_content` varchar(255) DEFAULT NULL,
  `c_writer` int(11) DEFAULT NULL,
  PRIMARY KEY (`c_no`),
  KEY `FK_commnets_writing` (`c_master`),
  KEY `FK_comments_user` (`c_writer`),
  CONSTRAINT `FK_comments_user` FOREIGN KEY (`c_writer`) REFERENCES `user` (`u_idx`),
  CONSTRAINT `FK_commnets_writing` FOREIGN KEY (`c_master`) REFERENCES `writing` (`w_no`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- 테이블 데이터 test5.comments:~13 rows (대략적) 내보내기
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`c_time`, `c_group`, `c_order`, `c_depth`, `c_master`, `c_no`, `c_content`, `c_writer`) VALUES
	('2021-09-02 09:43:14', 1, 1, 1, 1, 1, '댓글', 2),
	('2021-09-02 09:47:57', 2, 1, 1, 1, 2, '댓글2', 2),
	('2021-09-03 11:57:02', 1, 5, 2, 1, 33, '1', 25),
	('2021-09-03 11:57:06', 1, 6, 3, 1, 34, '1-1', 25),
	('2021-09-03 11:57:09', 1, 3, 2, 1, 35, '2', 25),
	('2021-09-03 11:57:12', 1, 4, 3, 1, 36, '2-1', 25),
	('2021-09-06 09:52:12', 1, 2, 2, 1, 37, 'ㅎㅎ', 25),
	('2021-09-06 10:04:46', 38, 1, 1, 1, 38, '222', 25),
	('2021-09-06 10:11:17', 39, 1, 1, 1, 39, '555', 25),
	('2021-09-06 10:12:45', 40, 1, 1, 1, 40, '888', 25),
	('2021-09-06 10:13:08', 41, 1, 1, 1, 41, '777', 25),
	('2021-09-06 10:14:00', 42, 1, 1, 1, 42, '7773', 25),
	('2021-09-06 10:18:54', 43, 1, 1, 1, 43, '77756', 25);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

-- 테이블 test5.dcp_auth 구조 내보내기
CREATE TABLE IF NOT EXISTS `dcp_auth` (
  `u_id` varchar(50) NOT NULL DEFAULT '',
  `u_auth` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`u_id`,`u_auth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 test5.dcp_auth:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `dcp_auth` DISABLE KEYS */;
INSERT INTO `dcp_auth` (`u_id`, `u_auth`) VALUES
	('dh', 'ROLE_ADMIN'),
	('dh', 'ROLE_USER'),
	('doh', 'ROLE_ADMIN'),
	('doh', 'ROLE_USER'),
	('sj', 'ROLE_USER');
/*!40000 ALTER TABLE `dcp_auth` ENABLE KEYS */;

-- 테이블 test5.dcp_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `dcp_board` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_title` varchar(50) DEFAULT NULL,
  `b_content` text DEFAULT NULL,
  `b_datetime` datetime DEFAULT current_timestamp(),
  `b_views` int(11) DEFAULT 1,
  `b_group` int(11) DEFAULT NULL,
  `b_order` int(11) DEFAULT 1,
  `b_depth` int(11) DEFAULT 1,
  `b_writer` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- 테이블 데이터 test5.dcp_board:~12 rows (대략적) 내보내기
/*!40000 ALTER TABLE `dcp_board` DISABLE KEYS */;
INSERT INTO `dcp_board` (`b_id`, `b_title`, `b_content`, `b_datetime`, `b_views`, `b_group`, `b_order`, `b_depth`, `b_writer`) VALUES
	(1, 'ihihihihihihi', 'hihihihihihihi', '2021-09-14 10:58:01', 56, 1, 1, 1, '동환'),
	(31, '2-1', '2-1', '2021-09-30 11:03:52', 14, 3, 2, 2, '동환'),
	(33, 'gggggggggg', 'ggggggggggggg', '2021-09-30 11:06:20', 6, 3, 3, 3, '동환'),
	(34, 'ggg', 'ggg', '2021-09-30 11:15:10', 13, 1, 1, 1, '동환'),
	(36, 'ㅎㅎ', 'ㅎㅎ', '2021-10-05 10:22:46', 9, 36, 1, 1, '동환'),
	(39, 'test', 'test', '2021-10-05 11:07:25', 4, 1, 1, 1, '동환'),
	(46, '1004', '1004', '2021-10-06 10:05:02', 34, 46, 1, 1, '동환'),
	(47, '1004-1', '1004-1', '2021-10-06 10:05:13', 8, 46, 3, 2, '동환'),
	(50, 'ㅍㅍㅍ', 'ㅍㅍㅍ', '2021-10-06 10:54:34', 4, 50, 1, 1, '동환'),
	(51, 'ㅓㅓㅓ', 'ㅓㅓㅓㅓ', '2021-10-06 10:58:09', 7, 51, 1, 1, '동환'),
	(52, 'ㅅㅅㅅ', 'ㅅㅅㅅ', '2021-10-06 11:01:25', 6, 52, 1, 1, '동환'),
	(56, 'pizza', 'pizza', '2021-10-06 12:02:12', 17, 56, 1, 1, '동환');
/*!40000 ALTER TABLE `dcp_board` ENABLE KEYS */;

-- 테이블 test5.dcp_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `dcp_comment` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_content` varchar(50) DEFAULT NULL,
  `c_writer` varchar(50) DEFAULT NULL,
  `c_datetime` datetime DEFAULT current_timestamp(),
  `c_group` int(11) DEFAULT NULL,
  `c_depth` int(11) DEFAULT NULL,
  `c_order` int(11) DEFAULT NULL,
  `c_master` int(11) DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `FK_dcp_comment_dcp_board` (`c_master`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- 테이블 데이터 test5.dcp_comment:~15 rows (대략적) 내보내기
/*!40000 ALTER TABLE `dcp_comment` DISABLE KEYS */;
INSERT INTO `dcp_comment` (`c_id`, `c_content`, `c_writer`, `c_datetime`, `c_group`, `c_depth`, `c_order`, `c_master`) VALUES
	(1, '안녕', '동환', '2021-09-30 11:44:33', 1, 1, 1, 1),
	(2, '하이', '동환', '2021-09-30 11:44:58', 2, 1, 1, 1),
	(3, '가가', '동환', '2021-09-30 11:45:21', 3, 1, 1, 3),
	(4, '프프', '동환', '2021-09-30 11:45:47', 4, 1, 1, 4),
	(5, '안녕2', '도형', '2021-10-01 09:31:17', 1, 2, 2, 1),
	(20, 'zzz', '동환', '2021-10-01 11:54:16', 20, 1, 1, 1),
	(21, 'ggg', '동환', '2021-10-01 11:55:37', 21, 1, 1, 1),
	(22, 'sadfasdf', '동환', '2021-10-01 11:56:22', 21, 2, 2, 1),
	(23, 'gggg', '동환', '2021-10-01 11:58:38', 23, 1, 1, 1),
	(24, 'ggg', '동환', '2021-10-01 12:02:29', 24, 1, 1, 1),
	(25, 'hhh', '동환', '2021-10-01 12:02:32', 24, 2, 2, 1),
	(26, 'hhhh', '동환', '2021-10-04 09:20:00', 26, 1, 1, 1),
	(27, 'hhh-1', '동환', '2021-10-04 09:20:12', 26, 2, 2, 1),
	(28, 'fff', '도형', '2021-10-04 09:25:46', 28, 1, 1, 1),
	(29, 'hhhh', '도형', '2021-10-04 09:25:54', 28, 2, 2, 1),
	(30, 'asdfsadf', '도형', '2021-10-04 09:26:34', 30, 1, 1, 1);
/*!40000 ALTER TABLE `dcp_comment` ENABLE KEYS */;

-- 테이블 test5.dcp_fileinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `dcp_fileinfo` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_master` int(11) DEFAULT NULL,
  `f_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- 테이블 데이터 test5.dcp_fileinfo:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `dcp_fileinfo` DISABLE KEYS */;
INSERT INTO `dcp_fileinfo` (`f_id`, `f_master`, `f_name`) VALUES
	(2, 39, 'imgEx.jpg'),
	(9, 46, 'imgEx.jpg'),
	(10, 47, '다운로드.png'),
	(13, 50, '다운로드222.jpg'),
	(14, 51, 'ggg.jpg'),
	(15, 52, 'imgEx.jpg'),
	(20, 56, '피자1.jpg'),
	(21, 56, '피자2.jpg');
/*!40000 ALTER TABLE `dcp_fileinfo` ENABLE KEYS */;

-- 테이블 test5.dcp_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `dcp_user` (
  `u_id` varchar(50) NOT NULL,
  `u_password` varchar(200) DEFAULT NULL,
  `u_name` varchar(50) NOT NULL,
  `u_datetime` datetime DEFAULT current_timestamp(),
  `u_isAccountNonExpired` tinyint(4) DEFAULT NULL,
  `u_isAccountNonLocked` tinyint(4) DEFAULT NULL,
  `u_isCredentialNonExpired` tinyint(4) DEFAULT NULL,
  `u_isEnabled` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 test5.dcp_user:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `dcp_user` DISABLE KEYS */;
INSERT INTO `dcp_user` (`u_id`, `u_password`, `u_name`, `u_datetime`, `u_isAccountNonExpired`, `u_isAccountNonLocked`, `u_isCredentialNonExpired`, `u_isEnabled`) VALUES
	('dh', '$2a$10$U4rnK6z4GprHPMUqIXJKXeArwkWDDD5oIAkIMdF86CZwHFu8stcDO', '동환', '2021-09-24 09:41:50', 1, 1, 1, 1),
	('doh', '$2a$10$0xJQ80EIyCgZ.EForeItZenUMZTtUY9BgQljoXxy9t3QQPUb8/i6G', '도형', '2021-09-24 09:42:18', 1, 1, 1, 1),
	('sj', '$2a$10$qqQv3h/sXfPBuh5pV.KAkO30m7ZBsG0aVrQ83XnAtO32QBwMZEtOm', '세진', '2021-09-24 09:41:39', 1, 1, 1, 1);
/*!40000 ALTER TABLE `dcp_user` ENABLE KEYS */;

-- 테이블 test5.gf_answernum 구조 내보내기
CREATE TABLE IF NOT EXISTS `gf_answernum` (
  `a_no` int(11) NOT NULL AUTO_INCREMENT,
  `a_master` int(11) DEFAULT NULL,
  `a_kind` varchar(50) DEFAULT NULL,
  `a_content` int(11) DEFAULT NULL,
  `a_index` int(11) DEFAULT NULL,
  `a_writer` int(11) DEFAULT NULL,
  PRIMARY KEY (`a_no`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- 테이블 데이터 test5.gf_answernum:~15 rows (대략적) 내보내기
/*!40000 ALTER TABLE `gf_answernum` DISABLE KEYS */;
INSERT INTO `gf_answernum` (`a_no`, `a_master`, `a_kind`, `a_content`, `a_index`, `a_writer`) VALUES
	(46, 84, 'multiplechoice', 110, 2, 3),
	(47, 84, 'checkbox', 113, 3, 3),
	(48, 84, 'checkbox', 114, 3, 3),
	(49, 91, 'multiplechoice', 168, 1, 2),
	(50, 91, 'checkbox', 170, 2, 2),
	(51, 91, 'checkbox', 171, 2, 2),
	(52, 91, 'multiplechoice', 176, 5, 2),
	(53, 91, 'checkbox', 179, 6, 2),
	(54, 91, 'checkbox', 180, 6, 2),
	(55, 91, 'multiplechoice', 169, 1, 3),
	(56, 91, 'checkbox', 171, 2, 3),
	(57, 91, 'multiplechoice', 175, 5, 3),
	(58, 91, 'checkbox', 178, 6, 3),
	(59, 91, 'checkbox', 179, 6, 3),
	(60, 91, 'checkbox', 180, 6, 3);
/*!40000 ALTER TABLE `gf_answernum` ENABLE KEYS */;

-- 테이블 test5.gf_answerstring 구조 내보내기
CREATE TABLE IF NOT EXISTS `gf_answerstring` (
  `a_no` int(11) NOT NULL AUTO_INCREMENT,
  `a_master` int(11) DEFAULT NULL,
  `a_kind` varchar(50) DEFAULT NULL,
  `a_content` varchar(255) DEFAULT NULL,
  `a_index` int(11) DEFAULT NULL,
  `a_writer` int(11) DEFAULT NULL,
  PRIMARY KEY (`a_no`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- 테이블 데이터 test5.gf_answerstring:~10 rows (대략적) 내보내기
/*!40000 ALTER TABLE `gf_answerstring` DISABLE KEYS */;
INSERT INTO `gf_answerstring` (`a_no`, `a_master`, `a_kind`, `a_content`, `a_index`, `a_writer`) VALUES
	(17, 84, 'short', '단답', 0, 3),
	(18, 84, 'long', '장답', 1, 3),
	(19, 76, 'short', 'ㄱㄱ답변', 0, 3),
	(20, 76, 'long', 'ㄹㄹ답변', 1, 3),
	(21, 91, 'short', '단답단답단답', 0, 2),
	(22, 91, 'short', '단답단답단답22', 3, 2),
	(23, 91, 'long', '장답장답장답22', 4, 2),
	(24, 91, 'short', '단1', 0, 3),
	(25, 91, 'short', '단2', 3, 3),
	(26, 91, 'long', '장2', 4, 3);
/*!40000 ALTER TABLE `gf_answerstring` ENABLE KEYS */;

-- 테이블 test5.gf_auth 구조 내보내기
CREATE TABLE IF NOT EXISTS `gf_auth` (
  `u_id` varchar(50) NOT NULL DEFAULT '"',
  `u_auth` varchar(50) NOT NULL DEFAULT '"',
  PRIMARY KEY (`u_id`,`u_auth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 test5.gf_auth:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `gf_auth` DISABLE KEYS */;
INSERT INTO `gf_auth` (`u_id`, `u_auth`) VALUES
	('dh', 'ROLE_ADMIN'),
	('dh', 'ROLE_USER'),
	('gg', 'ROLE_USER');
/*!40000 ALTER TABLE `gf_auth` ENABLE KEYS */;

-- 테이블 test5.gf_example 구조 내보내기
CREATE TABLE IF NOT EXISTS `gf_example` (
  `e_no` int(11) NOT NULL AUTO_INCREMENT,
  `e_content` varchar(50) DEFAULT NULL,
  `e_master` int(11) DEFAULT NULL,
  `e_index` int(11) DEFAULT NULL,
  PRIMARY KEY (`e_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;

-- 테이블 데이터 test5.gf_example:~28 rows (대략적) 내보내기
/*!40000 ALTER TABLE `gf_example` DISABLE KEYS */;
INSERT INTO `gf_example` (`e_no`, `e_content`, `e_master`, `e_index`) VALUES
	(108, NULL, 84, 0),
	(109, NULL, 84, 1),
	(110, '1', 84, 2),
	(111, '2', 84, 2),
	(112, '3', 84, 2),
	(113, '1', 84, 3),
	(114, '2', 84, 3),
	(115, NULL, 85, 0),
	(116, NULL, 85, 1),
	(117, '객보1', 85, 2),
	(118, '체보1', 85, 3),
	(119, '체보2', 85, 3),
	(120, '체보3', 85, 3),
	(166, NULL, 91, 0),
	(167, '객보1', 91, 1),
	(168, '객보2', 91, 1),
	(169, '객보3', 91, 1),
	(170, '체보1', 91, 2),
	(171, '체보2', 91, 2),
	(172, '체보3', 91, 2),
	(173, NULL, 91, 3),
	(174, NULL, 91, 4),
	(175, '객보21', 91, 5),
	(176, '객보22', 91, 5),
	(177, '객보23', 91, 5),
	(178, '체보21', 91, 6),
	(179, '체보22', 91, 6),
	(180, '체보23', 91, 6);
/*!40000 ALTER TABLE `gf_example` ENABLE KEYS */;

-- 테이블 test5.gf_question 구조 내보내기
CREATE TABLE IF NOT EXISTS `gf_question` (
  `q_no` int(11) NOT NULL AUTO_INCREMENT,
  `q_content` varchar(50) DEFAULT NULL,
  `q_kind` varchar(50) DEFAULT NULL,
  `q_master` int(11) DEFAULT NULL,
  `q_index` int(11) DEFAULT NULL,
  PRIMARY KEY (`q_no`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;

-- 테이블 데이터 test5.gf_question:~17 rows (대략적) 내보내기
/*!40000 ALTER TABLE `gf_question` DISABLE KEYS */;
INSERT INTO `gf_question` (`q_no`, `q_content`, `q_kind`, `q_master`, `q_index`) VALUES
	(95, 'ㄱㄱㄱㄱ', 'short', 76, 0),
	(96, 'ㄹㄹㄹㄹ', 'long', 76, 1),
	(122, '질문1', 'short', 84, 0),
	(123, '질문2', 'long', 84, 1),
	(124, '질문3', 'multiplechoice', 84, 2),
	(125, '질문4', 'checkbox', 84, 3),
	(126, '단', 'short', 85, 0),
	(127, '장', 'long', 85, 1),
	(128, '객', 'multiplechoice', 85, 2),
	(129, '체', 'checkbox', 85, 3),
	(157, '단질', 'short', 91, 0),
	(158, '객질', 'multiplechoice', 91, 1),
	(159, '체질', 'checkbox', 91, 2),
	(160, '단질22', 'short', 91, 3),
	(161, '장질', 'long', 91, 4),
	(162, '객질2', 'multiplechoice', 91, 5),
	(163, '체질2', 'checkbox', 91, 6);
/*!40000 ALTER TABLE `gf_question` ENABLE KEYS */;

-- 테이블 test5.gf_survey 구조 내보내기
CREATE TABLE IF NOT EXISTS `gf_survey` (
  `s_no` int(11) NOT NULL AUTO_INCREMENT,
  `s_title` varchar(50) DEFAULT NULL,
  `s_master` int(11) DEFAULT NULL,
  `s_datetime` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`s_no`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- 테이블 데이터 test5.gf_survey:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `gf_survey` DISABLE KEYS */;
INSERT INTO `gf_survey` (`s_no`, `s_title`, `s_master`, `s_datetime`) VALUES
	(76, 'ㄱㄱㄱㄱㄱ', 3, '2021-10-20 11:06:21'),
	(84, '제목1', 3, '2021-10-21 11:02:22'),
	(85, '지지의 설문', 2, '2021-10-21 11:26:59'),
	(91, '제목', 3, '2021-10-22 11:13:54');
/*!40000 ALTER TABLE `gf_survey` ENABLE KEYS */;

-- 테이블 test5.gf_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `gf_user` (
  `u_no` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(50) DEFAULT NULL,
  `u_password` varchar(200) DEFAULT NULL,
  `u_name` varchar(50) DEFAULT NULL,
  `u_isAccountNonExpired` tinyint(4) DEFAULT NULL,
  `u_isAccountNonLocked` tinyint(4) DEFAULT NULL,
  `u_isCredentialNonExpired` tinyint(4) DEFAULT NULL,
  `u_isEnabled` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`u_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 테이블 데이터 test5.gf_user:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `gf_user` DISABLE KEYS */;
INSERT INTO `gf_user` (`u_no`, `u_id`, `u_password`, `u_name`, `u_isAccountNonExpired`, `u_isAccountNonLocked`, `u_isCredentialNonExpired`, `u_isEnabled`) VALUES
	(2, 'gg', '$2a$10$1ZKhzt1.rrg1GmnT3Ehap./0pIRtVlUxvf6/8/dBA8YuLjTvZAmqq', '지지', 1, 1, 1, 1),
	(3, 'dh', '$2a$10$uaYO.ltkfOJeE9Bsf4qMm.GTHosurWqm2zCKi26N4Phk6B.TbDCOa', '동환', 1, 1, 1, 1);
/*!40000 ALTER TABLE `gf_user` ENABLE KEYS */;

-- 테이블 test5.spring_session 구조 내보내기
CREATE TABLE IF NOT EXISTS `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 test5.spring_session:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
INSERT INTO `spring_session` (`PRIMARY_ID`, `SESSION_ID`, `CREATION_TIME`, `LAST_ACCESS_TIME`, `MAX_INACTIVE_INTERVAL`, `EXPIRY_TIME`, `PRINCIPAL_NAME`) VALUES
	('b63d4d04-c988-42a4-abbb-edbaabdda040', 'ae6f7f30-f12a-4bc9-9e7c-428cf2e2e14c', 1635379525204, 1635380093000, 7200, 1635387293000, 'dh');
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;

-- 테이블 test5.spring_session_attributes 구조 내보내기
CREATE TABLE IF NOT EXISTS `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 test5.spring_session_attributes:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
INSERT INTO `spring_session_attributes` (`SESSION_PRIMARY_ID`, `ATTRIBUTE_NAME`, `ATTRIBUTE_BYTES`) VALUES
	('b63d4d04-c988-42a4-abbb-edbaabdda040', 'SPRING_SECURITY_CONTEXT', _binary 0xACED00057372003D6F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E636F6E746578742E5365637572697479436F6E74657874496D706C00000000000002260200014C000E61757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B78707372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000002260200024C000B63726564656E7469616C737400124C6A6176612F6C616E672F4F626A6563743B4C00097072696E636970616C71007E0004787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C7371007E0004787001737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00067870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000002770400000002737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000002260200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000A524F4C455F41444D494E7371007E000E740009524F4C455F555345527871007E000D737200486F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E61757468656E7469636174696F6E2E57656241757468656E7469636174696F6E44657461696C7300000000000002260200024C000D72656D6F74654164647265737371007E000F4C000973657373696F6E496471007E000F787074000F303A303A303A303A303A303A303A3174002464333437613038652D363936322D346363632D393463372D343237333365316630613037707372001A636F6D2E67662E6578616D706C652E646F6D61696E2E5573657200000000000000010200095A001369734163636F756E744E6F6E457870697265645A001269734163636F756E744E6F6E4C6F636B65645A0017697343726564656E7469616C734E6F6E457870697265645A00096973456E61626C6564490003754E6F4C000B617574686F72697469657371007E00064C000870617373776F726471007E000F4C0005754E616D6571007E000F4C0008757365726E616D6571007E000F787001010101000000037371007E000C0000000277040000000271007E001071007E00127874003C243261243130247561594F2E6C746B664F4A65453942736634714D6D2E4754486F73757257716D327A434B6932364E3450686B36422E546244434F61740006EB8F99ED99987400026468);
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;

-- 테이블 test5.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `u_idx` int(10) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(255) NOT NULL,
  `u_pw` varchar(255) NOT NULL,
  `u_name` varchar(255) NOT NULL DEFAULT '0',
  `u_tel` varchar(255) NOT NULL,
  `u_age` int(10) NOT NULL,
  `u_role` tinyint(4) NOT NULL,
  PRIMARY KEY (`u_idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- 테이블 데이터 test5.user:~20 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`u_idx`, `u_id`, `u_pw`, `u_name`, `u_tel`, `u_age`, `u_role`) VALUES
	(2, 'fdaf', '74894', '김모씨', '010-8888-7777', 40, 1),
	(3, 'b', '222', '이모씨', '010-2222-2222', 37, 1),
	(5, 'dfdf', '545', '홍길동', '010-2898-4767', 44, 1),
	(6, 'a1234', 'bbbb', '만세', '010-8787-7978', 70, 1),
	(7, 'baba', 'cfdfd', '바비', '010-8787-1111', 56, 1),
	(8, 'wew', 'qqqq', '박찬호', '010-7777-3232', 23, 1),
	(9, 'ㅇㄻㄹ', 'ㄹㅇㅁㄴㄱ', 'rarar', '010-4444-7777', 78, 1),
	(10, 'a1', '5555', '강호동', '090-4343-4444', 32, 1),
	(11, 'b1', '1111', '박길동', '090-4444-6666', 61, 1),
	(12, 'bb1', '2222', '고길동', '090-4444-6666', 61, 1),
	(13, 'cc3', 'c1c1', '최길동', '090-1111-3333', 74, 1),
	(14, 'asdf', '1234', 'dsadf', '123-4213-124', 12, 1),
	(15, 'ㄻㄴㅇ', '94949', '7989', '053-123-4567', 45, 1),
	(16, 'fasdf', 'fdafff', '4444', '4464-4949', 777, 1),
	(21, '1', '1234', '1', '1-1-1', 132, 1),
	(22, 'fff', 'fff', 'fff', '123-123-123', 123, 1),
	(23, 'ggg', 'ggg', 'ggg', '123-123-123', 123, 1),
	(24, 'ffffff', 'ffffffffff', 'fffff', '123-123-123', 456, 1),
	(25, 'sejin', 'sejin', '박세진', '010-1111-1111', 24, 10),
	(26, 'ㅎㅎㅎ', 'ㅎㅎㅎ', 'ㅎㅎㅎ', '010-1111-2222', 23, 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- 테이블 test5.writing 구조 내보내기
CREATE TABLE IF NOT EXISTS `writing` (
  `w_no` int(10) NOT NULL AUTO_INCREMENT,
  `w_title` varchar(255) NOT NULL,
  `w_content` varchar(2048) NOT NULL,
  `w_time` datetime NOT NULL DEFAULT current_timestamp(),
  `w_writer` int(11) NOT NULL,
  `w_views` int(10) NOT NULL DEFAULT 1,
  `w_group` int(10) NOT NULL,
  `w_order` int(10) NOT NULL,
  `w_depth` int(10) NOT NULL,
  PRIMARY KEY (`w_no`),
  KEY `FK_writing_user` (`w_writer`),
  CONSTRAINT `FK_writing_user` FOREIGN KEY (`w_writer`) REFERENCES `user` (`u_idx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- 테이블 데이터 test5.writing:~32 rows (대략적) 내보내기
/*!40000 ALTER TABLE `writing` DISABLE KEYS */;
INSERT INTO `writing` (`w_no`, `w_title`, `w_content`, `w_time`, `w_writer`, `w_views`, `w_group`, `w_order`, `w_depth`) VALUES
	(1, '모든 날 모든 순간', '모든 날 모든 순간 함께 해', '2021-08-10 14:30:55', 2, 197, 1, 1, 1),
	(2, '소주한잔', '여보세요 나야 거기 잘 지내니', '2021-08-10 14:31:45', 2, 14, 2, 1, 1),
	(3, '가시', '가시 가되어 제발 가라고', '2021-08-10 14:33:51', 2, 4, 3, 1, 1),
	(19, '너에게난나에게넌', '해질녘노을처럼', '2021-08-18 13:13:50', 2, 5, 19, 1, 1),
	(85, '1', '1', '2021-08-24 11:01:49', 2, 1, 85, 1, 1),
	(86, '1-1', '1-1', '2021-08-24 11:02:01', 2, 1, 85, 4, 2),
	(87, '1-1-1', '1-1-1', '2021-08-24 11:02:14', 2, 3, 85, 7, 3),
	(88, '1-1-2', '1-1-2', '2021-08-24 11:02:30', 2, 2, 85, 6, 3),
	(89, '1-2', '1-2', '2021-08-24 11:02:51', 2, 1, 85, 2, 2),
	(90, '1-2-1', '1-2-1', '2021-08-24 11:04:05', 2, 1, 85, 3, 3),
	(91, '1-1-3', '1-1-3', '2021-08-24 11:08:11', 2, 1, 85, 5, 3),
	(92, 'ㄱ', 'ㄱ', '2021-08-26 11:09:42', 2, 1, 92, 1, 1),
	(93, 'ㄴ', 'ㄴ', '2021-08-26 11:09:46', 2, 1, 93, 1, 1),
	(94, 'ㄷ', 'ㄷ', '2021-08-26 11:09:52', 2, 1, 94, 1, 1),
	(95, 'ㄹ', 'ㄹ', '2021-08-26 11:09:56', 2, 1, 95, 1, 1),
	(96, 'ㅁ', 'ㅁ', '2021-08-26 11:10:01', 2, 1, 96, 1, 1),
	(97, 'ㅂ', 'ㅂ', '2021-08-26 11:10:05', 2, 1, 97, 1, 1),
	(98, 'ㅅ', 'ㅅ', '2021-08-26 11:10:10', 2, 1, 98, 1, 1),
	(99, 'ㅇ', 'ㅇ', '2021-08-26 11:10:15', 2, 1, 99, 1, 1),
	(100, 'ㅈ', 'ㅈ', '2021-08-26 11:10:20', 2, 1, 100, 1, 1),
	(101, 'ㅊ', 'ㅊ', '2021-08-26 11:10:24', 2, 1, 101, 1, 1),
	(102, 'ㅋ', 'ㅋ', '2021-08-26 11:10:28', 2, 1, 102, 1, 1),
	(103, 'ㅌ', 'ㅌ', '2021-08-26 11:10:32', 2, 1, 103, 1, 1),
	(104, 'ㅍ', 'ㅍ', '2021-08-26 11:10:37', 2, 1, 104, 1, 1),
	(105, 'ㅎ', 'ㅎ', '2021-08-26 11:10:41', 2, 1, 105, 1, 1),
	(106, 'ㄲ', 'ㄲ', '2021-08-26 11:10:45', 2, 3, 106, 1, 1),
	(107, 'ㄸ', 'ㄸ', '2021-08-26 11:10:52', 2, 4, 107, 1, 1),
	(108, '내일', '내일', '2021-08-30 11:52:17', 25, 3, 108, 1, 1),
	(109, '내일', '내일', '2021-08-30 11:54:27', 25, 4, 109, 1, 1),
	(110, 'ff', 'ff', '2021-08-30 11:56:51', 25, 16, 110, 1, 1),
	(118, 'bbb', 'bbb', '2021-09-03 10:40:55', 25, 1, 110, 3, 2),
	(119, 'gggggggg', 'gggggggggg', '2021-09-03 11:52:42', 25, 1, 107, 1, 2),
	(120, 'ggg', 'ggg', '2021-09-03 11:52:57', 25, 3, 110, 1, 2);
/*!40000 ALTER TABLE `writing` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
