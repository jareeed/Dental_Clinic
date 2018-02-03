-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 23, 2017 at 10:40 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `patientdb`
--
CREATE DATABASE IF NOT EXISTS `patientdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `patientdb`;

-- --------------------------------------------------------

--
-- Table structure for table `tblappointment`
--

CREATE TABLE IF NOT EXISTS `tblappointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(50) NOT NULL,
  `fullname` varchar(250) NOT NULL,
  `did` int(11) NOT NULL,
  `adate` date NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `tblappointment`
--

INSERT INTO `tblappointment` (`id`, `pid`, `fullname`, `did`, `adate`, `status`) VALUES
(5, '645336', '', 3, '2017-04-18', 'Done'),
(6, '734436', '', 3, '2017-04-14', 'Done'),
(7, '541714', '', 2, '2017-05-13', 'Pending'),
(8, '734436', '', 2, '2017-04-15', 'Done'),
(9, '645336', '', 3, '2017-04-14', 'Pending'),
(10, '753513', '', 2, '2017-04-14', 'Pending'),
(11, '753513', '', 2, '2017-04-15', 'Done'),
(12, '645336', '', 2, '2017-04-15', 'Done'),
(13, '541714', '', 3, '2017-04-15', 'Done'),
(14, '541714', '', 2, '2017-04-17', 'Done'),
(15, '645336', '', 2, '2017-04-17', 'Pending'),
(16, '770760', '', 4, '2017-04-17', 'Pending'),
(17, '676538', '', 3, '2017-04-18', 'Done'),
(18, '541714', '', 3, '2017-04-19', 'Done'),
(19, '430753', '', 3, '2017-04-19', 'Done');

-- --------------------------------------------------------

--
-- Table structure for table `tblattachment`
--

CREATE TABLE IF NOT EXISTS `tblattachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refid` varchar(50) NOT NULL,
  `patientid` varchar(50) NOT NULL,
  `doctorid` varchar(50) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `pix` longblob NOT NULL,
  `date` date NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblcomplaints`
--

CREATE TABLE IF NOT EXISTS `tblcomplaints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refid` varchar(50) NOT NULL,
  `patientid` varchar(50) NOT NULL,
  `doctorid` varchar(50) NOT NULL,
  `rdate` date NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tblcomplaints`
--

