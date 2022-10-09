-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2022 at 04:19 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `leaderboard` ()  NO SQL
select q.quizname,s.score,s.totalscore,st.name from score s,student st,quiz q where s.mail=st.mail and q.quizid=s.quizid order by score DESC$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `qs` varchar(200) NOT NULL,
  `op1` varchar(30) NOT NULL,
  `op2` varchar(30) NOT NULL,
  `op3` varchar(30) NOT NULL,
  `answer` varchar(30) NOT NULL,
  `quizid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`qs`, `op1`, `op2`, `op3`, `answer`, `quizid`) VALUES
('	 Which command is used to sort the lines of data in a file in reverse order', 'sort', 'sh', 'st', 'sort -r', 10),
(' In which of the following formats data is stored in the database management system?', 'image', 'text', 'graph', 'table', 9),
(' Which of the following command is used to go to home directory?', ' cd..', 'cd/', 'cd HOME', 'cd', 10),
('Following is the utility program to perform complex mathematical computation.', 'expr', 'cal', 'calci', 'bc', 10),
('Mount point for templorary removable devices is ___', '/', '/dev', '/tmp', ' /mnt', 10),
('The chmod ugo+rw note command can be represented in octal notation as', 'chmod 444 note', ' chmod 555 note', 'chmod 333 note', ' chmod 666 note', 10),
('What is the full form of DBMS?', 'Data of Binary Management Syst', 'Database Management Service', 'Data Backup Management System', 'Database Management System', 9),
('Which command can be used to find a word from a text file?', 'cut', 'sort', 'find', 'grep', 10),
('Which command is used to count just the number of characters in a file?', 'wc - 1', 'wc -c', ' wc -w', 'wc -c', 10),
('Which command is used to remove a file?', 'remove', 'mv ', 'delete', 'rm', 10),
('Which command is used with vi editor to save file and remain in the editing mode?', ':x', ' q!', ':q', ':w', 10),
('Which symbol will be used with grep command to match the pattern pat at the beginning of a line?', 'pat^', '$pat', 'pat$', '^pat', 10),
('Which type of data can be stored in the database?', 'Image oriented data', 'Text, files containing data', ' Data in the form of audio or ', 'All of the above', 9);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `quizid` int(11) NOT NULL,
  `quizname` varchar(20) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `mail` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`quizid`, `quizname`, `date_created`, `mail`) VALUES
(9, 'dbms', '2022-01-08 10:36:59', 'surya@gmail.com'),
(10, 'unix', '2022-01-08 10:48:51', 'saikarthik@gmail.com');

--
-- Triggers `quiz`
--
DELIMITER $$
CREATE TRIGGER `ondeleteqs` AFTER DELETE ON `quiz` FOR EACH ROW delete from questions where questions.quizid=old.quizid
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE `score` (
  `slno` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `quizid` int(11) NOT NULL,
  `mail` varchar(30) DEFAULT NULL,
  `totalscore` int(11) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`slno`, `score`, `quizid`, `mail`, `totalscore`, `remark`) VALUES
(43, 7, 10, 'shreesha@gmail.com', 10, 'average'),
(47, 5, 10, 'shreesha@gmail.com', 10, 'average'),
(48, 2, 9, 'shreesha@gmail.com', 3, 'bad');

--
-- Triggers `score`
--
DELIMITER $$
CREATE TRIGGER `remarks` BEFORE INSERT ON `score` FOR EACH ROW BEGIN
  IF NEW.score between 1 and 3        THEN
        SET NEW.remark = 'bad';
  ELSEIF NEW.score between 4 and 7    THEN
        SET NEW.remark = 'average';
  ELSEIF NEW.score between 8 and 10    THEN
       SET NEW.remark = 'good';
               
           END IF;
       END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffid` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `phno` varchar(10) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `DOB` varchar(10) NOT NULL,
  `pw` varchar(200) NOT NULL,
  `dept` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffid`, `name`, `mail`, `phno`, `gender`, `DOB`, `pw`, `dept`) VALUES
('1', 'PRAJNESH N', 'prajnesh6535@gmail.com', '8217423798', 'M', '2001-05-31', 'raGRZ0.YJpv5Y', 'CSE'),
('3', 'saikarthik', 'saikarthik@gmail.com', '9690606904', 'M', '2002-01-08', 'raGRZ0.YJpv5Y', 'CSE'),
('2', 'suryashekahr', 'surya@gmail.com', '9595768456', 'M', '2002-05-08', 'raGRZ0.YJpv5Y', 'CSE'),
('5', 'xyz', 'xyz@gamil.com', '9384458945', 'M', '2001-06-08', 'raGRZ0.YJpv5Y', 'ECE');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `usn` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `phno` varchar(10) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `DOB` varchar(10) NOT NULL,
  `pw` varchar(200) NOT NULL,
  `dept` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`usn`, `name`, `mail`, `phno`, `gender`, `DOB`, `pw`, `dept`) VALUES
('4kv19ec060', 'gagan', 'gagan@gmail.com', '955848394', 'M', '2001-01-18', 'raGRZ0.YJpv5Y', 'ECE'),
('4kv19cs048', 'Nagayasha V R', 'nagayashas@gmail.com', '845195995', 'M', '2001-05-15', 'raGRZ0.YJpv5Y', 'CSE'),
('4kv19cs075', 'shreesha', 'shreesha@gmail.com', '8765495678', 'M', '2001-05-24', 'raGRZ0.YJpv5Y', 'CSE'),
('4kv19cs034', 'subhash', 'subashgowda@gmail.com', '973563663', 'M', '2022-02-09', 'rad6nIdXSwmMM', 'CSE'),
('4kv19cs079', 'suhas', 'suhasat@gmail.com', '8457356789', 'M', '2001-05-08', 'raGRZ0.YJpv5Y', 'CSE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD UNIQUE KEY `qs` (`qs`),
  ADD KEY `quizid` (`quizid`),
  ADD KEY `quizid_2` (`quizid`),
  ADD KEY `quizid_3` (`quizid`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`quizid`),
  ADD KEY `mail` (`mail`);

--
-- Indexes for table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`slno`),
  ADD KEY `quizid` (`quizid`),
  ADD KEY `mail` (`mail`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`mail`),
  ADD UNIQUE KEY `mail` (`mail`,`phno`),
  ADD UNIQUE KEY `staffid` (`staffid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`mail`),
  ADD UNIQUE KEY `mail` (`mail`),
  ADD UNIQUE KEY `phno` (`phno`),
  ADD UNIQUE KEY `usn` (`usn`),
  ADD KEY `dept` (`dept`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `quizid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `score`
--
ALTER TABLE `score`
  MODIFY `slno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`mail`) REFERENCES `staff` (`mail`) ON DELETE CASCADE;

--
-- Constraints for table `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `score_ibfk_1` FOREIGN KEY (`quizid`) REFERENCES `quiz` (`quizid`) ON DELETE CASCADE,
  ADD CONSTRAINT `score_ibfk_2` FOREIGN KEY (`mail`) REFERENCES `student` (`mail`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
