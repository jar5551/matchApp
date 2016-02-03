-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas generowania: 03 Lut 2016, 21:08
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
-- Struktura tabeli dla tabeli `characteristics-to-simlar`
--

CREATE TABLE `characteristics-to-simlar` (
  `characteristic_id` int(11) NOT NULL,
  `simlarCharacteristic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `characteristics-to-simlar`
--

INSERT INTO `characteristics-to-simlar` (`characteristic_id`, `simlarCharacteristic_id`) VALUES
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
-- Struktura tabeli dla tabeli `characteristics-to-users`
--

CREATE TABLE `characteristics-to-users` (
  `characteristic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `characteristics-to-users`
--

INSERT INTO `characteristics-to-users` (`characteristic_id`, `user_id`) VALUES
(2, 2),
(14, 2),
(10, 2),
(1, 3),
(5, 3),
(9, 3);

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
(1, 3, 1, 'Hej spodobał mi się Twój opis w profilu. Fajnie, że interesuję Cię filozofia. Ciekawe jest nawiązanie do Platona, którego użyłaś. Przy okazji masz fajne cycki :)', '2016-01-14 11:20:17', '2016-01-14 11:33:34'),
(2, 2, 1, 'Hej! Dzięki za docenienie moich cycków! Jesteś uroczy!', '2016-01-14 11:40:22', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `messages-topics`
--

CREATE TABLE `messages-topics` (
  `id` int(11) NOT NULL,
  `userFrom` int(11) NOT NULL,
  `userTo` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `messages-topics`
--

INSERT INTO `messages-topics` (`id`, `userFrom`, `userTo`, `name`) VALUES
(1, 3, 2, 'Hej mała ;)');

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
-- Struktura tabeli dla tabeli `roles-to-user`
--

CREATE TABLE `roles-to-user` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `roles-to-user`
--

INSERT INTO `roles-to-user` (`role_id`, `user_id`) VALUES
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
  `lastName` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `refreshToken` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `description` text COLLATE utf8_polish_ci NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `firstName`, `lastName`, `accessToken`, `refreshToken`, `sex`, `description`, `createdDate`, `modifiedDate`, `lastLoginDate`) VALUES
(1, 'admin@admin.pl', '$2a$09$viEK8d7YfPrOeGnzmQ9e3eddhYvfe8.a9DedngZg3lxnznhd25lQq', 'Użytkownik', 'Administrator', '', '', 1, 'Administrator serwisu', '0000-00-00 00:00:00', NULL, NULL),
(2, 'kobieta@test.pl', '$2a$09$.D/my3d6vaNVDb43.m6mZuktxQIrzKfhjtA3wI1iMif5luwGRtPHK', 'Testowa', 'Kobieta', '', '', 0, 'Jestem kobietÄ… testowÄ…. Ĺ»adnych testĂłw siÄ™ nie bojÄ™.', '0000-00-00 00:00:00', NULL, NULL),
(3, 'mezczyzna@test.pl', '$2a$09$4SI015knDqxiXtr/PvuFPuH4lNvZPfOwS8D7yc6LagWcsArjHSBAG', 'Testowy', 'Mężczyzna', '', '', 1, 'Testuj mnie jak chcesz', '0000-00-00 00:00:00', NULL, NULL),
(4, 'asd3fe@adsa.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Jan', 'Kowalski', '', '', 1, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(5, 'asda@dsa.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Ewa', 'Kowalski', '', '', 0, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(6, 'dsada@dsa.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Zbyszek', 'Kowalski', '', '', 1, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(7, 'hfghfg@gsdg.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Maria', 'Kowalski', '', '', 0, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(8, 'gd434@fdg.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Adam', 'Kowalski', '', '', 1, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(9, 'gsg4324@fsdg.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Karolina', 'Kowalski', '', '', 0, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(10, 'fgre@fsdg.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Paweł', 'Kowalski', '', '', 1, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(11, '4wg3@gs5.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Anna', 'Kowalski', '', '', 0, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(12, 'g4t1@fas.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Eustachy', 'Kowalski', '', '', 1, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(13, 'dser@few32.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Marta', 'Kowalski', '', '', 0, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(14, 'fds3@fs3q.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Daniel', 'Kowalski', '', '', 1, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(15, 'fdh@gsdq.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Agnieszka', 'Kowalski', '', '', 0, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(16, 'fdsgsew@fadfd.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Józef', 'Kowalski', '', '', 1, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(17, 'hfd@fsg.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Michalina', 'Kowalski', '', '', 0, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(18, 'hrtw3@fsdh.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Michał', 'Kowalski', '', '', 1, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(19, 'hsfbz@gsf.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Joanna', 'Kowalski', '', '', 0, 'Opis', '0000-00-00 00:00:00', NULL, NULL),
(20, 'fsd3@gsd3.pl', '$2a$09$4Wc4U8fNYxfIBVmHgjDwoO0rQC5LbjW.7A9cGIeKmVMZWF06vnF8e', 'Olgierd', 'Kowalski', '', '', 1, 'Opis', '0000-00-00 00:00:00', NULL, NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `characteristics`
--
ALTER TABLE `characteristics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages-topics`
--
ALTER TABLE `messages-topics`
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
-- AUTO_INCREMENT dla tabeli `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `messages-topics`
--
ALTER TABLE `messages-topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
