-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2023 at 09:03 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `quiz_id` int(30) NOT NULL,
  `question_id` int(30) NOT NULL,
  `option_id` int(30) NOT NULL,
  `is_right` tinyint(1) NOT NULL COMMENT ' 1 = right, 0 = wrong',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `user_id`, `quiz_id`, `question_id`, `option_id`, `is_right`, `date_updated`) VALUES
(7, 13, 2, 4, 32, 1, '2023-04-05 20:19:04'),
(8, 13, 2, 5, 40, 0, '2023-04-05 20:19:04'),
(9, 14, 2, 4, 41, 1, '2023-04-05 22:24:05'),
(10, 14, 2, 5, 47, 1, '2023-04-05 22:24:05'),
(11, 14, 2, 6, 52, 0, '2023-04-05 22:24:05'),
(12, 16, 3, 7, 55, 0, '2023-04-05 23:07:14'),
(13, 16, 3, 9, 64, 0, '2023-04-05 23:07:14'),
(14, 14, 3, 7, 75, 1, '2023-04-05 23:32:45'),
(15, 14, 3, 9, 80, 1, '2023-04-05 23:32:45');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `user_id`, `subject`, `date_updated`) VALUES
(2, 6, 'IWP', '2023-04-05 22:34:37');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(30) NOT NULL,
  `quiz_id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `score` int(5) NOT NULL,
  `total_score` int(5) NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `quiz_id`, `user_id`, `score`, `total_score`, `date_updated`) VALUES
(4, 2, 13, 2, 4, '2023-04-05 20:19:04'),
(5, 2, 14, 4, 6, '2023-04-05 22:24:05'),
(6, 3, 16, 0, 8, '2023-04-05 23:07:14'),
(7, 3, 14, 8, 8, '2023-04-05 23:32:45');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(30) NOT NULL,
  `question` text NOT NULL,
  `qid` int(30) NOT NULL,
  `order_by` int(11) NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `qid`, `order_by`, `date_updated`) VALUES
(4, 'What is unit of force?', 2, 0, '2023-04-05 22:13:01'),
(5, 'Neighbour of india is______', 2, 0, '2023-04-05 22:14:08'),
(6, 'CPU stands for____', 2, 0, '2023-04-05 22:15:43'),
(7, 'Which of the following browser supports HTML5 in its latest version?', 3, 0, '2023-04-05 22:29:13'),
(9, 'Which of the following tag can be used to associate a caption together with some embedded content in HTML5?', 3, 0, '2023-04-05 22:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `question_opt`
--

CREATE TABLE `question_opt` (
  `id` int(30) NOT NULL,
  `option_txt` text NOT NULL,
  `question_id` int(30) NOT NULL,
  `is_right` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1= right answer',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question_opt`
--

INSERT INTO `question_opt` (`id`, `option_txt`, `question_id`, `is_right`, `date_updated`) VALUES
(41, 'Newton', 4, 1, '2023-04-05 22:13:01'),
(42, 'Watt', 4, 0, '2023-04-05 22:13:01'),
(43, 'Joule', 4, 0, '2023-04-05 22:13:01'),
(44, 'Kwh', 4, 0, '2023-04-05 22:13:01'),
(45, 'USA', 5, 0, '2023-04-05 22:14:08'),
(46, 'Japan', 5, 0, '2023-04-05 22:14:08'),
(47, 'Nepal', 5, 1, '2023-04-05 22:14:08'),
(48, 'Germany', 5, 0, '2023-04-05 22:14:08'),
(49, 'Central processing unit', 6, 1, '2023-04-05 22:15:43'),
(50, 'Circuit power unit', 6, 0, '2023-04-05 22:15:43'),
(51, 'None', 6, 0, '2023-04-05 22:15:43'),
(52, 'Center power unit', 6, 0, '2023-04-05 22:15:43'),
(57, 'mozilla firefox', 8, 0, '2023-04-05 22:29:15'),
(58, 'opera', 8, 0, '2023-04-05 22:29:15'),
(59, 'both', 8, 0, '2023-04-05 22:29:15'),
(60, 'none', 8, 0, '2023-04-05 22:29:15'),
(65, 'Footer', 10, 0, '2023-04-05 22:30:52'),
(66, 'nav', 10, 0, '2023-04-05 22:30:52'),
(67, 'dialog', 10, 0, '2023-04-05 22:30:52'),
(68, 'figure', 10, 0, '2023-04-05 22:30:52'),
(73, 'mozilla firefox', 7, 0, '2023-04-05 23:14:56'),
(74, 'opera', 7, 0, '2023-04-05 23:14:56'),
(75, 'both', 7, 1, '2023-04-05 23:14:56'),
(76, 'none', 7, 0, '2023-04-05 23:14:56'),
(77, 'footer', 9, 0, '2023-04-05 23:15:04'),
(78, 'nav', 9, 0, '2023-04-05 23:15:04'),
(79, 'dialogue', 9, 0, '2023-04-05 23:15:04'),
(80, 'figure', 9, 1, '2023-04-05 23:15:04');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_list`
--

CREATE TABLE `quiz_list` (
  `id` int(30) NOT NULL,
  `title` varchar(200) NOT NULL,
  `qpoints` int(11) NOT NULL DEFAULT 1,
  `user_id` int(20) NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_list`
