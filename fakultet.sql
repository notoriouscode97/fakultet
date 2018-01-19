-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2018 at 03:55 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fakultet`
--

-- --------------------------------------------------------

--
-- Table structure for table `ispit_prijava`
--

CREATE TABLE `ispit_prijava` (
  `id_prijava` int(11) NOT NULL,
  `rok` varchar(30) NOT NULL,
  `ispit_id` int(11) NOT NULL,
  `datum_pocetka` date NOT NULL,
  `datum_zavrsetka` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ispit_prijava`
--

INSERT INTO `ispit_prijava` (`id_prijava`, `rok`, `ispit_id`, `datum_pocetka`, `datum_zavrsetka`) VALUES
(2, 'JAN2018', 1, '2018-01-24', '2018-01-27'),
(3, 'JAN2017', 6, '2017-01-24', '2017-01-27'),
(4, 'JUN2017', 1, '2017-06-14', '2017-06-17');

-- --------------------------------------------------------

--
-- Table structure for table `predmet`
--

CREATE TABLE `predmet` (
  `id_predmet` int(11) NOT NULL,
  `naziv_predmeta` varchar(40) NOT NULL,
  `broj_ESPB_bodova` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `predmet`
--

INSERT INTO `predmet` (`id_predmet`, `naziv_predmeta`, `broj_ESPB_bodova`) VALUES
(1, 'Java Programiranje', 12),
(2, 'Engleski za informaticare', 5),
(3, 'Baze podataka', 10),
(4, 'C/C++', 10);

-- --------------------------------------------------------

--
-- Table structure for table `prijemni`
--

CREATE TABLE `prijemni` (
  `id_prijemni` int(11) NOT NULL,
  `student` int(11) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Samofinansirajuci'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prijemni`
--

INSERT INTO `prijemni` (`id_prijemni`, `student`, `status`) VALUES
(1, 1, 'Samofinansirajuci'),
(2, 2, 'Samofinansirajuci'),
(3, 3, 'Budzet'),
(4, 4, 'Samofinansirajuci');

-- --------------------------------------------------------

--
-- Table structure for table `smer`
--

CREATE TABLE `smer` (
  `id_smer` int(11) NOT NULL,
  `naziv_smera` varchar(30) NOT NULL,
  `oznaka` varchar(30) NOT NULL,
  `broj_ESPB` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `smer`
--

INSERT INTO `smer` (`id_smer`, `naziv_smera`, `oznaka`, `broj_ESPB`) VALUES
(1, 'Softversko Inzenjerstvo', 'SI', 250),
(2, 'Informacione Tehnologije', 'IT', 250),
(3, 'Video igre', 'VI', 250);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id_student` int(11) NOT NULL,
  `student_indeks` int(11) NOT NULL,
  `predmet` int(11) NOT NULL,
  `ispitni_rok_id` int(11) NOT NULL,
  `ocena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id_student`, `student_indeks`, `predmet`, `ispitni_rok_id`, `ocena`) VALUES
(1, 1, 1, 2, 5),
(2, 2, 2, 3, 6),
(3, 3, 2, 2, 7),
(4, 1, 3, 2, 9),
(5, 4, 4, 4, 10),
(6, 4, 2, 2, 9),
(7, 3, 2, 4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `svi_ispiti`
--

CREATE TABLE `svi_ispiti` (
  `id_ispit` int(11) NOT NULL,
  `oznaka_ispita` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svi_ispiti`
--

INSERT INTO `svi_ispiti` (`id_ispit`, `oznaka_ispita`) VALUES
(1, 'IT350'),
(2, 'IT210'),
(3, 'CS101'),
(4, 'CS102'),
(5, 'NT213'),
(6, 'IT331');

-- --------------------------------------------------------

--
-- Table structure for table `upis`
--

CREATE TABLE `upis` (
  `indeks` int(11) NOT NULL,
  `smer` int(11) NOT NULL,
  `ime_studenta` varchar(30) NOT NULL,
  `prezime_studenta` varchar(30) NOT NULL,
  `mesto_rodjenja` varchar(30) NOT NULL,
  `datum_rodjenja` date NOT NULL,
  `ime_oca` varchar(30) DEFAULT NULL,
  `datum_upisa` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upis`
--

INSERT INTO `upis` (`indeks`, `smer`, `ime_studenta`, `prezime_studenta`, `mesto_rodjenja`, `datum_rodjenja`, `ime_oca`, `datum_upisa`) VALUES
(1, 1, 'Filip', 'Vukadinovic', 'Nis', '1997-04-10', NULL, NULL),
(2, 2, 'Dusan', 'Dimic', 'Nis', '1997-08-22', NULL, NULL),
(3, 3, 'Petar', 'Cenic', 'Nis', '1997-10-05', NULL, NULL),
(4, 1, 'Aca', 'Aleksic', 'Pardik', '1997-01-30', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ispit_prijava`
--
ALTER TABLE `ispit_prijava`
  ADD PRIMARY KEY (`id_prijava`),
  ADD KEY `fk3` (`ispit_id`);

--
-- Indexes for table `predmet`
--
ALTER TABLE `predmet`
  ADD PRIMARY KEY (`id_predmet`);

--
-- Indexes for table `prijemni`
--
ALTER TABLE `prijemni`
  ADD PRIMARY KEY (`id_prijemni`),
  ADD KEY `fk2` (`student`);

--
-- Indexes for table `smer`
--
ALTER TABLE `smer`
  ADD PRIMARY KEY (`id_smer`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id_student`),
  ADD KEY `fk6` (`student_indeks`),
  ADD KEY `fk7` (`predmet`),
  ADD KEY `fk8` (`ispitni_rok_id`);

--
-- Indexes for table `svi_ispiti`
--
ALTER TABLE `svi_ispiti`
  ADD PRIMARY KEY (`id_ispit`);

--
-- Indexes for table `upis`
--
ALTER TABLE `upis`
  ADD PRIMARY KEY (`indeks`),
  ADD KEY `fk1` (`smer`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ispit_prijava`
--
ALTER TABLE `ispit_prijava`
  MODIFY `id_prijava` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `predmet`
--
ALTER TABLE `predmet`
  MODIFY `id_predmet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `prijemni`
--
ALTER TABLE `prijemni`
  MODIFY `id_prijemni` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `smer`
--
ALTER TABLE `smer`
  MODIFY `id_smer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id_student` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `svi_ispiti`
--
ALTER TABLE `svi_ispiti`
  MODIFY `id_ispit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `upis`
--
ALTER TABLE `upis`
  MODIFY `indeks` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ispit_prijava`
--
ALTER TABLE `ispit_prijava`
  ADD CONSTRAINT `fk3` FOREIGN KEY (`ispit_id`) REFERENCES `svi_ispiti` (`id_ispit`);

--
-- Constraints for table `prijemni`
--
ALTER TABLE `prijemni`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`student`) REFERENCES `upis` (`indeks`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk4` FOREIGN KEY (`student_indeks`) REFERENCES `prijemni` (`id_prijemni`),
  ADD CONSTRAINT `fk5` FOREIGN KEY (`predmet`) REFERENCES `predmet` (`id_predmet`),
  ADD CONSTRAINT `fk6` FOREIGN KEY (`student_indeks`) REFERENCES `prijemni` (`id_prijemni`),
  ADD CONSTRAINT `fk7` FOREIGN KEY (`predmet`) REFERENCES `predmet` (`id_predmet`),
  ADD CONSTRAINT `fk8` FOREIGN KEY (`ispitni_rok_id`) REFERENCES `ispit_prijava` (`id_prijava`);

--
-- Constraints for table `upis`
--
ALTER TABLE `upis`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`smer`) REFERENCES `smer` (`id_smer`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