INSERT INTO `tblcomplaints` (`id`, `refid`, `patientid`, `doctorid`, `rdate`, `user`) VALUES
(1, '916199', '541714', '3', '2017-04-17', 'admin'),
(2, '133304', '645336', '3', '2017-04-18', 'admin'),
(3, '237065', '676538', '3', '2017-04-18', 'admin'),
(4, '880500', '430753', '3', '2017-04-19', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbldoctor`
--

CREATE TABLE IF NOT EXISTS `tbldoctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tbldoctor`
--

INSERT INTO `tbldoctor` (`id`, `doctor`) VALUES
(2, 'DR. JOEMEL E. RESARE'),
(3, 'DR. YAN SANDY EDERA'),
(4, 'DR. JOSE P. RIZAL');

-- --------------------------------------------------------

--
-- Table structure for table `tblfees`
--

CREATE TABLE IF NOT EXISTS `tblfees` (
  `did` int(11) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblfees`
--

INSERT INTO `tblfees` (`did`, `amount`) VALUES
(2, 400),
(3, 400),
(4, 450);

-- --------------------------------------------------------

--
-- Table structure for table `tblpatient`
--

CREATE TABLE IF NOT EXISTS `tblpatient` (
  `patientid` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mi` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `telno` varchar(50) NOT NULL,
  `bdate` date NOT NULL,
  `age` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `allergies` text NOT NULL,
  `refferedby` varchar(100) NOT NULL,
  `datereg` date NOT NULL,
  PRIMARY KEY (`patientid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpatient`
--

INSERT INTO `tblpatient` (`patientid`, `lname`, `fname`, `mi`, `address`, `telno`, `bdate`, `age`, `gender`, `status`, `allergies`, `refferedby`, `datereg`) VALUES
('430753', 'ABRIS', 'NATHANIEL', 'S', 'NAVALCA, SURIGAO CITY', '09191234598', '1988-01-20', '29', 'MALE', 'SINGLE', 'N/A', 'MERRYFIL ADOLFO', '2017-04-19'),
('541714', 'RESARE', 'JOANNE', 'G', 'P2 CAYUTAN, BRGY CAGNIOG, SURIGAO CITY', '', '1989-03-14', '28', 'FEMALE', 'MARRIED', '', '', '2017-04-11'),
('645336', 'REYES', 'FELECHITO', 'R', 'NARCISO, ST., SURIGAO CITY', '', '1982-09-08', '34', 'MALE', 'MARRIED', '', '', '2017-04-14'),
('676538', 'BOJOCAN', 'JUNELL', 'T', 'TONDO, SURIGAO CITY', '0919693746', '1988-06-24', '28', 'MALE', 'MARRIED', 'NONE', 'NONE', '2017-04-18'),
('734436', 'APARRE', 'MATT WILLIAM', 'R', 'P2 CAYUTAN, BRGY. CAGNIOG, SURIGAO CITY', 'N/A', '2001-09-28', '15', 'MALE', 'SINGLE', '', '', '2017-04-11'),
('753513', 'SENORIO', 'MYRNALIN', 'R', 'P2 CAYUTAN, BRGY. CAGNIOG, SURIGAO CITY', '', '1976-09-09', '40', 'FEMALE', 'SINGLE', '', '', '2017-04-11'),
('770760', 'RESARE', 'JOEMEL', 'E', 'P2 CAYUTAN, BRGY. CAGNIOG, SURIGAO CITY', 'N/A', '1980-06-24', '36', 'MALE', 'MARRIED', 'N/A', 'VJ SENORIO', '2017-04-11');

-- --------------------------------------------------------

--
-- Table structure for table `tblpayment`
--

CREATE TABLE IF NOT EXISTS `tblpayment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refid` int(11) NOT NULL,
  `patientid` varchar(50) NOT NULL,
  `doctorid` varchar(50) NOT NULL,
  `remarks` text NOT NULL,
  `charge` double NOT NULL,
  `additional` double NOT NULL,
  `discount` double NOT NULL,
  `total` double NOT NULL,
  `pay` double NOT NULL,
  `pdate` date NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `tblpayment`
--

INSERT INTO `tblpayment` (`id`, `refid`, `patientid`, `doctorid`, `remarks`, `charge`, `additional`, `discount`, `total`, `pay`, `pdate`, `user`) VALUES
(1, 6, '734436', '3', '', 400, 0, 0, 400, 400, '2017-04-14', ''),
(2, 8, '734436', '2', '', 400, 0, 0, 400, 400, '2017-04-15', ''),
(3, 11, '753513', '2', 'Add. charge 700 for injection of anti gout', 400, 700, 0, 1100, 1100, '2017-04-15', 'admin'),
(4, 13, '541714', '3', '', 400, 0, 0, 400, 400, '2017-04-15', 'admin'),
(5, 12, '645336', '2', 'Add. Charges - 2000 for injection', 400, 2000, 0, 2400, 2500, '2017-04-15', 'admin'),
(6, 14, '541714', '2', '', 400, 0, 0, 400, 400, '2017-04-17', 'admin'),
(7, 5, '645336', '3', '', 400, 350, 200, 550, 600, '2017-04-18', 'admin'),
(8, 17, '676538', '3', '', 400, 0, 0, 400, 500, '2017-04-18', 'admin'),
(9, 18, '541714', '3', '', 400, 0, 0, 400, 500, '2017-04-19', 'admin'),
(10, 19, '430753', '3', '', 400, 1000, 0, 1400, 1500, '2017-04-19', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbltreatment`
--

CREATE TABLE IF NOT EXISTS `tbltreatment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refid` varchar(50) NOT NULL,
  `patientid` varchar(50) NOT NULL,
  `doctorid` varchar(50) NOT NULL,
  `complaints` text NOT NULL,
  `treatment` text NOT NULL,
  `date` date NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tbltreatment`
--

INSERT INTO `tbltreatment` (`id`, `refid`, `patientid`, `doctorid`, `complaints`, `treatment`, `date`, `user`) VALUES
(1, '916199', '541714', '3', 'Sample data for Treatment', 'Sample data for complaints/ Findings', '2017-04-18', 'admin'),
(3, '133304', '645336', '3', 'Sample Treatment', 'Sample Complaints/ Findings', '2017-04-18', 'admin'),
(4, '237065', '676538', '3', 'Sample Treatment', 'Sample Complaints/ Findings', '2017-04-18', 'admin'),
(5, '880500', '430753', '3', 'Sample Data', 'Sample Data', '2017-04-19', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE IF NOT EXISTS `tbluser` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  `cdate` date NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`username`, `password`, `name`, `cdate`, `status`) VALUES
('admin', '1234', 'Joemel E. Resare', '2017-04-15', 'True');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwappointment`
--
CREATE TABLE IF NOT EXISTS `vwappointment` (
`id` int(11)
,`pid` varchar(50)
,`fullname` varchar(153)
,`adate` date
,`status` varchar(50)
,`doctorid` int(11)
,`doctorname` varchar(150)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vwcomplaints`
--
CREATE TABLE IF NOT EXISTS `vwcomplaints` (
`id` int(11)
,`refid` varchar(50)
,`patientid` varchar(50)
,`fullname` varchar(153)
,`doctorid` varchar(50)
,`doctor` varchar(150)
,`rdate` date
,`user` varchar(50)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vwfees`
--
CREATE TABLE IF NOT EXISTS `vwfees` (
`did` int(11)
,`doctor` varchar(150)
,`amount` double
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vwpatient`
--
CREATE TABLE IF NOT EXISTS `vwpatient` (
`patientid` varchar(50)
,`fullname` varchar(153)
,`address` text
,`telno` varchar(50)
,`bdate` date
,`age` varchar(50)
,`STATUS` varchar(50)
,`GENDER` varchar(50)
,`allergies` text
,`refferedby` varchar(100)
,`datereg` date
,`lname` varchar(50)
,`fname` varchar(50)
,`mi` varchar(50)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vwpayment`
--
CREATE TABLE IF NOT EXISTS `vwpayment` (
`id` int(11)
,`refid` int(11)
,`patientid` varchar(50)
,`fullname` varchar(153)
,`doctorid` varchar(50)
,`doctor` varchar(150)
,`remarks` text
,`charge` double
,`additional` double
,`discount` double
,`total` double
,`pay` double
,`pdate` date
,`user` varchar(50)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vwtreatment`
--
CREATE TABLE IF NOT EXISTS `vwtreatment` (
`id` int(11)
,`refid` varchar(50)
,`patientid` varchar(50)
,`fullname` varchar(153)
,`doctorid` varchar(50)
,`doctor` varchar(150)
,`complaints` text
,`treatment` text
,`noofattachment` bigint(21)
,`date` date
,`user` varchar(50)
);
-- --------------------------------------------------------

--
-- Structure for view `vwappointment`
--
DROP TABLE IF EXISTS `vwappointment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwappointment` AS select `a`.`id` AS `id`,`a`.`pid` AS `pid`,concat(`p`.`lname`,', ',`p`.`fname`,' ',`p`.`mi`) AS `fullname`,`a`.`adate` AS `adate`,`a`.`status` AS `status`,`a`.`did` AS `doctorid`,`d`.`doctor` AS `doctorname` from ((`tblappointment` `a` join `tblpatient` `p` on((`a`.`pid` = `p`.`patientid`))) join `tbldoctor` `d` on((`d`.`id` = `a`.`did`)));

-- --------------------------------------------------------

--
-- Structure for view `vwcomplaints`
--
DROP TABLE IF EXISTS `vwcomplaints`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwcomplaints` AS select `c`.`id` AS `id`,`c`.`refid` AS `refid`,`c`.`patientid` AS `patientid`,concat(`p`.`lname`,', ',`p`.`fname`,' ',`p`.`mi`) AS `fullname`,`c`.`doctorid` AS `doctorid`,`d`.`doctor` AS `doctor`,`c`.`rdate` AS `rdate`,`c`.`user` AS `user` from ((`tblcomplaints` `c` join `tblpatient` `p` on((`c`.`patientid` = `p`.`patientid`))) join `tbldoctor` `d` on((`c`.`doctorid` = `d`.`id`)));

-- --------------------------------------------------------

--
-- Structure for view `vwfees`
--
DROP TABLE IF EXISTS `vwfees`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwfees` AS select `f`.`did` AS `did`,`d`.`doctor` AS `doctor`,`f`.`amount` AS `amount` from (`tblfees` `f` join `tbldoctor` `d` on((`f`.`did` = `d`.`id`)));

-- --------------------------------------------------------

--
-- Structure for view `vwpatient`
--
DROP TABLE IF EXISTS `vwpatient`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwpatient` AS select `tblpatient`.`patientid` AS `patientid`,concat(`tblpatient`.`lname`,', ',`tblpatient`.`fname`,' ',`tblpatient`.`mi`) AS `fullname`,`tblpatient`.`address` AS `address`,`tblpatient`.`telno` AS `telno`,`tblpatient`.`bdate` AS `bdate`,`tblpatient`.`age` AS `age`,`tblpatient`.`status` AS `STATUS`,`tblpatient`.`gender` AS `GENDER`,`tblpatient`.`allergies` AS `allergies`,`tblpatient`.`refferedby` AS `refferedby`,`tblpatient`.`datereg` AS `datereg`,`tblpatient`.`lname` AS `lname`,`tblpatient`.`fname` AS `fname`,`tblpatient`.`mi` AS `mi` from `tblpatient`;

-- --------------------------------------------------------

--
-- Structure for view `vwpayment`
--
DROP TABLE IF EXISTS `vwpayment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwpayment` AS select `p`.`id` AS `id`,`p`.`refid` AS `refid`,`p`.`patientid` AS `patientid`,concat(`pp`.`lname`,', ',`pp`.`fname`,' ',`pp`.`mi`) AS `fullname`,`p`.`doctorid` AS `doctorid`,`d`.`doctor` AS `doctor`,`p`.`remarks` AS `remarks`,`p`.`charge` AS `charge`,`p`.`additional` AS `additional`,`p`.`discount` AS `discount`,`p`.`total` AS `total`,`p`.`pay` AS `pay`,`p`.`pdate` AS `pdate`,`p`.`user` AS `user` from ((`tblpayment` `p` join `tblpatient` `pp` on((`p`.`patientid` = `pp`.`patientid`))) join `tbldoctor` `d` on((`p`.`doctorid` = `d`.`id`)));

-- --------------------------------------------------------

--
-- Structure for view `vwtreatment`
--
DROP TABLE IF EXISTS `vwtreatment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwtreatment` AS select `t`.`id` AS `id`,`t`.`refid` AS `refid`,`t`.`patientid` AS `patientid`,concat(`p`.`lname`,', ',`p`.`fname`,' ',`p`.`mi`) AS `fullname`,`t`.`doctorid` AS `doctorid`,`d`.`doctor` AS `doctor`,`t`.`complaints` AS `complaints`,`t`.`treatment` AS `treatment`,(select count(`tblattachment`.`refid`) AS `countrefid` from `tblattachment` where (`tblattachment`.`refid` = `t`.`refid`)) AS `noofattachment`,`t`.`date` AS `date`,`t`.`user` AS `user` from ((`tbltreatment` `t` join `tblpatient` `p` on((`t`.`patientid` = `p`.`patientid`))) join `tbldoctor` `d` on((`d`.`id` = `t`.`doctorid`)));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