--

INSERT INTO `quiz_list` (`id`, `title`, `qpoints`, `user_id`, `date_updated`) VALUES
(2, 'Testing Quiz', 2, 6, '2023-04-05 22:16:22'),
(3, 'IWP', 4, 6, '2023-04-05 22:40:17'),
(5, 'Software Engineering', 2, 0, '2023-04-05 23:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_student_list`
--

CREATE TABLE `quiz_student_list` (
  `id` int(30) NOT NULL,
  `quiz_id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_student_list`
--

INSERT INTO `quiz_student_list` (`id`, `quiz_id`, `user_id`, `date_updated`) VALUES
(7, 2, 14, '2023-04-05 22:14:20'),
(8, 3, 14, '2023-04-05 22:27:00'),
(9, 3, 15, '2023-04-05 22:27:00'),
(10, 3, 16, '2023-04-05 22:27:00'),
(11, 3, 17, '2023-04-05 22:27:00'),
(12, 4, 14, '2023-04-05 22:31:12'),
(13, 4, 15, '2023-04-05 22:31:12'),
(14, 4, 17, '2023-04-05 22:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `level_section` varchar(100) NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `level_section`, `date_updated`) VALUES
(5, 14, '1', '2023-04-05 22:06:50'),
(6, 15, '1', '2023-04-05 22:25:40'),
(7, 16, '2', '2023-04-05 22:25:59'),
(8, 17, '3', '2023-04-05 22:26:17'),
(9, 18, '2', '2023-04-05 23:15:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(150) NOT NULL,
  `user_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = admin, 2= faculty , 3 = student',
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT ' 0 = incative , 1 = active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_type`, `username`, `password`, `status`, `date_updated`) VALUES
(1, 'Administrator', 1, 'admin', 'admin@123', 1, '2023-04-06 00:31:08'),
(6, 'Satish CJ', 2, 'satishcj', 'satish@123', 1, '2023-04-05 22:33:30'),
(14, 'Sneha', 3, 'sneha', 'sneha123', 1, '2023-04-05 22:06:50'),
(15, 'Yashwant', 3, 'yashwant', 'yashwant123', 1, '2023-04-05 22:25:40'),
(16, 'Sumit', 3, 'sumit', 'sumit123', 1, '2023-04-05 22:25:59'),
(17, 'Aaditya', 3, 'aaditya', 'aaditya123', 1, '2023-04-05 22:26:17'),
(18, 'Naman', 3, 'naman', 'naman123', 1, '2023-04-05 23:15:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_opt`
--
ALTER TABLE `question_opt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_list`
--
ALTER TABLE `quiz_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_student_list`
--
ALTER TABLE `quiz_student_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `question_opt`
--
ALTER TABLE `question_opt`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `quiz_list`
--
ALTER TABLE `quiz_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `quiz_student_list`
--
ALTER TABLE `quiz_student_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
