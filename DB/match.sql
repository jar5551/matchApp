-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas generowania: 14 Lut 2016, 01:45
-- Wersja serwera: 10.1.9-MariaDB
-- Wersja PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `match`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `characteristics`
--

CREATE TABLE `characteristics` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `nameMale` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `nameFemale` varchar(255) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `characteristics`
--

INSERT INTO `characteristics` (`id`, `name`, `nameMale`, `nameFemale`) VALUES
(1, 'Szczupły', 'Szczupły', 'Szczupła'),
(2, 'Lekko otyły', 'Lekko otyły', 'Lekko otyła'),
(3, 'Wysoki', 'Wysoki', 'Wysoka'),
(4, 'Spokojny', 'Spokojny', 'Spokojna'),
(5, 'Rozrywkowy', 'Rozrywkowy', 'Rozrywkowa'),
(6, 'Gruby', 'Gruby', 'Gruba'),
(7, 'Niski', 'Niski', 'Niska'),
(8, 'Średni wzrost', 'Średni wzrost', 'Średni wzrost'),
(17, 'Ciemna karnacja', 'Ciemna karnacja', 'Ciemna karnacja'),
(18, 'Jasna karnacja', 'Jasna karnacja', 'Jasna karnacja');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `characteristicstosimlar`
--

