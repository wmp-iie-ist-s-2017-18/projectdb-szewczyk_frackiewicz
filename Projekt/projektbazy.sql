-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Czas generowania: 02 Cze 2019, 19:56
-- Wersja serwera: 5.7.24
-- Wersja PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `projektbazy`
--

DELIMITER $$
--
-- Procedury
--
DROP PROCEDURE IF EXISTS `licz`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `licz` (OUT `licz` INT)  NO SQL
BEGIN
Select count(*) into licz from klub
where budzet<0;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klub`
--

DROP TABLE IF EXISTS `klub`;
CREATE TABLE IF NOT EXISTS `klub` (
  `ID_klubu` int(100) NOT NULL,
  `Nazwa` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Data_zalozenia` date NOT NULL,
  `Budzet` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Miasto` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Dyscyplina` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID_klubu`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `klub`
--

INSERT INTO `klub` (`ID_klubu`, `Nazwa`, `Data_zalozenia`, `Budzet`, `Miasto`, `Dyscyplina`) VALUES
(5, 'dsadsa', '2000-05-04', '321321321', 'dasdsa', 'dsadsa'),
(6, 'dsadsa', '2000-05-05', '321312zl', 'dsadsa', 'dsdadas'),
(56, 'asdddd', '2000-05-01', '-100', 'wwa', 'pilka');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kontrakt`
--

DROP TABLE IF EXISTS `kontrakt`;
CREATE TABLE IF NOT EXISTS `kontrakt` (
  `ID_kontraktu` int(100) NOT NULL,
  `Data` date NOT NULL,
  `Waznosc` date NOT NULL,
  `Wynagrodzenie` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_kontraktu`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `kontrakt`
--

INSERT INTO `kontrakt` (`ID_kontraktu`, `Data`, `Waznosc`, `Wynagrodzenie`) VALUES
(6, '2000-01-01', '2000-01-02', '3213'),
(4, '2000-01-01', '2000-01-02', '3125');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `menadzer`
--

DROP TABLE IF EXISTS `menadzer`;
CREATE TABLE IF NOT EXISTS `menadzer` (
  `ID_menadzera` int(100) NOT NULL,
  `Imie` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Nazwisko` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PESEL` int(100) NOT NULL,
  `Adres` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Nr_telefonu` int(100) NOT NULL,
  `ID_klubu` int(100) NOT NULL,
  `ID_kontraktu` int(100) NOT NULL,
  PRIMARY KEY (`ID_menadzera`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `menadzer`
--

INSERT INTO `menadzer` (`ID_menadzera`, `Imie`, `Nazwisko`, `PESEL`, `Adres`, `Nr_telefonu`, `ID_klubu`, `ID_kontraktu`) VALUES
(1, 'a', 'a', 1, 'a', 1, 1, 1),
(2, 'b', 'b', 2, 'dsa', 321, 2, 2),
(3, 'd', 'd', 321, 'dsadsa', 321321, 3, 3),
(4, 'asd', 'asd', 123123, 'asd', 123, 5, 4);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