CREATE TABLE `characteristicstosimlar` (
  `characteristic_id` int(11) NOT NULL,
  `simlarCharacteristic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `characteristicstosimlar`
--

INSERT INTO `characteristicstosimlar` (`characteristic_id`, `simlarCharacteristic_id`) VALUES
(1, 2),
(3, 4),
(5, 6),
(7, 8),
(9, 10),
(11, 12),
(13, 14),
(15, 16);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `characteristicstousers`
--

CREATE TABLE `characteristicstousers` (
  `characteristic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `characteristicstousers`
--

INSERT INTO `characteristicstousers` (`characteristic_id`, `user_id`) VALUES
(2, 2),
(14, 2),
(10, 2),
(1, 3),
(5, 3),
(9, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `friendrequests`
--

CREATE TABLE `friendrequests` (
  `id` int(11) NOT NULL,
  `userFrom` int(11) NOT NULL,
  `userTo` int(11) NOT NULL,
  `accepted` tinyint(1) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `friendrequests`
--

INSERT INTO `friendrequests` (`id`, `userFrom`, `userTo`, `accepted`, `date`) VALUES
(1, 2, 1, 1, '2016-02-09 08:13:13'),
(2, 1, 3, 1, '2016-02-18 14:21:37'),
(3, 1, 4, 1, '2016-02-24 04:27:18'),
(4, 1, 2, 0, '2016-02-13 23:58:05'),
(5, 1, 5, 0, '2016-02-13 23:58:35'),
(6, 1, 6, 1, '2016-02-13 23:58:59'),
(7, 1, 7, 1, '2016-02-14 00:29:07'),
(8, 1, 8, 0, '2016-02-14 00:29:25'),
(9, 1, 38, 0, '2016-02-14 01:06:35'),
(10, 1, 39, 0, '2016-02-14 01:06:52'),
(11, 41, 1, 1, '2016-02-14 01:07:52');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `friends`
--

CREATE TABLE `friends` (
  `id` int(11) NOT NULL,
  `userA` int(11) NOT NULL,
  `userB` int(11) NOT NULL,
  `dateFriendship` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `friends`
--

INSERT INTO `friends` (`id`, `userA`, `userB`, `dateFriendship`) VALUES
(1, 1, 2, '2016-02-26 07:18:22'),
(2, 1, 3, '2016-02-11 08:22:48'),
(3, 2, 3, '2016-02-19 11:34:32'),
(4, 1, 6, '0000-00-00 00:00:00'),
(6, 1, 4, '0000-00-00 00:00:00'),
(7, 1, 7, '0000-00-00 00:00:00'),
(8, 1, 41, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `topicId` int(11) NOT NULL,
  `message` text COLLATE utf8_polish_ci NOT NULL,
  `dateSend` datetime NOT NULL,
  `dateRead` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `messages`
--

INSERT INTO `messages` (`id`, `author`, `topicId`, `message`, `dateSend`, `dateRead`) VALUES
(1, 1, 1, 'Hej spodobał mi się Twój opis w profilu. Fajnie, że interesuję Cię filozofia. Ciekawe jest nawiązanie do Platona, którego użyłaś. Przy okazji masz fajne cycki :)', '2016-01-14 11:20:17', '2016-01-14 11:33:34'),
(2, 2, 1, 'Hej! Dzięki za docenienie moich cycków! Jesteś uroczy!', '2016-01-14 11:40:22', NULL),
(3, 1, 1, 'Array', '2016-02-12 00:15:19', NULL),
(4, 1, 1, 'Array', '2016-02-12 00:15:21', NULL),
(5, 1, 1, 'Array', '2016-02-12 00:15:23', NULL),
(6, 1, 1, 'Array', '2016-02-12 00:15:24', NULL),
(7, 1, 1, 'Array', '2016-02-12 00:15:27', NULL),
(8, 1, 1, 'Array', '2016-02-12 00:15:43', NULL),
(9, 1, 1, 'Array', '2016-02-12 00:15:48', NULL),
(10, 1, 1, 'das', '2016-02-12 18:43:31', NULL),
(11, 1, 1, 'dasdas', '2016-02-12 18:43:35', NULL),
(12, 1, 1, 'fda', '2016-02-12 18:49:35', NULL),
(13, 1, 1, '11', '2016-02-12 18:49:39', NULL),
(14, 1, 1, 'dsa', '2016-02-12 18:50:45', NULL),
(15, 1, 1, 'dsadsa', '2016-02-12 18:50:47', NULL),
(16, 1, 1, 'dsadsa', '2016-02-12 18:56:26', NULL),
(17, 1, 1, 'dsadsa', '2016-02-12 18:56:33', NULL),
(18, 0, 1, 'dsadsa', '2016-02-12 18:59:15', NULL),
(19, 0, 1, 'dsadsa', '2016-02-12 18:59:47', NULL),
(20, 0, 1, 'dsadsa', '2016-02-12 19:00:02', NULL),
(21, 0, 1, 'dsadsa', '2016-02-12 19:01:15', NULL),
(22, 0, 1, 'dsadsa', '2016-02-12 19:01:23', NULL),
(23, 0, 1, 'dsadsa', '2016-02-12 19:01:23', NULL),
(24, 0, 1, 'dsadsa', '2016-02-12 19:01:47', NULL),
(25, 0, 1, 'dsadsa', '2016-02-12 19:02:28', NULL),
(26, 0, 1, 'dsadsa', '2016-02-12 19:02:29', NULL),
(27, 1, 1, 'dsadsa', '2016-02-12 19:03:08', NULL),
(28, 1, 1, 'das', '2016-02-12 19:03:53', NULL),
(29, 1, 1, 'das', '2016-02-12 19:03:54', NULL),
(30, 1, 1, 'dasgfg', '2016-02-12 19:03:56', NULL),
(31, 1, 1, 'dasgfgasd', '2016-02-12 19:03:58', NULL),
(32, 1, 1, 'dsadsa', '2016-02-12 19:05:08', NULL),
(33, 1, 1, 'dsadsafdsfsd', '2016-02-12 19:05:10', NULL),
(34, 1, 1, 'dsa', '2016-02-12 19:05:35', NULL),
(35, 1, 1, 'dsad', '2016-02-12 19:06:41', NULL),
(36, 1, 1, 'dsa', '2016-02-12 19:06:54', NULL),
(37, 1, 1, 'dsa', '2016-02-12 19:06:55', NULL),
(38, 1, 1, 'dsadas', '2016-02-12 19:07:24', NULL),
(39, 1, 1, 'dsadas', '2016-02-12 19:07:30', NULL),
(40, 1, 1, 'dsadas', '2016-02-12 19:07:32', NULL),
(41, 1, 1, 'gfds', '2016-02-12 19:08:43', NULL),
(42, 1, 1, 'dsadas', '2016-02-12 19:08:45', NULL),
(43, 1, 1, 'dasd', '2016-02-12 19:09:06', NULL),
(44, 1, 1, 'Elo!', '2016-02-12 19:09:14', NULL),
(45, 1, 1, 'dfa', '2016-02-12 19:20:10', NULL),
(46, 1, 1, 'das', '2016-02-12 19:20:13', NULL),
(47, 1, 1, 'das', '2016-02-12 19:20:30', NULL),
(48, 1, 1, 'das', '2016-02-12 19:20:32', NULL),
(49, 1, 1, 'fsdf', '2016-02-12 19:20:34', NULL),
(50, 1, 1, 'fafdas', '2016-02-12 19:20:37', NULL),
(51, 1, 1, 'das', '2016-02-12 19:21:32', NULL),
(52, 1, 1, 'dsa', '2016-02-12 19:22:24', NULL),
(53, 1, 1, 'dasdas', '2016-02-12 19:23:03', NULL),
(54, 39, 1, 'dsa', '2016-02-12 19:23:35', NULL),
(55, 39, 1, 'dsadas', '2016-02-12 19:23:39', NULL),
(56, 1, 1, 'dsa', '2016-02-12 19:23:42', NULL),
(57, 1, 1, 'dasda', '2016-02-12 19:23:46', NULL),
(58, 1, 1, 'dasdas', '2016-02-12 19:24:14', NULL),
(59, 39, 1, 'dsada', '2016-02-12 19:24:22', NULL),
(60, 1, 2, 'dasdas', '2016-02-13 15:31:48', NULL),
(61, 40, 2, 'chuju', '2016-02-13 15:32:31', NULL),
(62, 1, 2, 'cipo', '2016-02-13 15:32:44', NULL),
(63, 40, 2, 'Fajna dupa z Ciebie', '2016-02-13 15:33:01', NULL),
(64, 1, 2, 'Łykaj rogala', '2016-02-13 15:33:23', NULL),
(65, 1, 1, 'das', '2016-02-13 19:02:59', NULL),
(66, 1, 1, 'sda', '2016-02-13 19:03:02', NULL),
(67, 1, 2, 'fads', '2016-02-14 01:33:27', NULL),
(68, 1, 3, 'das', '2016-02-14 01:33:30', NULL),
(69, 1, 5, 'fafd', '2016-02-14 01:35:19', NULL),
(70, 1, 4, 'dasdsa', '2016-02-14 01:41:33', NULL),
(71, 1, 1, 'dsa', '2016-02-14 01:41:53', NULL),
(72, 1, 4, 'gghg', '2016-02-14 01:42:12', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `messagestopics`
--

CREATE TABLE `messagestopics` (
  `id` int(11) NOT NULL,
  `userFrom` int(11) NOT NULL,
  `userTo` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `messagestopics`
--

INSERT INTO `messagestopics` (`id`, `userFrom`, `userTo`, `name`) VALUES
(1, 1, 2, 'Hej mała ;)'),
(2, 1, 3, ''),
(3, 1, 5, ''),
(4, 1, 41, ''),
(5, 1, 6, '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `photoName` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `description` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Administrator'),
(2, 'User');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rolestouser`
--

CREATE TABLE `rolestouser` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `rolestouser`
--

INSERT INTO `rolestouser` (`role_id`, `user_id`) VALUES
(1, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sex`
--

CREATE TABLE `sex` (
  `id` int(11) NOT NULL,
  `code` tinyint(1) NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `sex`
--

INSERT INTO `sex` (`id`, `code`, `name`) VALUES
(1, 0, 'Kobieta'),
(2, 1, 'Mężczyzna');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `firstName` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `refreshToken` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `sex` tinyint(1) NOT NULL,
  `description` text COLLATE utf8_polish_ci,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `firstName`, `accessToken`, `refreshToken`, `sex`, `description`, `createdDate`, `modifiedDate`, `lastLoginDate`) VALUES
(1, 'test@test.pl', '$2y$10$ZzCHqeG52KcIAGRoYXJQp.hO7ePrjzar.ns7E/HN/OJeRlcBgiY3i', 'Użytkownik', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1NDA4NDk4IiwiZXhwIjoiMTQ1NTQxNTY5OCIsImp0aSI6IjY4MDczZmY0YjVlOTQ2YTZlNDMzMDNhZGEzZDUyNDZmIiwic2NvcGUiOlt7Im5hbWUiOiJBZG1pbmlzdHJhdG9yIn1dfQ.uXmLtVh0unbjqLfkjKK3yTWDdus3Np1KLOFa7fbWSV8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1NDA4NDk4IiwiZXhwIjoiMTQ1NTQxNTY5OCIsImp0aSI6IjJjNmE2OWNmMDYxNDViYTI5ODFmYmQ1ZWQwNzYzMDc4In0.M4kVYb7es87FudHLrXpNTtpGQzgf4CO9um7wUSoLRgw', 1, 'Administrator serwisu', '0000-00-00 00:00:00', NULL, NULL),
(2, 'kobieta@test.pl', '$2a$09$.D/my3d6vaNVDb43.m6mZuktxQIrzKfhjtA3wI1iMif5luwGRtPHK', 'Testowa', '', '', 0, 'Jestem kobietÄ… testowÄ…. Ĺ»adnych testĂłw siÄ™ nie bojÄ™.', '0000-00-00 00:00:00', NULL, NULL),
(3, 'mezczyzna@test.pl', '$2a$09$4SI015knDqxiXtr/PvuFPuH4lNvZPfOwS8D7yc6LagWcsArjHSBAG', 'Testowy', '', '', 1, 'Testuj mnie jak chcesz', '0000-00-00 00:00:00', NULL, NULL),
(4, 'asd3fe@adsa.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Jan', '', '', 1, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(5, 'asda@dsa.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Ewa', '', '', 0, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(6, 'dsada@dsa.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Zbyszek', '', '', 1, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(7, 'hfghfg@gsdg.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Maria', '', '', 0, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(8, 'gd434@fdg.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Adam', '', '', 1, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(9, 'gsg4324@fsdg.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Karolina', '', '', 0, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(10, 'fgre@fsdg.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Paweł', '', '', 1, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(11, '4wg3@gs5.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Anna', '', '', 0, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(12, 'g4t1@fas.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Eustachy', '', '', 1, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(13, 'dser@few32.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Marta', '', '', 0, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(14, 'fds3@fs3q.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Daniel', '', '', 1, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(15, 'fdh@gsdq.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Agnieszka', '', '', 0, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(16, 'fdsgsew@fadfd.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Józef', '', '', 1, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(17, 'hfd@fsg.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Michalina', '', '', 0, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(18, 'hrtw3@fsdh.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Michał', '', '', 1, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(19, 'hsfbz@gsf.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Joanna', '', '', 0, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(20, 'fsd3@gsd3.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Olgierd', '', '', 1, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(21, 'asdas@dsadas.pl', 'Array', 'Jan', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIyNTEwNSIsImp0aSI6IjNhZTA1NmRjMDE3YWIxMTViNTNjYWNlYWJkNDI0NzRiIiwic2NvcGUiOltdfQ.ThoA3mMsRj7WrOMEXcjm5uIwPBFJ-n8y_-bi5bAk_4o', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIzMTQwNSIsImp0aSI6IjE4ZGRkNjRjNGE5YTA3MDhhODY1M2Q0NGJjODViNWE5In0.vU840stBWnBwDSr20rkfjHGPMZqd3MabHx-pK6Rp2ec', 1, NULL, '2016-02-11 21:49:22', NULL, NULL),
(22, 'asdas@dsadas.pl', 'Array', 'Jan', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIyNTEwNSIsImp0aSI6IjNhZTA1NmRjMDE3YWIxMTViNTNjYWNlYWJkNDI0NzRiIiwic2NvcGUiOltdfQ.ThoA3mMsRj7WrOMEXcjm5uIwPBFJ-n8y_-bi5bAk_4o', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIzMTQwNSIsImp0aSI6IjE4ZGRkNjRjNGE5YTA3MDhhODY1M2Q0NGJjODViNWE5In0.vU840stBWnBwDSr20rkfjHGPMZqd3MabHx-pK6Rp2ec', 1, NULL, '2016-02-11 21:49:23', NULL, NULL),
(23, 'asdas@dsadas.pl', 'Array', 'Jan', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIyNTEwNSIsImp0aSI6IjNhZTA1NmRjMDE3YWIxMTViNTNjYWNlYWJkNDI0NzRiIiwic2NvcGUiOltdfQ.ThoA3mMsRj7WrOMEXcjm5uIwPBFJ-n8y_-bi5bAk_4o', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIzMTQwNSIsImp0aSI6IjE4ZGRkNjRjNGE5YTA3MDhhODY1M2Q0NGJjODViNWE5In0.vU840stBWnBwDSr20rkfjHGPMZqd3MabHx-pK6Rp2ec', 1, NULL, '2016-02-11 21:52:01', NULL, NULL),
(24, 'asdas@dsadas.pl', 'Array', 'Jan', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIyNTEwNSIsImp0aSI6IjNhZTA1NmRjMDE3YWIxMTViNTNjYWNlYWJkNDI0NzRiIiwic2NvcGUiOltdfQ.ThoA3mMsRj7WrOMEXcjm5uIwPBFJ-n8y_-bi5bAk_4o', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIzMTQwNSIsImp0aSI6IjE4ZGRkNjRjNGE5YTA3MDhhODY1M2Q0NGJjODViNWE5In0.vU840stBWnBwDSr20rkfjHGPMZqd3MabHx-pK6Rp2ec', 1, NULL, '2016-02-11 21:52:02', NULL, NULL),
(25, 'asdas@dsadas.pl', 'Array', 'Jan', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIyNTEwNSIsImp0aSI6IjNhZTA1NmRjMDE3YWIxMTViNTNjYWNlYWJkNDI0NzRiIiwic2NvcGUiOltdfQ.ThoA3mMsRj7WrOMEXcjm5uIwPBFJ-n8y_-bi5bAk_4o', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIzMTQwNSIsImp0aSI6IjE4ZGRkNjRjNGE5YTA3MDhhODY1M2Q0NGJjODViNWE5In0.vU840stBWnBwDSr20rkfjHGPMZqd3MabHx-pK6Rp2ec', 1, NULL, '2016-02-11 21:52:16', NULL, NULL),
(26, 'asdas@dsadas.pl', 'Array', 'Jan', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIyNTEwNSIsImp0aSI6IjNhZTA1NmRjMDE3YWIxMTViNTNjYWNlYWJkNDI0NzRiIiwic2NvcGUiOltdfQ.ThoA3mMsRj7WrOMEXcjm5uIwPBFJ-n8y_-bi5bAk_4o', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIzMTQwNSIsImp0aSI6IjE4ZGRkNjRjNGE5YTA3MDhhODY1M2Q0NGJjODViNWE5In0.vU840stBWnBwDSr20rkfjHGPMZqd3MabHx-pK6Rp2ec', 1, NULL, '2016-02-11 21:52:17', NULL, NULL),
(27, 'asdas@dsadas.pl', 'Array', 'Jan', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIyNTEwNSIsImp0aSI6IjNhZTA1NmRjMDE3YWIxMTViNTNjYWNlYWJkNDI0NzRiIiwic2NvcGUiOltdfQ.ThoA3mMsRj7WrOMEXcjm5uIwPBFJ-n8y_-bi5bAk_4o', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIzMTQwNSIsImp0aSI6IjE4ZGRkNjRjNGE5YTA3MDhhODY1M2Q0NGJjODViNWE5In0.vU840stBWnBwDSr20rkfjHGPMZqd3MabHx-pK6Rp2ec', 1, NULL, '2016-02-11 21:52:17', NULL, NULL),
(28, 'asdas@dsadsa', 'dasdas', 'Jan', NULL, NULL, 1, NULL, '2016-02-25 00:00:00', NULL, NULL),
(29, 'asdas@dsadas.pl', 'asd', 'Jan', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIyNTEwNSIsImp0aSI6IjNhZTA1NmRjMDE3YWIxMTViNTNjYWNlYWJkNDI0NzRiIiwic2NvcGUiOltdfQ.ThoA3mMsRj7WrOMEXcjm5uIwPBFJ-n8y_-bi5bAk_4o', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIzMTQwNSIsImp0aSI6IjE4ZGRkNjRjNGE5YTA3MDhhODY1M2Q0NGJjODViNWE5In0.vU840stBWnBwDSr20rkfjHGPMZqd3MabHx-pK6Rp2ec', 1, NULL, '2016-02-11 21:55:52', NULL, NULL),
(30, 'asdas@dsadas.pl', 'asd', 'Jan', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIyNTEwNSIsImp0aSI6IjNhZTA1NmRjMDE3YWIxMTViNTNjYWNlYWJkNDI0NzRiIiwic2NvcGUiOltdfQ.ThoA3mMsRj7WrOMEXcjm5uIwPBFJ-n8y_-bi5bAk_4o', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIzMTQwNSIsImp0aSI6IjE4ZGRkNjRjNGE5YTA3MDhhODY1M2Q0NGJjODViNWE5In0.vU840stBWnBwDSr20rkfjHGPMZqd3MabHx-pK6Rp2ec', 1, NULL, '2016-02-11 21:55:59', NULL, NULL),
(31, 'asdas@dsadas.pl', '$2y$10$quT.2a.bRceoUZMtzbK/au8IV6iOTQCDXn76WGZThpMl8.Y4Q3kWu', 'Jan', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIyNTEwNSIsImp0aSI6IjNhZTA1NmRjMDE3YWIxMTViNTNjYWNlYWJkNDI0NzRiIiwic2NvcGUiOltdfQ.ThoA3mMsRj7WrOMEXcjm5uIwPBFJ-n8y_-bi5bAk_4o', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIzMTQwNSIsImp0aSI6IjE4ZGRkNjRjNGE5YTA3MDhhODY1M2Q0NGJjODViNWE5In0.vU840stBWnBwDSr20rkfjHGPMZqd3MabHx-pK6Rp2ec', 1, NULL, '2016-02-11 21:56:45', NULL, NULL),
(32, 'asdas@dsadas.pl', '$2y$10$iTTU9pxG9NLMUkUmhm5sI.OPptEKS2zRcU1LUKjcWOeTIsVXzM/8u', 'Jan', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIyNTEwNSIsImp0aSI6IjNhZTA1NmRjMDE3YWIxMTViNTNjYWNlYWJkNDI0NzRiIiwic2NvcGUiOltdfQ.ThoA3mMsRj7WrOMEXcjm5uIwPBFJ-n8y_-bi5bAk_4o', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0MjA1IiwiZXhwIjoiMTQ1NTIzMTQwNSIsImp0aSI6IjE4ZGRkNjRjNGE5YTA3MDhhODY1M2Q0NGJjODViNWE5In0.vU840stBWnBwDSr20rkfjHGPMZqd3MabHx-pK6Rp2ec', 1, NULL, '2016-02-11 21:56:45', NULL, NULL),
(33, 'asdasa@dsadas.pl', '$2y$10$KfPEd4P93fKI5i7k4SP9LO05ai3i9f7E2mnTwt.sKXFkNLH49fBxq', 'Jan', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0NTIyIiwiZXhwIjoiMTQ1NTIyNTQyMiIsImp0aSI6IjVlNjU1NTE1ZjdhNTA3YWZiOTNkNTU1NGM0MDQ3MTU2Iiwic2NvcGUiOltdfQ.mvEXoNMkiBWFZ04TWl7LEOt3wmk1EcjTsixI_zF6lVA', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI0NTIyIiwiZXhwIjoiMTQ1NTIzMTcyMiIsImp0aSI6ImRmYjdhODM0NzQ3Mzg0YTVmNmE5MDMxM2VlYjk2NGEwIn0.AlBlYIIH45_ytbbawl8EzSq7NaBsYUNiru5KMiYmEKQ', 1, NULL, '2016-02-11 22:02:02', NULL, NULL),
(34, 'das@dsadas.pl', '$2y$10$W3bzTE5EZkpN8Wmow3fH8ezr2a0USI/DnpvL77zL0yWe0oopy2MBO', 'Jan', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI1NjE2IiwiZXhwIjoiMTQ1NTIyNjUxNiIsImp0aSI6IjI5NmNlZmM2ODhlZDFkNzNhYWY0MTFjNmVlNThmOGM2Iiwic2NvcGUiOltdfQ.9TghoKJT4uaHUbIwzGfr0J5LlNLIVOxumy8i8O3bb_o', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI1NjE2IiwiZXhwIjoiMTQ1NTIzMjgxNiIsImp0aSI6ImJmYzFkNzA3YzViZDc4YjcyYjBiODQyNTc0MjUzZWY2In0.7cOy1er_IpHfjgleRvzRggf-uYrwoFQso68Q8a76OWs', 1, NULL, '2016-02-11 22:20:16', NULL, NULL),
(35, 'das@dsadas.pla', '$2y$10$GPry8w4FiV4DWKS0r/b1buXW1EbU2VfM9HXbiTp1UFKd1Gb0UNh2G', 'Jan', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI1NjM2IiwiZXhwIjoiMTQ1NTIyNjUzNiIsImp0aSI6ImZmOTM2Y2VkNzNlNWUzMTZlNjRkODMxMjM1MTZjNzA1Iiwic2NvcGUiOltdfQ.eslXftmQNk8GKq221qhrJK86O3U3APZYN1PbKk1eRbk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI1NjM2IiwiZXhwIjoiMTQ1NTIzMjgzNiIsImp0aSI6IjU2MjEzMjI5NWJmODIxYTc3MzlkMmQwYTc5ZTk3YTJjIn0.HO8O49x1PlykycIyKYBOWJ_YDKHhsDjHMUj78eaA4gU', 0, NULL, '2016-02-11 22:20:36', NULL, NULL),
(36, 'asdasa@dsadaas.pl', '$2y$10$5w5FR4OX/Ftvy7a/pOW0puKLy4BXcaKl72QGRy8SITaEFmGuk01re', 'Jan', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI1OTYyIiwiZXhwIjoiMTQ1NTIyNjg2MiIsImp0aSI6IjRiZDMzYmNkNjc1OTgwNGQ1MmE5MzU4Y2UzMjJlZTRhIiwic2NvcGUiOltdfQ.4RSxgPDJ7dHomd610pf9v2N4P628PhpxVRO5RAN_Z34', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI1OTYyIiwiZXhwIjoiMTQ1NTIzMzE2MiIsImp0aSI6ImNlZWY2MTIzNzA5MjM5ZDg2ZDAwYzY3NmZlYjAzMjg0In0.3q9VnvGk9lbBxKRgSI6XvhUdf_GTFpqdcLjRq1_2iBQ', 1, NULL, '2016-02-11 22:26:02', NULL, NULL),
(37, 'adssa@dsa.pl', '$2y$10$y9qi589HPACeBIu5o68nNeayEoMbjxvHCib95amwttP9kgB35pOci', 'Jan', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI2MDQwIiwiZXhwIjoiMTQ1NTIyNjk0MCIsImp0aSI6IjcyNTQzNmI2ZjY1Mzk5MTY1OWQ5OWYyMzA1YzE2MDdmIiwic2NvcGUiOltdfQ.xh0Y0j2TeO016VL3_roa3sugOKp3faaOCwe21ZSNyhI', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI2MDQwIiwiZXhwIjoiMTQ1NTIzMzI0MCIsImp0aSI6ImU5NDYzNzEyZjYxYjFiNjcwNTJlMmM4MGFlZGU2NzhlIn0.2lKqAg552_aemAgoaw-a2nHcHbsTmWvyOEh3cQHlolI', 1, NULL, '2016-02-11 22:27:19', NULL, NULL),
(38, 'asd@dsadas.pl', '$2y$10$ayXv5ReUncZfmv3Jvt32UuCLeaskIQIVfoJ3ut9dUS0VOK1lKvSLu', 'Jan', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI2MDYyIiwiZXhwIjoiMTQ1NTIyNjk2MiIsImp0aSI6ImRjYjUzZGY4MmI4M2ZlNzY4NTVlZDA3Y2M4ZWI1OWQ3Iiwic2NvcGUiOltdfQ.cCkFXPf44_laEQgTIWXSCvUIBlGE5IEtOkD_a0OePBo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MjI2MDYyIiwiZXhwIjoiMTQ1NTIzMzI2MiIsImp0aSI6IjA3ZTdkZGY1ZTU1YjU5NzJjYjQyZGQxMmRkN2NkODdhIn0.hwS3cF4jVnrFtwxcwaceu1AjYKCM7xB-cJvM9RgOrkI', 1, NULL, '2016-02-11 22:27:42', NULL, NULL),
(39, 'asdsa@dsadas', '$2y$10$tXP/dWtxYlH1B3EXhQCCheNBixgM673zdF3/cRO4m8JxbjDnZwwE6', 'Anna', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MzAxNDA4IiwiZXhwIjoiMTQ1NTMwODYwOCIsImp0aSI6IjIyMTIyOTZhMTA3ODE2ZWQyNzZhMDlkODI5MWQyNjM0Iiwic2NvcGUiOltdfQ.gM3_YAEZ5HbB1inD4dEZhGBh-A58W-iFqikIxkHv9kE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MzAxNDA4IiwiZXhwIjoiMTQ1NTMwODYwOCIsImp0aSI6IjQ1MTg2MDA3ZGQ1Zjc2MDljMjc4NDQ4YjZmM2FiOTllIn0.9HnO5o5axlP-8d_WQ4s4vCfIgx6ib8UO8hn14Q2un7g', 0, NULL, '2016-02-12 19:23:28', NULL, NULL),
(40, 'fdf@fad', '$2y$10$gJj3TqaEsHyVlm4iRhmEx./sQxRwxfZ2/WMvZZhZ6hUFzIU64dZVW', 'afd', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MzczOTQwIiwiZXhwIjoiMTQ1NTM4MTE0MCIsImp0aSI6ImZlYjMwNWYyZGJkMjZlMGUzMzMwZGE0YWMyNjlkNzk2Iiwic2NvcGUiOltdfQ.sa6V6dm9YO-qo_2aknmZy2miSZ1olUwnqrgtpKFaBh4', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1MzczOTQwIiwiZXhwIjoiMTQ1NTM4MTE0MCIsImp0aSI6IjM2NmJkM2JmNmE3NzA3NDllNjMxMDhmZWI4YWRhNzRlIn0.XXgpFAH_Syh8MtuPNcY6wjiN5RScNfh2UumP9rrHlhI', 0, NULL, '2016-02-13 15:32:20', NULL, NULL),
(41, 'das@dsa', '$2y$10$2Iotn0f015XxNO7Zob1jduphQVGAJXbRCYKL88u.TCVjuqTSWCt7a', 'das@dsa', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1NDA4NDY5IiwiZXhwIjoiMTQ1NTQxNTY2OSIsImp0aSI6IjBiOWUwZjg2M2I0YzZkMmJjMGVmNzBlMWQ1NTlmNDgzIiwic2NvcGUiOltdfQ.LGjvZHIRUO-jR32rFOlJOEsGuZBbJfUPtkllVvkdOIY', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDU1NDA4NDY5IiwiZXhwIjoiMTQ1NTQxNTY2OSIsImp0aSI6ImY3OTcwMmU5YmEyMDliZTZiNGQ2MWI1MmI4NDhjNjAyIn0.v6RKpRdu7NVFwWTt97FGtUvK8DE7uanAfubVQfnWWHc', 0, NULL, '2016-02-14 01:07:49', NULL, NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `characteristics`
--
ALTER TABLE `characteristics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friendrequests`
--
ALTER TABLE `friendrequests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messagestopics`
--
ALTER TABLE `messagestopics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sex`
--
ALTER TABLE `sex`
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
-- AUTO_INCREMENT dla tabeli `characteristics`
--
ALTER TABLE `characteristics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT dla tabeli `friendrequests`
--
ALTER TABLE `friendrequests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT dla tabeli `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT dla tabeli `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT dla tabeli `messagestopics`
--
ALTER TABLE `messagestopics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT dla tabeli `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `sex`
--
ALTER TABLE `sex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
