-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas generowania: 20 Sty 2016, 01:05
-- Wersja serwera: 10.1.9-MariaDB
-- Wersja PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `rvat`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `contractors`
--

CREATE TABLE `contractors` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_polish_ci NOT NULL,
  `address` text COLLATE utf8_polish_ci NOT NULL,
  `nip` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `unit_id` int(11) NOT NULL,
  `userAdd_id` int(11) NOT NULL,
  `dateAdd` datetime NOT NULL,
  `userModified_id` int(11) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `contractors`
--

INSERT INTO `contractors` (`id`, `name`, `address`, `nip`, `unit_id`, `userAdd_id`, `dateAdd`, `userModified_id`, `dateModified`) VALUES
(2, 'Drugi testowy kontrahent', 'ul. Złota 9, 01-000 Warszawa', '222-222-22-22', 2, 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(4, 'Testowy kontrahent', 'ul. Testowa 10, Warszawa', '111-111-11-11', 1, 0, '0000-00-00 00:00:00', 7, '2016-01-13 23:47:06'),
(5, 'Kolejny testowy kontrahent', 'ul. Testowa 10, Warszawa', '222-222-22-22', 3, 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(7, 'TEST', 'TEST', '111-111-11-11', 1, 94, '2016-01-08 16:55:55', NULL, NULL),
(8, 'TEST3', 'TEST3', '331-333-22-44', 1, 94, '2016-01-08 17:11:23', NULL, NULL),
(9, 'Plej sp. z o.o', 'ul. Chorągwi Pancernej 43, 02-951 Warszawa', '113-277-83-98', 1, 94, '2016-01-08 18:13:50', 7, '2016-01-08 18:26:18'),
(10, 'Przykładowa firma Sp. z o.o.', 'al. Jerozolimskie 43, 01-000 Warszawa', '111-000-01-11', 8, 93, '2016-01-11 23:14:42', NULL, NULL),
(11, 'Przykładowa firma Sp. z o.o.', 'al. Jerozolimskie 43, 01-000 Warszawa', '111-000-01-11', 8, 93, '2016-01-12 20:58:41', NULL, NULL),
(12, 'Inny kontrahent', 'asdas', '122-222-22-22', 1, 7, '2016-01-12 23:03:07', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `alfa-2` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `alfa-3` varchar(3) COLLATE utf8_polish_ci NOT NULL,
  `code` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `isUE` tinyint(1) NOT NULL,
  `UEcode` varchar(3) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `countries`
--

INSERT INTO `countries` (`id`, `alfa-2`, `alfa-3`, `code`, `name`, `isUE`, `UEcode`) VALUES
(1, 'AT', 'AUT', 40, 'Austria', 1, NULL),
(2, 'BE', 'BEL', 56, 'Belgia', 1, NULL),
(3, 'BG', 'BGR', 100, 'Bułgaria', 1, NULL),
(4, 'HR', 'HRV', 191, 'Chorwacja', 1, NULL),
(5, 'CY', 'CYP', 196, 'Cypr', 1, NULL),
(6, 'CZ', 'CZE', 203, 'Czechy', 1, NULL),
(7, 'DK', 'DNK', 208, 'Dania', 1, NULL),
(8, 'EE', 'EST', 233, 'Estonia', 1, NULL),
(9, 'FI', 'FIN', 246, 'Finlandia', 1, NULL),
(10, 'FR', 'FRA', 250, 'Francja', 1, NULL),
(11, 'GR', 'GRC', 300, 'Grecja', 1, 'EL'),
(12, 'ES', 'ESP', 724, 'Hiszpania', 1, NULL),
(13, 'NL', 'NLD', 528, 'Holandia', 1, NULL),
(14, 'IE', 'IRL', 372, 'Irlandia', 1, NULL),
(15, 'LT', 'LTU', 440, 'Litwa', 1, NULL),
(16, 'LU', 'LUX', 442, 'Luksemburg', 1, NULL),
(17, 'LV', 'LVA', 428, 'Łotwa', 1, NULL),
(18, 'MT', 'MLT', 470, 'Malta', 1, NULL),
(19, 'DE', 'DEU', 276, 'Niemcy', 1, NULL),
(20, 'PL', 'POL', 616, 'Polska', 1, NULL),
(21, 'PT', 'PRT', 620, 'Portugalia', 1, NULL),
(22, 'RO', 'ROU', 642, 'Rumunia', 1, NULL),
(23, 'SK', 'SVK', 703, 'Słowacja', 1, NULL),
(24, 'SI', 'SVN', 705, 'Słowenia', 1, NULL),
(25, 'SE', 'SWE', 752, 'Szwecja', 1, NULL),
(26, 'HU', 'HUN', 348, 'Węgry', 1, NULL),
(27, 'GB', 'GBR', 826, 'Wielka Brytania', 1, 'UK'),
(28, 'IT', 'ITA', 380, 'Włochy', 1, NULL),
(29, 'AF', 'AFG', 4, 'Afganistan', 0, NULL),
(30, 'AL', 'ALB', 8, 'Albania', 0, NULL),
(31, 'DZ', 'DZA', 12, 'Algieria', 0, NULL),
(32, 'AD', 'AND', 20, 'Andora', 0, NULL),
(33, 'AO', 'AGO', 24, 'Angola', 0, NULL),
(34, 'AI', 'AIA', 660, 'Anguilla', 0, NULL),
(35, 'AQ', 'ATA', 10, 'Antarktyka', 0, NULL),
(36, 'AG', 'ATG', 28, 'Antigua i Barbuda', 0, NULL),
(37, 'SA', 'SAU', 682, 'Arabia Saudyjska', 0, NULL),
(38, 'AR', 'ARG', 32, 'Argentyna', 0, NULL),
(39, 'AM', 'ARM', 51, 'Armenia', 0, NULL),
(40, 'AW', 'ABW', 533, 'Aruba', 0, NULL),
(41, 'AU', 'AUS', 36, 'Australia', 0, NULL),
(42, 'AZ', 'AZE', 31, 'Azerbejdżan', 0, NULL),
(43, 'BS', 'BHS', 44, 'Bahamy', 0, NULL),
(44, 'BH', 'BHR', 48, 'Bahrajn', 0, NULL),
(45, 'BD', 'BGD', 50, 'Bangladesz', 0, NULL),
(46, 'BB', 'BRB', 52, 'Barbados', 0, NULL),
(47, 'BZ', 'BLZ', 84, 'Belize', 0, NULL),
(48, 'BJ', 'BEN', 204, 'Benin', 0, NULL),
(49, 'BM', 'BMU', 60, 'Bermudy', 0, NULL),
(50, 'BT', 'BTN', 64, 'Bhutan', 0, NULL),
(51, 'BY', 'BLR', 112, 'Białoruś', 0, NULL),
(52, 'BO', 'BOL', 68, 'Boliwia', 0, NULL),
(53, 'BQ', 'BES', 535, 'Bonaire, Sint Eustatius i Saba', 0, NULL),
(54, 'BA', 'BIH', 70, 'Bośnia i Hercegowina', 0, NULL),
(55, 'BW', 'BWA', 72, 'Botswana', 0, NULL),
(56, 'BR', 'BRA', 76, 'Brazylia', 0, NULL),
(57, 'BN', 'BRN', 96, 'Brunei', 0, NULL),
(58, 'IO', 'IOT', 86, 'Brytyjskie Terytorium Oceanu Indyjskiego', 0, NULL),
(59, 'VG', 'VGB', 92, 'Brytyjskie Wyspy Dziewicze', 0, NULL),
(60, 'BF', 'BFA', 854, 'Burkina Faso', 0, NULL),
(61, 'BI', 'BDI', 108, 'Burundi', 0, NULL),
(62, 'CL', 'CHL', 152, 'Chile', 0, NULL),
(63, 'CN', 'CHN', 156, 'Chiny', 0, NULL),
(64, 'CW', 'CUW', 531, 'Curaçao', 0, NULL),
(65, 'TD', 'TCD', 148, 'Czad', 0, NULL),
(66, 'ME', 'MNE', 499, 'Czarnogóra', 0, NULL),
(67, 'UM', 'UMI', 581, 'Dalekie Wyspy Mniejsze Stanów Zjednoczonych', 0, NULL),
(68, 'CD', 'COD', 180, 'Demokratyczna Republika Konga', 0, NULL),
(69, 'DM', 'DMA', 212, 'Dominika', 0, NULL),
(70, 'DO', 'DOM', 214, 'Dominikana', 0, NULL),
(71, 'DJ', 'DJI', 262, 'Dżibuti', 0, NULL),
(72, 'EG', 'EGY', 818, 'Egipt', 0, NULL),
(73, 'EC', 'ECU', 218, 'Ekwador', 0, NULL),
(74, 'ER', 'ERI', 232, 'Erytrea', 0, NULL),
(75, 'ET', 'ETH', 231, 'Etiopia', 0, NULL),
(76, 'FK', 'FLK', 238, 'Falklandy', 0, NULL),
(77, 'FJ', 'FJI', 242, 'Fidżi', 0, NULL),
(78, 'PH', 'PHL', 608, 'Filipiny', 0, NULL),
(79, 'TF', 'ATF', 260, 'Francuskie Terytoria Południowe i Antarktyczne', 0, NULL),
(80, 'GA', 'GAB', 266, 'Gabon', 0, NULL),
(81, 'GM', 'GMB', 270, 'Gambia', 0, NULL),
(82, 'GS', 'SGS', 239, 'Georgia Południowa i Sandwich Południowy', 0, NULL),
(83, 'GH', 'GHA', 288, 'Ghana', 0, NULL),
(84, 'GI', 'GIB', 292, 'Gibraltar', 0, NULL),
(85, 'GD', 'GRD', 308, 'Grenada', 0, NULL),
(86, 'GL', 'GRL', 304, 'Grenlandia', 0, NULL),
(87, 'GE', 'GEO', 268, 'Gruzja', 0, NULL),
(88, 'GU', 'GUM', 316, 'Guam', 0, NULL),
(89, 'GG', 'GGY', 831, 'Guernsey', 0, NULL),
(90, 'GY', 'GUY', 328, 'Gujana', 0, NULL),
(91, 'GF', 'GUF', 254, 'Gujana Francuska', 0, NULL),
(92, 'GP', 'GLP', 312, 'Gwadelupa', 0, NULL),
(93, 'GT', 'GTM', 320, 'Gwatemala', 0, NULL),
(94, 'GN', 'GIN', 324, 'Gwinea', 0, NULL),
(95, 'GW', 'GNB', 624, 'Gwinea Bissau', 0, NULL),
(96, 'GQ', 'GNQ', 226, 'Gwinea Równikowa', 0, NULL),
(97, 'HT', 'HTI', 332, 'Haiti', 0, NULL),
(98, 'HN', 'HND', 340, 'Honduras', 0, NULL),
(99, 'HK', 'HKG', 344, 'Hongkong', 0, NULL),
(100, 'IN', 'IND', 356, 'Indie', 0, NULL),
(101, 'ID', 'IDN', 360, 'Indonezja', 0, NULL),
(102, 'IQ', 'IRQ', 368, 'Irak', 0, NULL),
(103, 'IR', 'IRN', 364, 'Iran', 0, NULL),
(104, 'IS', 'ISL', 352, 'Islandia', 0, NULL),
(105, 'IL', 'ISR', 376, 'Izrael', 0, NULL),
(106, 'JM', 'JAM', 388, 'Jamajka', 0, NULL),
(107, 'JP', 'JPN', 392, 'Japonia', 0, NULL),
(108, 'YE', 'YEM', 887, 'Jemen', 0, NULL),
(109, 'JE', 'JEY', 832, 'Jersey', 0, NULL),
(110, 'JO', 'JOR', 400, 'Jordania', 0, NULL),
(111, 'KY', 'CYM', 136, 'Kajmany', 0, NULL),
(112, 'KH', 'KHM', 116, 'Kambodża', 0, NULL),
(113, 'CM', 'CMR', 120, 'Kamerun', 0, NULL),
(114, 'CA', 'CAN', 124, 'Kanada', 0, NULL),
(115, 'QA', 'QAT', 634, 'Katar', 0, NULL),
(116, 'KZ', 'KAZ', 398, 'Kazachstan', 0, NULL),
(117, 'KE', 'KEN', 404, 'Kenia', 0, NULL),
(118, 'KG', 'KGZ', 417, 'Kirgistan', 0, NULL),
(119, 'KI', 'KIR', 296, 'Kiribati', 0, NULL),
(120, 'CO', 'COL', 170, 'Kolumbia', 0, NULL),
(121, 'KM', 'COM', 174, 'Komory', 0, NULL),
(122, 'CG', 'COG', 178, 'Kongo', 0, NULL),
(123, 'KR', 'KOR', 410, 'Korea Południowa', 0, NULL),
(124, 'KP', 'PRK', 408, 'Korea Północna', 0, NULL),
(125, 'CR', 'CRI', 188, 'Kostaryka', 0, NULL),
(126, 'CU', 'CUB', 192, 'Kuba', 0, NULL),
(127, 'KW', 'KWT', 414, 'Kuwejt', 0, NULL),
(128, 'LA', 'LAO', 418, 'Laos', 0, NULL),
(129, 'LS', 'LSO', 426, 'Lesotho', 0, NULL),
(130, 'LB', 'LBN', 422, 'Liban', 0, NULL),
(131, 'LR', 'LBR', 430, 'Liberia', 0, NULL),
(132, 'LY', 'LBY', 434, 'Libia', 0, NULL),
(133, 'LI', 'LIE', 438, 'Liechtenstein', 0, NULL),
(134, 'MK', 'MKD', 807, 'Macedonia', 0, NULL),
(135, 'MG', 'MDG', 450, 'Madagaskar', 0, NULL),
(136, 'YT', 'MYT', 175, 'Majotta', 0, NULL),
(137, 'MO', 'MAC', 446, 'Makau', 0, NULL),
(138, 'MW', 'MWI', 454, 'Malawi', 0, NULL),
(139, 'MV', 'MDV', 462, 'Malediwy', 0, NULL),
(140, 'MY', 'MYS', 458, 'Malezja', 0, NULL),
(141, 'ML', 'MLI', 466, 'Mali', 0, NULL),
(142, 'MP', 'MNP', 580, 'Mariany Północne', 0, NULL),
(143, 'MA', 'MAR', 504, 'Maroko', 0, NULL),
(144, 'MQ', 'MTQ', 474, 'Martynika', 0, NULL),
(145, 'MR', 'MRT', 478, 'Mauretania', 0, NULL),
(146, 'MU', 'MUS', 480, 'Mauritius', 0, NULL),
(147, 'MX', 'MEX', 484, 'Meksyk', 0, NULL),
(148, 'FM', 'FSM', 583, 'Mikronezja', 0, NULL),
(149, 'MM', 'MMR', 104, 'Mjanma', 0, NULL),
(150, 'MD', 'MDA', 498, 'Mołdawia', 0, NULL),
(151, 'MC', 'MCO', 492, 'Monako', 0, NULL),
(152, 'MN', 'MNG', 496, 'Mongolia', 0, NULL),
(153, 'MS', 'MSR', 500, 'Montserrat', 0, NULL),
(154, 'MZ', 'MOZ', 508, 'Mozambik', 0, NULL),
(155, 'NA', 'NAM', 516, 'Namibia', 0, NULL),
(156, 'NR', 'NRU', 520, 'Nauru', 0, NULL),
(157, 'NP', 'NPL', 524, 'Nepal', 0, NULL),
(158, 'NE', 'NER', 562, 'Niger', 0, NULL),
(159, 'NG', 'NGA', 566, 'Nigeria', 0, NULL),
(160, 'NI', 'NIC', 558, 'Nikaragua', 0, NULL),
(161, 'NU', 'NIU', 570, 'Niue', 0, NULL),
(162, 'NF', 'NFK', 574, 'Norfolk', 0, NULL),
(163, 'NO', 'NOR', 578, 'Norwegia', 0, NULL),
(164, 'NC', 'NCL', 540, 'Nowa Kaledonia', 0, NULL),
(165, 'NZ', 'NZL', 554, 'Nowa Zelandia', 0, NULL),
(166, 'OM', 'OMN', 512, 'Oman', 0, NULL),
(167, 'PK', 'PAK', 586, 'Pakistan', 0, NULL),
(168, 'PW', 'PLW', 585, 'Palau', 0, NULL),
(169, 'PS', 'PSE', 275, 'Palestyna', 0, NULL),
(170, 'PA', 'PAN', 591, 'Panama', 0, NULL),
(171, 'PG', 'PNG', 598, 'Papua-Nowa Gwinea', 0, NULL),
(172, 'PY', 'PRY', 600, 'Paragwaj', 0, NULL),
(173, 'PE', 'PER', 604, 'Peru', 0, NULL),
(174, 'PN', 'PCN', 612, 'Pitcairn', 0, NULL),
(175, 'PF', 'PYF', 258, 'Polinezja Francuska', 0, NULL),
(176, 'PR', 'PRI', 630, 'Portoryko', 0, NULL),
(177, 'ZA', 'ZAF', 710, 'Republika Południowej Afryki', 0, NULL),
(178, 'CF', 'CAF', 140, 'Republika Środkowoafrykańska', 0, NULL),
(179, 'CV', 'CPV', 132, 'Republika Zielonego Przylądka', 0, NULL),
(180, 'RE', 'REU', 638, 'Reunion', 0, NULL),
(181, 'RU', 'RUS', 643, 'Rosja', 0, NULL),
(182, 'RW', 'RWA', 646, 'Rwanda', 0, NULL),
(183, 'EH', 'ESH', 732, 'Sahara Zachodnia', 0, NULL),
(184, 'KN', 'KNA', 659, 'Saint Kitts i Nevis', 0, NULL),
(185, 'LC', 'LCA', 662, 'Saint Lucia', 0, NULL),
(186, 'VC', 'VCT', 670, 'Saint Vincent i Grenadyny', 0, NULL),
(187, 'BL', 'BLM', 652, 'Saint-Barthélemy', 0, NULL),
(188, 'MF', 'MAF', 663, 'Saint-Martin', 0, NULL),
(189, 'PM', 'SPM', 666, 'Saint-Pierre i Miquelon', 0, NULL),
(190, 'SV', 'SLV', 222, 'Salwador', 0, NULL),
(191, 'WS', 'WSM', 882, 'Samoa', 0, NULL),
(192, 'AS', 'ASM', 16, 'Samoa Amerykańskie', 0, NULL),
(193, 'SM', 'SMR', 674, 'San Marino', 0, NULL),
(194, 'SN', 'SEN', 686, 'Senegal', 0, NULL),
(195, 'RS', 'SRB', 688, 'Serbia', 0, NULL),
(196, 'SC', 'SYC', 690, 'Seszele', 0, NULL),
(197, 'SL', 'SLE', 694, 'Sierra Leone', 0, NULL),
(198, 'SG', 'SGP', 702, 'Singapur', 0, NULL),
(199, 'SX', 'SXM', 534, 'Sint Maarten', 0, NULL),
(200, 'SO', 'SOM', 706, 'Somalia', 0, NULL),
(201, 'LK', 'LKA', 144, 'Sri Lanka', 0, NULL),
(202, 'US', 'USA', 840, 'Stany Zjednoczone', 0, NULL),
(203, 'SZ', 'SWZ', 748, 'Suazi', 0, NULL),
(204, 'SD', 'SDN', 729, 'Sudan', 0, NULL),
(205, 'SS', 'SSD', 728, 'Sudan Południowy', 0, NULL),
(206, 'SR', 'SUR', 740, 'Surinam', 0, NULL),
(207, 'SJ', 'SJM', 744, 'Svalbard i Jan Mayen', 0, NULL),
(208, 'SY', 'SYR', 760, 'Syria', 0, NULL),
(209, 'CH', 'CHE', 756, 'Szwajcaria', 0, NULL),
(210, 'TJ', 'TJK', 762, 'Tadżykistan', 0, NULL),
(211, 'TH', 'THA', 764, 'Tajlandia', 0, NULL),
(212, 'TW', 'TWN', 158, 'Tajwan', 0, NULL),
(213, 'TZ', 'TZA', 834, 'Tanzania', 0, NULL),
(214, 'TL', 'TLS', 626, 'Timor Wschodni', 0, NULL),
(215, 'TG', 'TGO', 768, 'Togo', 0, NULL),
(216, 'TK', 'TKL', 772, 'Tokelau', 0, NULL),
(217, 'TO', 'TON', 776, 'Tonga', 0, NULL),
(218, 'TT', 'TTO', 780, 'Trynidad i Tobago', 0, NULL),
(219, 'TN', 'TUN', 788, 'Tunezja', 0, NULL),
(220, 'TR', 'TUR', 792, 'Turcja', 0, NULL),
(221, 'TM', 'TKM', 795, 'Turkmenistan', 0, NULL),
(222, 'TC', 'TCA', 796, 'Turks i Caicos', 0, NULL),
(223, 'TV', 'TUV', 798, 'Tuvalu', 0, NULL),
(224, 'UG', 'UGA', 800, 'Uganda', 0, NULL),
(225, 'UA', 'UKR', 804, 'Ukraina', 0, NULL),
(226, 'UY', 'URY', 858, 'Urugwaj', 0, NULL),
(227, 'UZ', 'UZB', 860, 'Uzbekistan', 0, NULL),
(228, 'VU', 'VUT', 548, 'Vanuatu', 0, NULL),
(229, 'WF', 'WLF', 876, 'Wallis i Futuna', 0, NULL),
(230, 'VA', 'VAT', 336, 'Watykan', 0, NULL),
(231, 'VE', 'VEN', 862, 'Wenezuela', 0, NULL),
(232, 'VN', 'VNM', 704, 'Wietnam', 0, NULL),
(233, 'CI', 'CIV', 384, 'Wybrzeże Kości Słoniowej', 0, NULL),
(234, 'BV', 'BVT', 74, 'Wyspa Bouveta', 0, NULL),
(235, 'CX', 'CXR', 162, 'Wyspa Bożego Narodzenia', 0, NULL),
(236, 'IM', 'IMN', 833, 'Wyspa Man', 0, NULL),
(237, 'SH', 'SHN', 654, 'Wyspa Świętej Heleny, Wyspa Wniebowstąpienia i Tristan da Cunha', 0, NULL),
(238, 'AX', 'ALA', 248, 'Wyspy Alandzkie', 0, NULL),
(239, 'CK', 'COK', 184, 'Wyspy Cooka', 0, NULL),
(240, 'VI', 'VIR', 850, 'Wyspy Dziewicze Stanów Zjednoczonych', 0, NULL),
(241, 'HM', 'HMD', 334, 'Wyspy Heard i McDonalda', 0, NULL),
(242, 'CC', 'CCK', 166, 'Wyspy Kokosowe', 0, NULL),
(243, 'MH', 'MHL', 584, 'Wyspy Marshalla', 0, NULL),
(244, 'FO', 'FRO', 234, 'Wyspy Owcze', 0, NULL),
(245, 'SB', 'SLB', 90, 'Wyspy Salomona', 0, NULL),
(246, 'ST', 'STP', 678, 'Wyspy Świętego Tomasza i Książęca', 0, NULL),
(247, 'ZM', 'ZMB', 894, 'Zambia', 0, NULL),
(248, 'ZW', 'ZWE', 716, 'Zimbabwe', 0, NULL),
(249, 'AE', 'ARE', 784, 'Zjednoczone Emiraty Arabskie', 0, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `declarations`
--

CREATE TABLE `declarations` (
  `id` int(11) NOT NULL,
  `type` int(2) NOT NULL,
  `month` int(4) NOT NULL,
  `year` year(4) NOT NULL,
  `correction` tinyint(1) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `createdUser_id` int(11) NOT NULL,
  `dateModified` datetime DEFAULT NULL,
  `modifiedUser_id` int(11) DEFAULT NULL,
  `dateApproved` int(11) DEFAULT NULL,
  `approvedUser_id` int(11) DEFAULT NULL,
  `value01` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `declarations`
--

INSERT INTO `declarations` (`id`, `type`, `month`, `year`, `correction`, `dateCreated`, `createdUser_id`, `dateModified`, `modifiedUser_id`, `dateApproved`, `approvedUser_id`, `value01`) VALUES
(1, 1, 1, 2016, 0, '2016-01-18 07:24:25', 7, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_last_modified_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `invoiceDate` date NOT NULL,
  `contractorName` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `contractorAddress` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `documents`
--

INSERT INTO `documents` (`id`, `user_id`, `user_last_modified_id`, `created`, `modified`, `invoiceDate`, `contractorName`, `contractorAddress`) VALUES
(1, 7, NULL, '2015-12-09 11:32:18', NULL, '0000-00-00', 'Nazwa Kontrahenta', 'ul. Złota 9\r\n00-000 Warszawa'),
(2, 1, NULL, '2015-12-14 01:52:15', NULL, '0000-00-00', 'nazwa kontrahenta', 'adres kontrahenta'),
(3, 1, NULL, '2015-12-14 01:52:59', NULL, '0000-00-00', 'nazwa kontrahenta', 'adres kontrahenta'),
(4, 1, NULL, '2015-12-14 01:53:52', NULL, '0000-00-00', 'nazwa kontrahenta', 'adres kontrahenta'),
(5, 1, NULL, '2015-12-14 01:54:14', NULL, '0000-00-00', 'nazwa kontrahenta', 'adres kontrahenta'),
(6, 1, NULL, '2015-12-14 01:54:34', NULL, '0000-00-00', 'nazwa kontrahenta', 'adres kontrahenta'),
(7, 1, NULL, '2015-12-14 01:54:42', NULL, '0000-00-00', 'nazwa kontrahenta', 'adres kontrahenta'),
(8, 1, NULL, '2015-12-14 01:55:21', NULL, '0000-00-00', 'nazwa kontrahenta', 'adres kontrahenta'),
(9, 1, NULL, '2015-12-14 01:55:31', NULL, '0000-00-00', 'nazwa kontrahenta', 'adres kontrahenta'),
(10, 1, NULL, '2015-12-14 01:55:38', NULL, '0000-00-00', 'nazwa kontrahenta', 'adres kontrahenta'),
(11, 1, NULL, '2015-12-14 01:55:53', NULL, '0000-00-00', 'nazwa kontrahenta', 'adres kontrahenta'),
(12, 1, NULL, '2015-12-14 01:56:22', NULL, '0000-00-00', 'nazwa kontrahenta', 'adres kontrahenta'),
(13, 1, NULL, '2015-12-14 01:56:41', NULL, '0000-00-00', 'nazwa kontrahenta', 'adres kontrahenta'),
(14, 1, NULL, '2015-12-14 01:56:47', NULL, '0000-00-00', 'nazwa kontrahenta', 'adres kontrahenta'),
(15, 1, NULL, '2015-12-14 01:57:08', NULL, '0000-00-00', 'nazwa kontrahenta', 'adres kontrahenta'),
(16, 1, NULL, '2015-12-14 01:57:29', NULL, '0000-00-00', 'nazwa kontrahenta', 'adres kontrahenta'),
(17, 7, NULL, '2015-12-14 01:58:14', NULL, '0000-00-00', 'nazwa kontrahenta', 'adres kontrahenta'),
(18, 7, NULL, '2015-12-14 02:02:29', NULL, '0000-00-00', 'nazwa kontrahenta', 'adres kontrahenta');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `documentvalues`
--

CREATE TABLE `documentvalues` (
  `id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  `name` text COLLATE utf8_polish_ci NOT NULL,
  `price` float NOT NULL,
  `taxRate` float NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `documentvalues`
--

INSERT INTO `documentvalues` (`id`, `document_id`, `name`, `price`, `taxRate`, `amount`) VALUES
(1, 18, 'nazwa przedmiotu', 234.23, 23, 2),
(2, 18, 'nazwa drugiego', 435.47, 23, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` text NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `months`
--

CREATE TABLE `months` (
  `id` int(11) NOT NULL,
  `month` int(4) NOT NULL,
  `year` year(4) NOT NULL,
  `open` tinyint(1) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `userCreated` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateClosed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `months`
--

INSERT INTO `months` (`id`, `month`, `year`, `open`, `unit_id`, `userCreated`, `dateCreated`, `dateClosed`) VALUES
(1, 1, 2016, 1, 1, 7, '2016-01-15 02:08:06', NULL),
(2, 12, 2015, 0, 1, 7, '2015-12-01 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ranks`
--

CREATE TABLE `ranks` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `ranks`
--

INSERT INTO `ranks` (`id`, `name`) VALUES
(1, 'Superadmin'),
(2, 'Admin'),
(3, 'Administrator jednostki');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `registers`
--

CREATE TABLE `registers` (
  `id` int(11) NOT NULL,
  `typeOfRegister` tinyint(1) NOT NULL,
  `code` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `unit_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `description` text COLLATE utf8_polish_ci,
  `dateFrom` date DEFAULT NULL,
  `dateTo` date DEFAULT NULL,
  `disabled` tinyint(1) NOT NULL,
  `userCreated` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `userModified` int(11) NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `registers`
--

INSERT INTO `registers` (`id`, `typeOfRegister`, `code`, `unit_id`, `name`, `description`, `dateFrom`, `dateTo`, `disabled`, `userCreated`, `created`, `userModified`, `modified`) VALUES
(1, 0, 'TEST01', 1, 'Rejestr testowy2', 'To jest rejestr testowy', NULL, NULL, 0, 0, '0000-00-00 00:00:00', 7, '2016-01-13 17:47:41'),
(6, 1, 'yyyy', 1, 'yyyy', NULL, NULL, NULL, 0, 7, '2015-12-25 23:43:38', 0, '0000-00-00 00:00:00'),
(21, 1, 'TEST10', 1, 'Do szybkiego usunięcia', NULL, NULL, NULL, 0, 85, '2015-12-31 01:05:02', 0, '0000-00-00 00:00:00'),
(22, 0, 'AA', 1, 'AAA', NULL, '2016-01-08', '2016-01-09', 0, 85, '2015-12-31 01:06:34', 85, '2016-01-12 00:36:42'),
(23, 0, 'AAAAAA', 2, 'TEST22', NULL, NULL, NULL, 0, 85, '2015-12-31 12:26:06', 0, '0000-00-00 00:00:00'),
(24, 1, 'TEST', 1, 'TEST', NULL, NULL, NULL, 0, 85, '2015-12-31 12:33:08', 0, '0000-00-00 00:00:00'),
(25, 1, 'TEST10', 1, 'TEST10', NULL, NULL, NULL, 0, 85, '2015-12-31 12:37:26', 0, '0000-00-00 00:00:00'),
(26, 0, 'AAAA', 1, 'AAAA', NULL, '2016-01-10', '2016-01-20', 0, 85, '2015-12-31 12:40:33', 85, '2016-01-12 00:07:42'),
(27, 0, 'QQQ', 1, 'QQQ', NULL, '2016-01-09', '2016-01-19', 0, 85, '2015-12-31 12:41:49', 85, '2016-01-12 00:07:58'),
(28, 0, 'WWWW222', 1, 'WWWW', NULL, '2016-01-14', '2016-01-24', 0, 85, '2015-12-31 12:42:45', 85, '2016-01-12 00:08:24'),
(29, 1, 'BB', 1, 'BB', NULL, NULL, NULL, 0, 85, '2015-12-31 12:43:00', 0, '0000-00-00 00:00:00'),
(30, 1, 'TEST', 1, 'TEST', NULL, NULL, NULL, 0, 85, '2015-12-31 12:49:26', 0, '0000-00-00 00:00:00'),
(31, 1, 'TEST', 1, 'TEST', NULL, NULL, NULL, 0, 85, '2015-12-31 12:49:28', 0, '0000-00-00 00:00:00'),
(32, 1, 'TEST', 1, 'TEST', NULL, NULL, NULL, 0, 85, '2015-12-31 12:58:45', 0, '0000-00-00 00:00:00'),
(35, 0, 'GGG', 1, 'GGG', NULL, NULL, NULL, 0, 85, '2015-12-31 13:43:45', 85, '2016-01-12 00:17:51'),
(36, 0, 'FFF', 1, 'FFF', NULL, NULL, NULL, 0, 85, '2015-12-31 13:47:11', 0, '0000-00-00 00:00:00'),
(38, 0, 'HHH', 1, 'HHH', NULL, NULL, NULL, 0, 85, '2015-12-31 13:48:07', 0, '0000-00-00 00:00:00'),
(42, 0, 'RZ01', 8, 'Rejestr zakupów', NULL, '2016-01-01', NULL, 0, 93, '2016-01-04 01:01:24', 93, '2016-01-12 21:01:39'),
(43, 1, 'RS01', 8, 'Rejestr sprzedaży', NULL, NULL, NULL, 0, 93, '2016-01-04 01:01:50', 0, '0000-00-00 00:00:00'),
(44, 0, 'SP3/01/16', 1, 'Styczeń SP 3', NULL, NULL, NULL, 0, 7, '2016-01-09 18:27:07', 0, '0000-00-00 00:00:00'),
(45, 1, 'SP3/RS/01/16', 1, 'RSPRZ/SP3/01/16', NULL, NULL, NULL, 0, 7, '2016-01-09 18:47:44', 0, '0000-00-00 00:00:00'),
(46, 0, 'TEST1111', 1, 'TEST1111', NULL, NULL, NULL, 1, 7, '2016-01-11 01:35:33', 85, '2016-01-12 00:22:41'),
(47, 0, 'TEST', 3, 'TEST', NULL, NULL, NULL, 0, 7, '2016-01-14 01:33:54', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `registerspositions`
--

CREATE TABLE `registerspositions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_last_modified_id` int(11) NOT NULL,
  `register_id` int(11) NOT NULL,
  `month` int(4) NOT NULL,
  `year` year(4) NOT NULL,
  `month_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `territory` int(2) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `reverseCharge` tinyint(1) NOT NULL,
  `type` int(11) NOT NULL,
  `vatDocumentType` int(11) NOT NULL,
  `registrationDate` date NOT NULL,
  `invoiceNumber` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `invoicePlace` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `dateIssue` date NOT NULL,
  `dateSellBuy` date NOT NULL,
  `dateRecived` date NOT NULL,
  `contractorNIP` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `contractorName` text COLLATE utf8_polish_ci NOT NULL,
  `contractorAddress` text COLLATE utf8_polish_ci NOT NULL,
  `taxDeduction` decimal(5,2) DEFAULT NULL,
  `dateAdd` datetime NOT NULL,
  `dateModified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `registerspositions`
--

INSERT INTO `registerspositions` (`id`, `user_id`, `user_last_modified_id`, `register_id`, `month`, `year`, `month_id`, `position`, `territory`, `country_id`, `reverseCharge`, `type`, `vatDocumentType`, `registrationDate`, `invoiceNumber`, `invoicePlace`, `dateIssue`, `dateSellBuy`, `dateRecived`, `contractorNIP`, `contractorName`, `contractorAddress`, `taxDeduction`, `dateAdd`, `dateModified`) VALUES
(26, 7, 7, 1, 12, 2015, 0, 0, 0, 0, 0, 0, 2, '0000-00-00', 'a/a/2015', 'Warszawa', '2012-07-08', '2012-07-08', '0000-00-00', '222-333-44-55', 'nazwa', 'Złota 9, Warszawa', '80.00', '2015-12-29 00:55:10', '2016-01-10 23:23:03'),
(27, 7, 7, 1, 12, 2015, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', 'TEST', 'Warszawa', '2015-12-12', '2015-12-12', '0000-00-00', '222-333-44-55', 'Nazwa', 'Adres', '60.00', '2015-12-29 01:13:08', '2016-01-10 23:17:19'),
(28, 7, 0, 1, 12, 2015, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', 'TEST', 'Warszawa', '2015-12-12', '2015-12-12', '0000-00-00', '222-333-44-55', 'Nazwa', 'Adres', NULL, '2015-12-29 01:13:29', '0000-00-00 00:00:00'),
(29, 7, 0, 1, 12, 2015, 0, 0, 0, 0, 0, 0, 0, '2015-12-12', 'TEST', 'Warszawa', '2015-12-12', '2015-12-12', '2015-12-12', '222-333-44-55', 'Nazwa', 'Adres', NULL, '2015-12-29 01:15:50', '0000-00-00 00:00:00'),
(30, 7, 0, 1, 12, 2015, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', 'TEST01', 'Warszawa', '0000-00-00', '0000-00-00', '0000-00-00', '123-456-78-92', 'Nazwa Kontrahenta', 'Adres', NULL, '2015-12-29 01:16:57', '0000-00-00 00:00:00'),
(32, 7, 0, 17, 12, 2015, 0, 23, 0, 0, 0, 0, 0, '0000-00-00', 'dsadasd', 'dasdsadas', '0000-00-00', '0000-00-00', '0000-00-00', '321-312-31-23', 'dsadsa', 'dsadasda', NULL, '2015-12-29 01:37:24', '0000-00-00 00:00:00'),
(33, 7, 94, 1, 12, 2015, 0, 0, 0, 0, 0, 0, 0, '2015-12-12', 'TEST', 'Warszawa', '2015-12-12', '2015-12-12', '2015-12-12', '222-333-44-55', 'Nazwa', 'Adres', NULL, '2015-12-29 01:41:19', '2016-01-09 13:15:58'),
(35, 7, 0, 1, 12, 2015, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '12-12-2012', '12-12-2012', '2012-12-12', '2012-12-12', '2012-12-12', '121-220-12-12', '12-12-2012', '12-12-2012', NULL, '2015-12-29 01:51:31', '0000-00-00 00:00:00'),
(36, 7, 0, 18, 12, 2015, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', 'FA/23/543/34', 'Warszawa', '2015-12-12', '2015-12-12', '2015-12-12', '132-456-45-64', 'Shell BP', 'Warszawa, ul. Krzywa 12', NULL, '2015-12-29 01:57:09', '0000-00-00 00:00:00'),
(37, 7, 0, 18, 12, 2015, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', 'FA/23/543/34', 'Warszawa', '2015-12-12', '2015-12-12', '2015-12-12', '123-213-21-31', 'Shell BP', 'Warszawa, ul. Krzywa 12', NULL, '2015-12-29 02:02:39', '0000-00-00 00:00:00'),
(38, 7, 0, 19, 12, 2015, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', 'dasdsad', 'sad', '1970-01-01', '1970-01-01', '1970-01-01', '213-213-21-32', 'dasdsad', 'sadsadas', NULL, '2015-12-29 02:04:05', '0000-00-00 00:00:00'),
(39, 7, 0, 5, 12, 2015, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '333', 'sdC', '2015-12-22', '2015-12-22', '2015-12-22', '727-012-65-94', 'asdhbjk', 'jksdnc', NULL, '2015-12-29 11:18:25', '0000-00-00 00:00:00'),
(40, 7, 0, 1, 12, 2015, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', 'FA/4654/4564', 'Wrocław', '2016-12-12', '2016-12-12', '2016-12-12', '123-145-78-94', 'OBI one Kenobi', 'Puławska 22, Warszawa', NULL, '2016-01-03 02:03:19', '0000-00-00 00:00:00'),
(41, 7, 0, 1, 12, 2015, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', 'AAAAAAA', 'dasdas', '2015-12-12', '2015-12-12', '2015-12-12', '121-212-12-12', 'dsasa', 'dasda', NULL, '2015-12-30 00:02:44', '0000-00-00 00:00:00'),
(42, 85, 0, 1, 12, 2015, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', 'AAAAAA', 'AAAAAA', '1970-01-01', '1970-01-01', '1970-01-01', '232-323-21-32', 'dasdasdsa', 'dsadasdsad', NULL, '2015-12-31 16:28:47', '0000-00-00 00:00:00'),
(43, 85, 0, 1, 12, 2015, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', 'BBB', 'Warszawa', '1970-01-01', '1970-01-01', '1970-01-01', '121-212-12-12', 'NBasdas', 'dasdas', NULL, '2015-12-31 16:39:55', '0000-00-00 00:00:00'),
(44, 85, 0, 1, 12, 2015, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', 'dasdas', 'dasdsa', '1970-01-01', '1970-01-01', '1970-01-01', '132-213-21-32', 'dasdasd', 'dasdasdas', NULL, '2015-12-31 16:41:42', '0000-00-00 00:00:00'),
(46, 7, 7, 1, 12, 2015, 0, 0, 0, 0, 0, 0, 0, '2015-12-01', 'dasdsad', 'dasdasdas', '2015-12-03', '2015-12-23', '2015-12-04', '232-132-13-21', 'dasdsa', 'dsadas', NULL, '2016-01-03 02:00:29', '2016-01-11 00:38:39'),
(47, 7, 0, 40, 1, 2016, 0, 0, 0, 0, 0, 0, 0, '2016-01-07', 'AAAA', 'AAAA', '2016-01-07', '2016-01-15', '2016-01-14', '121-222-12-12', 'AAAA', 'AAAA', NULL, '2016-01-02 15:58:40', '0000-00-00 00:00:00'),
(48, 7, 7, 1, 1, 2016, 0, 16, 0, NULL, 0, 0, 0, '2016-01-12', '1111111', 'dsadasasdasd', '2016-01-06', '2016-01-07', '2016-01-01', '231-232-13-21', 'dsadsa', 'dasdsadsa', '100.00', '2016-01-03 11:23:24', '2016-01-13 17:47:46'),
(50, 7, 0, 1, 1, 2016, 0, 2, 0, 0, 0, 0, 0, '2015-12-31', '333333333', 'Warszawa', '2016-01-01', '2016-01-01', '2016-01-01', '111-111-11-11', 'a/a/2015', 'a/a/2015', NULL, '2016-01-03 11:33:18', '0000-00-00 00:00:00'),
(51, 7, 0, 6, 1, 2016, 0, 0, 0, 0, 0, 0, 0, '2015-12-31', 'XXXXX', 'XXXXX', '2016-01-01', '2016-01-01', '2016-01-01', '121-212-12-12', 'XXXXX', 'XXXXX', NULL, '2016-01-03 22:45:02', '0000-00-00 00:00:00'),
(52, 7, 0, 6, 1, 2016, 0, 0, 0, 0, 0, 0, 0, '2015-12-31', 'YYYY', 'YYYY', '2016-01-01', '2016-01-01', '2016-01-01', '111-111-11-11', 'YYYY', 'YYYY', NULL, '2016-01-03 22:47:04', '0000-00-00 00:00:00'),
(53, 85, 0, 6, 1, 2016, 0, 0, 0, 0, 0, 0, 0, '2015-12-31', 'ZZZ', 'ZZZ', '2016-01-01', '2016-01-01', '2016-01-01', '111-111-11-11', 'ZZZ', 'ZZZ', NULL, '2016-01-03 23:27:51', '0000-00-00 00:00:00'),
(54, 85, 0, 6, 1, 2016, 0, 0, 0, 0, 0, 0, 0, '2015-12-31', 'MMMAZZ', 'MMM', '2016-01-01', '2016-01-01', '2016-01-01', '111-111-11-11', 'MMM', 'MMM', NULL, '2016-01-03 23:42:23', '0000-00-00 00:00:00'),
(55, 7, 0, 33, 1, 2016, 0, 0, 1, 0, 0, 2, 0, '2015-12-31', 'YYYY', 'YYYY', '2016-01-01', '2016-01-01', '2016-01-01', '111-111-11-11', 'YYYY', 'YYYY', NULL, '2016-01-05 01:30:36', '0000-00-00 00:00:00'),
(56, 7, 0, 1, 1, 2016, 0, 3, 0, 0, 0, 13, 0, '2016-01-08', 'dsadas', 'dsadas', '2016-01-08', '2016-01-08', '2016-01-08', '111-111-11-11', 'dsadsa', 'dsada', NULL, '2016-01-08 16:22:10', '0000-00-00 00:00:00'),
(57, 7, 7, 1, 1, 2016, 0, 1, 0, NULL, 0, 14, 0, '2016-01-08', 'dsadasKONIEC', 'dsadsa', '2016-01-08', '2016-01-08', '2016-01-08', '111-111-11-11', 'dsada', 'dsadas', NULL, '2016-01-08 16:24:28', '2016-01-13 21:01:59'),
(58, 94, 0, 1, 1, 2016, 0, 4, 0, 0, 0, 11, 0, '2016-01-07', 'dasdsa', 'dsadas', '2016-01-08', '2016-01-08', '2016-01-08', '111-111-11-11', 'ddsa', 'dsad', NULL, '2016-01-08 16:55:31', '0000-00-00 00:00:00'),
(59, 94, 7, 1, 1, 2016, 0, 11, 0, 0, 0, 3, 0, '2016-01-08', 'TEST', 'TEST', '2016-01-08', '2016-01-08', '2016-01-08', '111-111-11-11', 'TEST', 'TEST', '93.00', '2016-01-08 16:55:55', '2016-01-10 02:46:52'),
(60, 94, 0, 1, 1, 2016, 0, 5, 0, 0, 0, 11, 0, '2016-01-08', 'TEST2', 'TEST2', '2016-01-08', '2016-01-08', '2016-01-08', '222-333-44-55', 'TEST2', 'TEST2', NULL, '2016-01-08 17:10:44', '0000-00-00 00:00:00'),
(61, 94, 0, 1, 1, 2016, 0, 6, 0, 0, 0, 13, 0, '2016-01-08', 'TEST3', 'TEST3', '2016-01-08', '2016-01-08', '2016-01-08', '331-333-22-44', 'TEST3', 'TEST3', NULL, '2016-01-08 17:11:23', '0000-00-00 00:00:00'),
(62, 94, 0, 1, 1, 2016, 0, 7, 0, 0, 0, 11, 0, '2016-01-08', 'FA/24312', 'Łódź', '2016-01-08', '2016-01-08', '2016-01-08', '222-222-22-22', 'Kolejny testowy kontrahent', 'ul. Testowa 10, Warszawa', NULL, '2016-01-08 18:12:21', '0000-00-00 00:00:00'),
(63, 94, 7, 1, 1, 2016, 0, 10, 0, 0, 0, 10, 0, '2016-01-08', 'Testowa faktura', 'Kraków', '2016-01-08', '2016-01-08', '2016-01-08', '113-277-83-98', 'Plej sp. z o.o', 'ul. Chorągwi Pancernej 43, 02-951 Warszawa', NULL, '2016-01-08 18:13:50', '2016-01-08 18:25:10'),
(64, 7, 0, 1, 1, 2016, 0, 8, 0, 0, 0, 11, 0, '2016-01-08', 'dasda', 'dasdas', '2016-01-08', '2016-01-08', '2016-01-08', '222-222-22-22', 'Kolejny testowy kontrahent', 'ul. Testowa 10, Warszawa', NULL, '2016-01-08 18:37:22', '0000-00-00 00:00:00'),
(65, 94, 94, 22, 1, 2016, 0, 0, 0, 0, 0, 11, 0, '2016-01-09', 'dsadsa', 'dsadsad', '2016-01-09', '2016-01-09', '2016-01-09', '111-111-11-11', 'Testowy kontrahent', 'ul. Testowa 10, Warszawa', NULL, '2016-01-09 13:19:43', '2016-01-09 13:19:47'),
(66, 7, 7, 1, 1, 2016, 0, 13, 0, NULL, 0, 10, 0, '2016-01-09', 'dasdas', 'dasdas', '2016-01-10', '2016-01-10', '2016-01-10', '222-222-22-22', 'Kolejny testowy kontrahent', 'ul. Testowa 10, Warszawa', '100.00', '2016-01-10 00:54:36', '2016-01-10 03:13:21'),
(67, 7, 7, 1, 1, 2016, 0, 12, 0, NULL, 0, 13, 0, '2016-01-10', 'TEST', 'TEST', '2016-01-10', '2016-01-10', '2016-01-10', '222-222-22-22', 'Kolejny testowy kontrahent', 'ul. Testowa 10, Warszawa', '100.00', '2016-01-10 02:52:42', '2016-01-10 03:13:13'),
(68, 7, 85, 1, 1, 2016, 0, 14, 0, NULL, 0, 10, 2, '2016-01-31', 'TEST', 'TEST', '2016-01-31', '2016-01-31', '2016-01-31', '222-222-22-22', 'Kolejny testowy kontrahent', 'ul. Testowa 10, Warszawa', '100.00', '2016-01-10 02:59:55', '2016-01-11 23:46:16'),
(70, 7, 0, 44, 2, 2016, 0, 0, 0, NULL, 0, 0, 1, '2016-01-10', 'TEST', 'TEST', '2016-01-11', '2016-01-11', '2016-01-11', '113-277-83-98', 'Plej sp. z o.o', 'ul. Chorągwi Pancernej 43, 02-951 Warszawa', '100.00', '2016-01-11 00:05:57', '0000-00-00 00:00:00'),
(71, 7, 7, 44, 6, 2016, 0, 0, 0, NULL, 0, 0, 1, '2016-01-10', 'TEST', 'TEST', '2016-01-11', '2016-01-11', '2016-01-11', '113-277-83-98', 'Plej sp. z o.o', 'ul. Chorągwi Pancernej 43, 02-951 Warszawa', '100.00', '2016-01-11 00:11:29', '2016-01-11 00:29:22'),
(72, 7, 0, 44, 1, 2016, 0, 0, 0, NULL, 0, 0, 1, '2016-01-10', 'TEST', 'TEST', '2016-01-11', '2016-01-11', '2016-01-11', '113-277-83-98', 'Plej sp. z o.o', 'ul. Chorągwi Pancernej 43, 02-951 Warszawa', '100.00', '2016-01-11 00:12:32', '0000-00-00 00:00:00'),
(73, 7, 0, 44, 1, 2016, 0, 0, 0, NULL, 0, 0, 1, '2016-01-10', 'TEST', 'TEST', '2016-01-11', '2016-01-11', '2016-01-11', '113-277-83-98', 'Plej sp. z o.o', 'ul. Chorągwi Pancernej 43, 02-951 Warszawa', '100.00', '2016-01-11 00:14:16', '0000-00-00 00:00:00'),
(74, 7, 0, 44, 1, 2016, 0, 0, 0, NULL, 0, 0, 1, '2016-01-10', 'TEST1', 'TEST1', '2016-01-11', '2016-01-11', '2016-01-11', '113-277-83-98', 'Plej sp. z o.o', 'ul. Chorągwi Pancernej 43, 02-951 Warszawa', '100.00', '2016-01-11 00:16:47', '0000-00-00 00:00:00'),
(75, 7, 0, 44, 2, 2016, 0, 0, 0, NULL, 0, 0, 1, '2016-01-10', 'TEST Luty', 'TEST Luty', '2016-01-11', '2016-01-11', '2016-01-11', '331-333-22-44', 'TEST3', 'TEST3', '100.00', '2016-01-11 00:19:47', '0000-00-00 00:00:00'),
(76, 7, 7, 44, 3, 2016, 0, 0, 0, NULL, 0, 0, 3, '2016-01-10', 'TEST Marzec', 'TEST Marzec', '2016-01-11', '2016-01-11', '2016-01-11', '222-222-22-22', 'Kolejny testowy kontrahent', 'ul. Testowa 10, Warszawa', '100.00', '2016-01-11 00:23:47', '2016-01-11 00:24:23'),
(77, 7, 0, 44, 4, 2016, 0, 0, 0, NULL, 0, 0, 2, '2016-01-10', 'TEST Kwiecień', 'TEST Kwiecień', '2016-01-11', '2016-01-11', '2016-01-11', '113-277-83-98', 'Plej sp. z o.o', 'ul. Chorągwi Pancernej 43, 02-951 Warszawa', '100.00', '2016-01-11 00:25:03', '0000-00-00 00:00:00'),
(78, 7, 7, 44, 4, 2016, 0, 0, 0, NULL, 0, 0, 2, '2016-01-10', 'TEST Kwiecień', 'TEST Kwiecień', '2016-01-11', '2016-01-11', '2016-01-11', '113-277-83-98', 'Plej sp. z o.o', 'ul. Chorągwi Pancernej 43, 02-951 Warszawa', '100.00', '2016-01-11 00:25:03', '2016-01-11 00:27:12'),
(79, 93, 93, 42, 1, 2016, 0, 0, 1, 16, 0, 0, 3, '2016-01-11', 'TEST', 'TEST', '2016-01-11', '2016-01-11', '2016-01-11', '111-000-01-11', 'Przykładowa firma Sp. z o.o.', 'al. Jerozolimskie 43, 01-000 Warszawa', '100.00', '2016-01-11 23:21:59', '2016-01-12 02:08:26'),
(80, 85, 85, 1, 1, 2016, 0, 15, 0, NULL, 0, 0, 1, '2016-01-12', 'TEST 12.Sty', 'TEST 12.Sty', '2016-01-12', '2016-01-12', '2016-01-16', '113-277-83-98', 'Plej sp. z o.o', 'ul. Chorągwi Pancernej 43, 02-951 Warszawa', '100.00', '2016-01-11 23:47:03', '2016-01-11 23:48:23'),
(81, 85, 0, 46, 1, 2016, 0, 0, 0, NULL, 0, 0, 1, '2016-01-11', 'TEST', 'TEST', '2016-01-11', '2016-01-11', '2016-01-11', '113-277-83-98', 'Plej sp. z o.o', 'ul. Chorągwi Pancernej 43, 02-951 Warszawa', '100.00', '2016-01-11 23:59:51', '0000-00-00 00:00:00'),
(82, 7, 0, 1, 1, 2016, 0, 9, 0, NULL, 0, 0, 2, '2016-01-12', 'dasds', 'dasdsa', '2016-01-12', '2016-01-12', '2016-01-12', '113-277-83-98', 'Plej sp. z o.o', 'ul. Chorągwi Pancernej 43, 02-951 Warszawa', '100.00', '2016-01-12 01:25:14', '0000-00-00 00:00:00'),
(83, 7, 7, 26, 1, 2016, 0, 0, 1, 5, 0, 0, 3, '2016-01-12', 'dsadsa', 'dasda', '2016-01-12', '2016-01-12', '2016-01-12', '113-277-83-98', 'Plej sp. z o.o', 'ul. Chorągwi Pancernej 43, 02-951 Warszawa', '100.00', '2016-01-12 01:27:03', '2016-01-13 01:34:02'),
(85, 93, 0, 42, 1, 2016, 0, 0, 0, NULL, 0, 0, 2, '2016-01-01', 'TEST222', 'Łodź', '2016-01-01', '2016-01-01', '2016-01-01', '111-000-01-11', 'Przykładowa firma Sp. z o.o.', 'al. Jerozolimskie 43, 01-000 Warszawa', '100.00', '2016-01-12 02:10:02', '0000-00-00 00:00:00'),
(86, 7, 0, 26, 2, 2016, 0, 0, 0, NULL, 0, 10, 1, '2016-01-12', '1/1/2016', 'Łódź', '2016-01-12', '2016-01-12', '2016-01-12', '111-111-11-11', 'aaa', 'aaa', '100.00', '2016-01-12 14:57:04', '0000-00-00 00:00:00'),
(87, 7, 0, 26, 1, 2016, 0, 0, 0, NULL, 0, 0, 1, '2016-01-12', '2', 'Łódź', '2016-02-10', '2016-02-11', '2016-02-18', '222-222-22-22', 'Kolejny testowy kontrahent', 'ul. Testowa 10, Warszawa', '100.00', '2016-01-12 14:59:04', '0000-00-00 00:00:00'),
(88, 7, 0, 1, 1, 2016, 0, 17, 0, NULL, 0, 0, 0, '2016-01-13', 'KONIECTEST', 'KONIECTEST', '2016-01-13', '2016-01-13', '2016-01-13', '331-333-22-44', 'TEST3', 'TEST3', '100.00', '2016-01-13 21:04:13', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `registerspositionsvalues`
--

CREATE TABLE `registerspositionsvalues` (
  `id` int(11) NOT NULL,
  `registerId` int(11) NOT NULL,
  `type` text COLLATE utf8_polish_ci NOT NULL,
  `netto` decimal(19,2) NOT NULL,
  `tax` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `registerspositionsvalues`
--

INSERT INTO `registerspositionsvalues` (`id`, `registerId`, `type`, `netto`, `tax`) VALUES
(4, 11, '0', '25.10', 23),
(5, 12, '0', '25.10', 23),
(6, 13, '0', '25.10', 23),
(7, 14, '0', '25.10', 23),
(8, 15, '0', '25.10', 23),
(9, 16, '0', '25.10', 23),
(10, 17, '0', '25.10', 23),
(11, 18, '0', '25.10', 23),
(12, 19, '0', '25.10', 23),
(13, 20, '0', '25.10', 23),
(14, 21, '0', '25.10', 23),
(15, 22, '0', '25.10', 23),
(16, 23, '0', '25.10', 23),
(17, 24, '0', '23.00', 23),
(18, 25, 'das', '23.00', 23),
(21, 28, 'Rzecz', '10.00', 23),
(22, 29, 'Rzecz', '10.00', 23),
(23, 30, 'Rodzaj zakupu', '10.00', 23),
(24, 31, 'Marakon jajeczny', '234.00', 23),
(25, 31, 'Ryza papieru', '10.00', 8),
(26, 32, 'dasdas', '12.00', 23),
(28, 34, '12-12-2012', '12.00', 23),
(29, 35, '12-12-2012', '12.00', 23),
(30, 36, 'Paliwo', '50.00', 23),
(31, 37, 'Paliwo z dwójki', '10.00', 23),
(32, 37, 'Batonik bezglutenowy', '2.00', 23),
(33, 38, 'dsadasd', '234.00', 23),
(34, 39, 'efgq', '222.00', 23),
(35, 39, 'asdcf', '222.00', 8),
(36, 40, 'Cegły budowlane', '500.00', 8),
(37, 41, 'das', '1.00', 23),
(38, 42, 'dsadasdas', '12.00', 23),
(39, 43, 'dsadasd', '12.00', 23),
(40, 44, 'dsadasd', '12.00', 23),
(43, 47, 'AAAA', '12.00', 23),
(58, 49, 'AAA', '12.00', 23),
(59, 50, 'a/a/2015', '12.00', 23),
(60, 51, 'XXXXX', '12.00', 23),
(61, 52, 'YYYY', '12.00', 23),
(65, 53, 'ZZZ', '11.00', 23),
(68, 54, 'MMM', '1000.00', 23),
(70, 55, 'YYYY', '1.00', 23),
(72, 45, 'ddasda', '12.00', 23),
(79, 56, 'dasdsa', '12.00', 23),
(81, 58, 'dsa', '12.00', 23),
(83, 60, 'TEST2', '12.00', 23),
(84, 61, 'TEST3', '23.00', 23),
(85, 62, 'Tankowanie paliwa', '100.00', 23),
(93, 63, 'Strona internetowa', '15000.00', 23),
(94, 8, 'VV', '10.00', 23),
(95, 8, 'ZZ', '20.00', 23),
(96, 8, 'YY', '500.00', 23),
(97, 64, 'dasdsa', '132.00', 23),
(98, 64, 'dsadas', '2323.00', 23),
(99, 64, 'dasda', '23233.00', 23),
(100, 33, 'Rzecz', '10.00', 23),
(103, 65, 'dsadsa', '23.00', 23),
(113, 59, 'TEST', '1.00', 23),
(125, 67, 'TEST', '12.00', -1),
(126, 66, 'dsadsa', '12.00', -1),
(129, 69, 'TEST', '11.00', 23),
(130, 27, 'Rzecz', '10.00', 23),
(133, 26, 'nazwa przedmiotu', '25.10', 8),
(134, 26, 'dsad', '12.00', 23),
(135, 26, 'das', '32.00', 23),
(136, 70, 'TEST', '11.00', 23),
(138, 72, 'TEST', '11.00', 23),
(139, 73, 'TEST', '11.00', 23),
(140, 74, 'TEST1', '11.00', 23),
(141, 75, 'TEST Luty', '11.00', 23),
(143, 76, 'TEST Marzec', '11.00', 23),
(144, 77, 'TEST Kwiecień', '23.00', 23),
(147, 78, 'TEST Kwiecień', '66.00', 23),
(148, 71, 'TEST', '11.00', 23),
(149, 46, 'dsada', '123.00', -1),
(160, 68, 'TEST', '12.00', -1),
(164, 80, 'TEST 12.Sty', '12.00', 23),
(165, 81, 'TEST', '12.00', 23),
(166, 82, 'das', '12.00', 23),
(169, 84, 'TEST', '12.00', 23),
(170, 79, 'TEST', '55.00', 23),
(171, 85, 'dsa', '3.00', 23),
(172, 86, 'qwerty', '1000.00', 23),
(173, 87, 'zxcvb', '111.00', 23),
(174, 88, 'askc', '0.00', 23),
(176, 83, 'dasd', '25.00', 23),
(177, 48, 'dsadasda', '21.00', 23),
(180, 57, 'ddsa', '12.00', 23),
(181, 88, 'KONIECTEST', '23.00', 23);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(255) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'add:jb:documents'),
(2, 'view:jb:documents'),
(3, 'add:all:users'),
(4, 'add:all:units'),
(5, 'view:all:documents'),
(6, 'view:all:users'),
(7, 'add:my:register'),
(8, 'view:all:register'),
(9, 'update:all:users'),
(10, 'delete:all:users'),
(11, 'add:all:register'),
(12, 'delete:all:register'),
(13, 'view:all:units'),
(14, 'view:my:units'),
(15, 'add:all:units'),
(16, 'udpate:all:units'),
(17, 'delete:all:register'),
(18, 'delete:my:register'),
(19, 'view:my:register'),
(20, 'view:my:users'),
(21, 'delete:my:empty-register'),
(22, 'update:all:register'),
(23, 'update:my:register'),
(24, 'update:all:units'),
(25, 'update:my:units'),
(26, 'view:all:contractors'),
(27, 'view:my:contractors'),
(28, 'add:all:contractors'),
(29, 'add:my:contractors'),
(30, 'update:all:contractors'),
(31, 'update:my:contractors'),
(32, 'delete:all:contractors'),
(33, 'delete:my:contractors'),
(34, 'delete:all:units'),
(35, 'add:all:unit-types'),
(36, 'view:all:months'),
(37, 'view:my:months'),
(38, 'close:my:months'),
(39, 'view:all:declarations'),
(40, 'view:my:declarations'),
(41, 'view:all:unit-types'),
(42, 'delete:all:unit-types'),
(43, 'update:my:declarations'),
(44, 'add:my:declarations');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rolestoranks`
--

CREATE TABLE `rolestoranks` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `rolestoranks`
--

INSERT INTO `rolestoranks` (`id`, `role_id`, `rank_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 1, 3),
(20, 2, 3),
(21, 7, 3),
(22, 14, 3),
(23, 18, 3),
(24, 19, 3),
(25, 19, 1),
(26, 20, 1),
(27, 20, 3),
(28, 22, 1),
(30, 23, 3),
(31, 24, 1),
(32, 25, 3),
(33, 26, 1),
(34, 27, 1),
(35, 27, 3),
(36, 28, 1),
(37, 29, 1),
(38, 30, 1),
(39, 31, 1),
(40, 29, 3),
(41, 31, 3),
(42, 32, 1),
(43, 33, 1),
(44, 33, 3),
(45, 34, 1),
(46, 35, 1),
(47, 36, 1),
(48, 37, 1),
(49, 37, 3),
(50, 38, 1),
(51, 38, 3),
(52, 39, 1),
(53, 40, 1),
(54, 40, 3),
(55, 41, 1),
(56, 42, 1),
(57, 43, 1),
(58, 43, 3),
(59, 44, 1),
(60, 44, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `roletouser`
--

CREATE TABLE `roletouser` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `roletouser`
--

INSERT INTO `roletouser` (`id`, `user_id`, `role_id`) VALUES
(1, 7, 1),
(2, 7, 2),
(3, 7, 3),
(4, 7, 4),
(5, 7, 5),
(6, 7, 6),
(7, 7, 7),
(8, 7, 8),
(9, 7, 9),
(10, 7, 10),
(11, 7, 11),
(12, 7, 12),
(13, 7, 13),
(14, 7, 14),
(15, 7, 15),
(16, 7, 16);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `selltypes`
--

CREATE TABLE `selltypes` (
  `id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `name` text COLLATE utf8_polish_ci NOT NULL,
  `czySprzedaz` tinyint(1) NOT NULL,
  `czyZakup` tinyint(1) NOT NULL,
  `czyKraj` tinyint(1) NOT NULL,
  `czyUE` tinyint(1) NOT NULL,
  `czyZagranica` tinyint(1) NOT NULL,
  `description` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `selltypes`
--

INSERT INTO `selltypes` (`id`, `code`, `name`, `czySprzedaz`, `czyZakup`, `czyKraj`, `czyUE`, `czyZagranica`, `description`) VALUES
(0, 'Brak', 'Nie wybrano', 1, 1, 1, 1, 1, 'Brak'),
(1, 'V7-C2', 'sprzedaż poza terytorium kraju', 1, 0, 0, 1, 1, 'Wykazywane w deklaracji VAT-7 w części C wiersz 2: Dostawa towarów oraz świadczenie usług poza terytorium kraju'),
(2, 'V7-C2a', 'świadczenie usług w innych państwach członkowskich art. 100 ust. 1 pkt 4 ustawy', 1, 0, 0, 1, 1, 'Wykazywane w deklaracji VAT-7 w części C wiersz 2a: w tym świadczenie usług, o których mowa w art. 100 ust. 1 pkt 4 ustawy'),
(3, 'V7-C3a', 'Zwrot VAT podróżnym art. 129 ustawy', 1, 0, 1, 0, 0, 'Wykazywane w deklaracji VAT-7 w części C wiersz 3a: w tym dostawa towarów, o której mowa w art. 129 ustawy'),
(4, 'V7-C7', 'Wewnątrzwspólnotowa dostawa towarów', 1, 0, 0, 1, 0, 'Wykazywane w deklaracji VAT-7 w części C wiersz 7'),
(5, 'V7-C8', 'Eksport towarów', 1, 0, 0, 1, 1, 'Wykazywane w deklaracji VAT-7 w części C wiersz 8'),
(6, 'V7-C9', 'Wewnątrzwspólnotowe nabycie towarów', 0, 1, 0, 1, 1, 'Wykazywane w deklaracji VAT-7 w części C wiersz 9'),
(7, 'V7-C10', 'Import towarów podlegający rozliczeniu zgodnie z art. 33a ustawy', 0, 1, 0, 1, 1, 'Wykazywane w deklaracji VAT-7 w części C wiersz 10'),
(8, 'V7-C11', 'Import usług z wyłączeniem usług nabywanych od podatników, do których stosuje się art. 28b ustawy', 0, 1, 0, 1, 1, 'Wykazywane w deklaracji VAT-7 w części C wiersz 11: Import usług z wyłączeniem usług nabywanych od podatników podatku od wartości dodanej, do których stosuje się art. 28b ustawy'),
(9, 'V7-C12', 'Import usług od podatników, do których stosuje się art. 28b ustawy - VAT', 0, 1, 0, 1, 1, 'Wykazywane w deklaracji VAT-7 w części C wiersz 12: Import usług nabywanych od podatników podatku od wartości dodanej, do których stosuje się art. 28b ustawy'),
(10, 'V7-C13', 'sprzedaż dla której podatnikiem jest nabywca, o którym mowa w z art.17 ust. 1 pkt 7 lub 8', 1, 1, 1, 0, 0, 'Wykazywane w deklaracji VAT-7 w części C wiersz 13: Dostawa towarów oraz świadczenie usług, dla których podatnikiem jest nabywca zgodnie z art.17 ust. 1 pkt 7 lub 8\r\nustawy (wypełnia dostawca)'),
(11, 'V7-C14', 'zakup dla którego podatnikiem jest nabywca, zgodnie z art. 17 ust. 1 pkt 5 ustawy', 0, 1, 1, 0, 0, 'Wykazywane w deklaracji VAT-7 w części C wiersz 14: Dostawa towarów, dla których podatnikiem jest nabywca zgodnie z art. 17 ust. 1 pkt 5 ustawy (wypełnia nabywca)'),
(12, 'V7-C17', 'Wewnątrzwspólnotowe nabycie  środków transportu', 0, 1, 0, 1, 0, 'Wykazywane w deklaracji VAT-7 w części C wiersz 17: Kwota podatku należnego od wewnątrzwspólnotowego nabycia środków transportu, wykazanego w poz. 24, podlegająca wpłacie w terminie, o którym mowa w art. 103 ust. 3, w związku z ust. 4 ustawy'),
(13, 'V7-D2-1', 'Nabycie towarów i usług zaliczanych u podatnika do środków trwałych', 0, 1, 1, 0, 0, 'Wykazywane w deklaracji VAT-7 w części D.2 poz. 41, 42'),
(14, 'V7-D2-2', 'Nabycie towarów i usług pozostałych', 0, 1, 1, 0, 0, 'Wykazywane w deklaracji VAT-7 w części D.2 poz. 43, 44'),
(15, 'VUE-E', 'Wewnątrzwspólnotowe świadczenie usług', 1, 0, 0, 1, 0, 'Wykazywane w deklaracji VAT-UE w części E');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `taxes`
--

CREATE TABLE `taxes` (
  `id` int(11) NOT NULL,
  `code` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `name` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `rate` float DEFAULT NULL,
  `rateReverse` decimal(4,2) DEFAULT NULL,
  `dateFrom` datetime NOT NULL,
  `dateTo` datetime DEFAULT NULL,
  `description` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `taxes`
--

INSERT INTO `taxes` (`id`, `code`, `name`, `rate`, `rateReverse`, `dateFrom`, `dateTo`, `description`) VALUES
(1, 'PTU-A', '23%', 23, '18.70', '2011-01-01 00:00:00', NULL, 'stawka podstawowa'),
(2, 'PTU-B', '8%', 8, '7.41', '2011-01-01 00:00:00', NULL, 'stawka obniżona'),
(3, 'PTU-C', '5%', 5, '4.76', '2011-01-01 00:00:00', NULL, 'stawka obniżona dodatkowa'),
(4, 'PTU-D', '0%', 0, '0.00', '1993-07-01 00:00:00', NULL, 'stawka obniżona dodatkowa'),
(5, 'PTU-E', 'zw.', -1, '-1.00', '1993-07-01 00:00:00', NULL, 'zwolnienie z podatku');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `units`
--

CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `address` text COLLATE utf8_polish_ci NOT NULL,
  `unitType` int(11) NOT NULL,
  `parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `units`
--

INSERT INTO `units` (`id`, `name`, `address`, `unitType`, `parent`) VALUES
(1, 'Szkoła Podstawowa nr 3', 'ul. Złota 9\r\n00-000 Warszawa', 2, 3),
(2, 'STJ', 'Adres', 0, NULL),
(3, 'Instytut Testowy', 'Testowa 6\r\n33-432 Test', 1, 2),
(8, 'Testowa jednostka', 'ul. Testowa 10, Warszawa', 0, 0),
(9, 'TEST', 'TEST', 2, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `unittodeclaration`
--

CREATE TABLE `unittodeclaration` (
  `id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `declaration_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `unittodeclaration`
--

INSERT INTO `unittodeclaration` (`id`, `unit_id`, `declaration_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `unittypes`
--

CREATE TABLE `unittypes` (
  `id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `unittypes`
--

INSERT INTO `unittypes` (`id`, `code`, `name`) VALUES
(1, 'JST', 'Jednostka Samorządu Terytorialnego'),
(2, 'JB', 'Jednostka Budżetowa');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `salt` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `rank` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `accessToken` text COLLATE utf8_polish_ci,
  `accessTokenExpire` timestamp NULL DEFAULT NULL,
  `refreshToken` text COLLATE utf8_polish_ci NOT NULL,
  `refreshTokenExpire` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `firstName` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `salt`, `rank`, `active`, `accessToken`, `accessTokenExpire`, `refreshToken`, `refreshTokenExpire`, `firstName`, `lastName`, `position`, `created`, `modified`) VALUES
(7, 'test@test.pl', '$2y$10$ZzCHqeG52KcIAGRoYXJQp.hO7ePrjzar.ns7E/HN/OJeRlcBgiY3i', 'oQ	', 1, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDUzMjQ4MTU4IiwiZXhwIjoiMTQ1MzI0OTA1OCIsImp0aSI6ImEyNTZhZWQ0ODdjMzgyN2UxYWI3ZWMyM2EyNTQ4NTU0Iiwic2NvcGUiOlt7InJvbGUiOiJhZGQ6amI6ZG9jdW1lbnRzIn0seyJyb2xlIjoidmlldzpqYjpkb2N1bWVudHMifSx7InJvbGUiOiJhZGQ6YWxsOnVzZXJzIn0seyJyb2xlIjoiYWRkOmFsbDp1bml0cyJ9LHsicm9sZSI6InZpZXc6YWxsOmRvY3VtZW50cyJ9LHsicm9sZSI6InZpZXc6YWxsOnVzZXJzIn0seyJyb2xlIjoiYWRkOm15OnJlZ2lzdGVyIn0seyJyb2xlIjoidmlldzphbGw6cmVnaXN0ZXIifSx7InJvbGUiOiJ1cGRhdGU6YWxsOnVzZXJzIn0seyJyb2xlIjoiZGVsZXRlOmFsbDp1c2VycyJ9LHsicm9sZSI6ImFkZDphbGw6cmVnaXN0ZXIifSx7InJvbGUiOiJkZWxldGU6YWxsOnJlZ2lzdGVyIn0seyJyb2xlIjoidmlldzphbGw6dW5pdHMifSx7InJvbGUiOiJ2aWV3Om15OnVuaXRzIn0seyJyb2xlIjoiYWRkOmFsbDp1bml0cyJ9LHsicm9sZSI6InVkcGF0ZTphbGw6dW5pdHMifSx7InJvbGUiOiJkZWxldGU6YWxsOnJlZ2lzdGVyIn0seyJyb2xlIjoiZGVsZXRlOm15OnJlZ2lzdGVyIn0seyJyb2xlIjoidmlldzpteTpyZWdpc3RlciJ9LHsicm9sZSI6InZpZXc6bXk6dXNlcnMifSx7InJvbGUiOiJ1cGRhdGU6YWxsOnJlZ2lzdGVyIn0seyJyb2xlIjoidXBkYXRlOmFsbDp1bml0cyJ9LHsicm9sZSI6InZpZXc6YWxsOmNvbnRyYWN0b3JzIn0seyJyb2xlIjoidmlldzpteTpjb250cmFjdG9ycyJ9LHsicm9sZSI6ImFkZDphbGw6Y29udHJhY3RvcnMifSx7InJvbGUiOiJhZGQ6bXk6Y29udHJhY3RvcnMifSx7InJvbGUiOiJ1cGRhdGU6YWxsOmNvbnRyYWN0b3JzIn0seyJyb2xlIjoidXBkYXRlOm15OmNvbnRyYWN0b3JzIn0seyJyb2xlIjoiZGVsZXRlOmFsbDpjb250cmFjdG9ycyJ9LHsicm9sZSI6ImRlbGV0ZTpteTpjb250cmFjdG9ycyJ9LHsicm9sZSI6ImRlbGV0ZTphbGw6dW5pdHMifSx7InJvbGUiOiJhZGQ6YWxsOnVuaXQtdHlwZXMifSx7InJvbGUiOiJ2aWV3OmFsbDptb250aHMifSx7InJvbGUiOiJ2aWV3Om15Om1vbnRocyJ9LHsicm9sZSI6ImNsb3NlOm15Om1vbnRocyJ9LHsicm9sZSI6InZpZXc6YWxsOmRlY2xhcmF0aW9ucyJ9LHsicm9sZSI6InZpZXc6bXk6ZGVjbGFyYXRpb25zIn0seyJyb2xlIjoidmlldzphbGw6dW5pdC10eXBlcyJ9LHsicm9sZSI6ImRlbGV0ZTphbGw6dW5pdC10eXBlcyJ9LHsicm9sZSI6InVwZGF0ZTpteTpkZWNsYXJhdGlvbnMifSx7InJvbGUiOiJhZGQ6bXk6ZGVjbGFyYXRpb25zIn1dfQ.77E_pm8wCkX8xwHHP_4OX4y0LM-epY5RUt-33LEEa9U', '2016-01-20 00:17:38', '', '0000-00-00 00:00:00', 'Test', 'User', 'Użytkownik testowy', '2015-12-05 21:04:10', '2016-01-02 23:11:55'),
(85, 'admin@jednostka.pl', '$2y$10$ac1t7DdbvYlIJgsflQQlL.BFnzPIv6aT.gqMyJw11RPE9RB6GelFy', 'q', 3, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDUzMjQ3MDU3IiwiZXhwIjoiMTQ1MzI0Nzk1NyIsImp0aSI6ImJkYTlmNzgyNjE1M2NjYWMxMzY2ZTgzMmQxMzZhYTA2Iiwic2NvcGUiOlt7InJvbGUiOiJhZGQ6amI6ZG9jdW1lbnRzIn0seyJyb2xlIjoidmlldzpqYjpkb2N1bWVudHMifSx7InJvbGUiOiJhZGQ6bXk6cmVnaXN0ZXIifSx7InJvbGUiOiJ2aWV3Om15OnVuaXRzIn0seyJyb2xlIjoiZGVsZXRlOm15OnJlZ2lzdGVyIn0seyJyb2xlIjoidmlldzpteTpyZWdpc3RlciJ9LHsicm9sZSI6InZpZXc6bXk6dXNlcnMifSx7InJvbGUiOiJ1cGRhdGU6bXk6cmVnaXN0ZXIifSx7InJvbGUiOiJ1cGRhdGU6bXk6dW5pdHMifSx7InJvbGUiOiJ2aWV3Om15OmNvbnRyYWN0b3JzIn0seyJyb2xlIjoiYWRkOm15OmNvbnRyYWN0b3JzIn0seyJyb2xlIjoidXBkYXRlOm15OmNvbnRyYWN0b3JzIn0seyJyb2xlIjoiZGVsZXRlOm15OmNvbnRyYWN0b3JzIn0seyJyb2xlIjoidmlldzpteTptb250aHMifSx7InJvbGUiOiJjbG9zZTpteTptb250aHMifSx7InJvbGUiOiJ2aWV3Om15OmRlY2xhcmF0aW9ucyJ9LHsicm9sZSI6InVwZGF0ZTpteTpkZWNsYXJhdGlvbnMifSx7InJvbGUiOiJhZGQ6bXk6ZGVjbGFyYXRpb25zIn1dfQ.rSilB6-JNpIEXlVD7qobMDKLaUm8X7zT8wLy1hd5wKk', '2016-01-19 23:59:17', '', '0000-00-00 00:00:00', 'Administrator', 'Jednostki', 'Administrator przykładowej jednostki', '2015-12-30 14:48:08', '2016-01-09 18:11:50'),
(88, 'GGGGGG@GGGGGG', '$2y$10$FYwawxSjkO84Vl4o06gZf.U8Y3cERiUyfJf0CEUsxeHtbB5dducne', '?\Z????8V^(Ө|???	?', 3, 1, NULL, NULL, '', '0000-00-00 00:00:00', '', '', '', '2016-01-03 22:50:45', NULL),
(93, 'demo@demo.pl', '$2y$10$OqTxr/IU8Ww/B0aiKpbH.eHsaI8jUgp4GHNZ4tw45rKsylAvQ8Nmq', ':?????l?F?*???oꅕ`?', 3, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDUyNjI4NjIzIiwiZXhwIjoiMTQ1MjYyOTUyMyIsImp0aSI6ImVjZjExNmJjZGRkYWU0YjM2NTVlMTQxZDA1YzQ5MGY0Iiwic2NvcGUiOlt7InJvbGUiOiJhZGQ6amI6ZG9jdW1lbnRzIn0seyJyb2xlIjoidmlldzpqYjpkb2N1bWVudHMifSx7InJvbGUiOiJhZGQ6bXk6cmVnaXN0ZXIifSx7InJvbGUiOiJ2aWV3Om15OnVuaXRzIn0seyJyb2xlIjoiZGVsZXRlOm15OnJlZ2lzdGVyIn0seyJyb2xlIjoidmlldzpteTpyZWdpc3RlciJ9LHsicm9sZSI6InZpZXc6bXk6dXNlcnMifSx7InJvbGUiOiJ1cGRhdGU6bXk6cmVnaXN0ZXIifSx7InJvbGUiOiJ1cGRhdGU6bXk6dW5pdHMifSx7InJvbGUiOiJ2aWV3Om15OmNvbnRyYWN0b3JzIn0seyJyb2xlIjoiYWRkOm15OmNvbnRyYWN0b3JzIn0seyJyb2xlIjoidXBkYXRlOm15OmNvbnRyYWN0b3JzIn0seyJyb2xlIjoiZGVsZXRlOm15OmNvbnRyYWN0b3JzIn1dfQ.sSaEKiJzmEqPaEneWMqWb2dWPNXPSez_YjI9mc_Q1wg', '2016-01-12 20:12:03', '', '0000-00-00 00:00:00', 'Andrzej', 'Nowakowski', 'Testowy użytkownik', '2016-01-04 00:50:23', '2016-01-09 18:12:18'),
(94, 'mariusz.stasiak@doskomp.lodz.pl', '$2y$10$ujcUQTDi1cXsgbnvnuH.U.kkphxwJXC9QaL.JjB8w9yuhbb8UVV82', '', 3, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDUyMzU5NTkxIiwiZXhwIjoiMTQ1MjM2MDQ5MSIsImp0aSI6IjM4YmQzYjk4YTFlNmE4ODVjMjQ1NzNjZjY4ZTlmODJkIiwic2NvcGUiOlt7InJvbGUiOiJhZGQ6amI6ZG9jdW1lbnRzIn0seyJyb2xlIjoidmlldzpqYjpkb2N1bWVudHMifSx7InJvbGUiOiJhZGQ6bXk6cmVnaXN0ZXIifSx7InJvbGUiOiJ2aWV3Om15OnVuaXRzIn0seyJyb2xlIjoiZGVsZXRlOm15OnJlZ2lzdGVyIn0seyJyb2xlIjoidmlldzpteTpyZWdpc3RlciJ9LHsicm9sZSI6InZpZXc6bXk6dXNlcnMifSx7InJvbGUiOiJ1cGRhdGU6bXk6cmVnaXN0ZXIifSx7InJvbGUiOiJ1cGRhdGU6bXk6dW5pdHMifSx7InJvbGUiOiJ2aWV3Om15OmNvbnRyYWN0b3JzIn0seyJyb2xlIjoiYWRkOm15OmNvbnRyYWN0b3JzIn0seyJyb2xlIjoidXBkYXRlOm15OmNvbnRyYWN0b3JzIn0seyJyb2xlIjoiZGVsZXRlOm15OmNvbnRyYWN0b3JzIn1dfQ.SAgSlI1dIMQgknYGp3txi1gS3z0y4PqVfTRLzuNBB18', '2016-01-09 17:28:11', '', '0000-00-00 00:00:00', 'Mariusz', 'Stasiak', 'Dyrektor', '2016-01-04 11:59:24', '2016-01-08 14:11:45'),
(95, 'demo1@demo.pl', '$2y$10$zlHuKCntkkxc7/HmM8yTS.zS3cjMR94t6UoGQ/JIRIbdnow.CYGeO', '', 3, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDUxOTU0OTI4IiwiZXhwIjoiMTQ1MTk1NTgyOCIsImp0aSI6IjE4MzhkMzcwZTZiOTQ4YWY1MTE1MDk5YTg0MTU2M2U2Iiwic2NvcGUiOlt7InJvbGUiOiJhZGQ6amI6ZG9jdW1lbnRzIn0seyJyb2xlIjoidmlldzpqYjpkb2N1bWVudHMifSx7InJvbGUiOiJhZGQ6bXk6cmVnaXN0ZXIifSx7InJvbGUiOiJ2aWV3Om15OnVuaXRzIn0seyJyb2xlIjoiZGVsZXRlOm15OnJlZ2lzdGVyIn0seyJyb2xlIjoidmlldzpteTpyZWdpc3RlciJ9LHsicm9sZSI6InZpZXc6bXk6dXNlcnMifSx7InJvbGUiOiJ1cGRhdGU6bXk6cmVnaXN0ZXIifSx7InJvbGUiOiJ1cGRhdGU6bXk6dW5pdHMifV19.K-QMFRfq2v3Exu1ZoOjdl706MvB9xlDeYW0OR1fvdDM', '2016-01-05 01:03:48', '', '0000-00-00 00:00:00', '', '', '', '2016-01-04 18:17:05', '2016-01-05 01:47:43'),
(96, 'jarek.frydrych@gmail.com', '$2y$10$d0kMNydhPVNwaAQwgtNAIutBmJQFMNzrgRdcyUzjTMW7NtImsK4Xq', 'i', 1, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDUyMjU1NTczIiwiZXhwIjoiMTQ1MjI1NjQ3MyIsImp0aSI6IjU0YzZlYjFjZWFkZWEyZGU5YTczZjUxNDI2YjMwOWVjIiwic2NvcGUiOlt7InJvbGUiOiJhZGQ6amI6ZG9jdW1lbnRzIn0seyJyb2xlIjoidmlldzpqYjpkb2N1bWVudHMifSx7InJvbGUiOiJhZGQ6YWxsOnVzZXJzIn0seyJyb2xlIjoiYWRkOmFsbDp1bml0cyJ9LHsicm9sZSI6InZpZXc6YWxsOmRvY3VtZW50cyJ9LHsicm9sZSI6InZpZXc6YWxsOnVzZXJzIn0seyJyb2xlIjoiYWRkOm15OnJlZ2lzdGVyIn0seyJyb2xlIjoidmlldzphbGw6cmVnaXN0ZXIifSx7InJvbGUiOiJ1cGRhdGU6YWxsOnVzZXJzIn0seyJyb2xlIjoiZGVsZXRlOmFsbDp1c2VycyJ9LHsicm9sZSI6ImFkZDphbGw6cmVnaXN0ZXIifSx7InJvbGUiOiJkZWxldGU6YWxsOnJlZ2lzdGVyIn0seyJyb2xlIjoidmlldzphbGw6dW5pdHMifSx7InJvbGUiOiJ2aWV3Om15OnVuaXRzIn0seyJyb2xlIjoiYWRkOmFsbDp1bml0cyJ9LHsicm9sZSI6InVkcGF0ZTphbGw6dW5pdHMifSx7InJvbGUiOiJkZWxldGU6YWxsOnJlZ2lzdGVyIn0seyJyb2xlIjoiZGVsZXRlOm15OnJlZ2lzdGVyIn0seyJyb2xlIjoidmlldzpteTpyZWdpc3RlciJ9LHsicm9sZSI6InZpZXc6bXk6dXNlcnMifSx7InJvbGUiOiJ1cGRhdGU6YWxsOnJlZ2lzdGVyIn0seyJyb2xlIjoidXBkYXRlOmFsbDp1bml0cyJ9LHsicm9sZSI6InZpZXc6YWxsOmNvbnRyYWN0b3JzIn0seyJyb2xlIjoidmlldzpteTpjb250cmFjdG9ycyJ9LHsicm9sZSI6ImFkZDphbGw6Y29udHJhY3RvcnMifSx7InJvbGUiOiJhZGQ6bXk6Y29udHJhY3RvcnMifSx7InJvbGUiOiJ1cGRhdGU6YWxsOmNvbnRyYWN0b3JzIn0seyJyb2xlIjoidXBkYXRlOm15OmNvbnRyYWN0b3JzIn0seyJyb2xlIjoiZGVsZXRlOmFsbDpjb250cmFjdG9ycyJ9LHsicm9sZSI6ImRlbGV0ZTpteTpjb250cmFjdG9ycyJ9XX0.BN2QQgM4Ky1o1lJmTLQeNgwvX_ef-4o3bdnVq_FDbbQ', '2016-01-08 12:34:33', '', '0000-00-00 00:00:00', 'Jarosław', 'Frydrych', 'Web Developer', '2016-01-08 13:19:06', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `usertounit`
--

CREATE TABLE `usertounit` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `usertounit`
--

INSERT INTO `usertounit` (`id`, `user_id`, `unit_id`) VALUES
(1, 7, 1),
(2, 7, 3),
(3, 12, 1),
(4, 15, 1),
(5, 16, 1),
(6, 17, 0),
(7, 18, 0),
(8, 19, 0),
(9, 20, 0),
(10, 21, 0),
(11, 22, 0),
(12, 23, 0),
(13, 24, 0),
(14, 25, 0),
(15, 26, 0),
(16, 27, 0),
(17, 28, 0),
(18, 29, 0),
(19, 30, 0),
(20, 31, 0),
(21, 32, 0),
(22, 33, 0),
(23, 34, 1),
(24, 35, 0),
(25, 36, 0),
(26, 37, 0),
(27, 38, 0),
(28, 39, 0),
(29, 40, 0),
(30, 41, 0),
(31, 42, 0),
(32, 43, 0),
(33, 44, 0),
(34, 65, 0),
(35, 66, 0),
(36, 67, 0),
(37, 68, 0),
(38, 69, 0),
(39, 70, 0),
(40, 71, 0),
(41, 72, 0),
(42, 73, 0),
(43, 74, 1),
(44, 75, 0),
(45, 76, 0),
(46, 77, 0),
(47, 78, 0),
(48, 79, 0),
(49, 80, 0),
(50, 81, 0),
(51, 82, 0),
(52, 83, 0),
(53, 84, 0),
(54, 83, 0),
(55, 84, 0),
(58, 86, 0),
(59, 87, 0),
(60, 88, 0),
(61, 89, 0),
(62, 90, 0),
(63, 91, 0),
(64, 92, 0),
(67, 95, 0),
(68, 96, 0),
(69, 97, 0),
(70, 98, 0),
(71, 99, 0),
(72, 100, 0),
(73, 101, 0),
(74, 102, 0),
(75, 103, 0),
(76, 104, 0),
(77, 105, 0),
(78, 106, 0),
(79, 107, 0),
(80, 108, 0),
(81, 109, 0),
(82, 110, 0),
(83, 111, 0),
(84, 112, 0),
(85, 113, 0),
(86, 114, 0),
(87, 115, 0),
(90, 118, 0),
(91, 119, 0),
(92, 120, 0),
(93, 121, 0),
(94, 122, 0),
(95, 123, 0),
(96, 124, 0),
(97, 125, 0),
(98, 126, 0),
(99, 127, 0),
(100, 128, 0),
(101, 129, 0),
(102, 128, 0),
(103, 129, 0),
(104, 130, 0),
(105, 131, 0),
(106, 132, 0),
(107, 133, 0),
(108, 134, 0),
(109, 86, 0),
(110, 87, 0),
(111, 88, 0),
(112, 89, 0),
(113, 90, 0),
(114, 91, 0),
(115, 92, 0),
(117, 97, 0),
(118, 2, 0),
(119, 98, 0),
(120, 3, 0),
(121, 99, 0),
(122, 7, 0),
(123, 105, 0),
(124, 0, 0),
(125, 106, 0),
(126, 4, 0),
(127, 107, 1),
(128, 108, 1),
(129, 109, 1),
(130, 112, 1),
(131, 112, 3),
(132, 113, 1),
(133, 114, 1),
(143, 117, 2),
(144, 117, 1),
(145, 117, 3),
(146, 116, 1),
(148, 94, 1),
(149, 94, 3),
(152, 85, 1),
(153, 93, 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vatdocumenttypes`
--

CREATE TABLE `vatdocumenttypes` (
  `id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `correction` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `vatdocumenttypes`
--

INSERT INTO `vatdocumenttypes` (`id`, `code`, `name`, `correction`) VALUES
(1, 'FV', 'faktura VAT', 0),
(2, 'FK', 'faktura korygująca', 1),
(3, 'PF', 'paragon fiskalny', 0),
(4, 'RD', 'fiskalny raport dobowy', 0),
(5, 'NK', 'nota korygująca', 1),
(6, 'NV', 'nieudokumentowane fakturą', 0);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `contractors`
--
ALTER TABLE `contractors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `declarations`
--
ALTER TABLE `declarations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documentvalues`
--
ALTER TABLE `documentvalues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `months`
--
ALTER TABLE `months`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ranks`
--
ALTER TABLE `ranks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registers`
--
ALTER TABLE `registers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registerspositions`
--
ALTER TABLE `registerspositions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registerspositionsvalues`
--
ALTER TABLE `registerspositionsvalues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rolestoranks`
--
ALTER TABLE `rolestoranks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roletouser`
--
ALTER TABLE `roletouser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `selltypes`
--
ALTER TABLE `selltypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unittodeclaration`
--
ALTER TABLE `unittodeclaration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unittypes`
--
ALTER TABLE `unittypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `usertounit`
--
ALTER TABLE `usertounit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vatdocumenttypes`
--
ALTER TABLE `vatdocumenttypes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `contractors`
--
ALTER TABLE `contractors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT dla tabeli `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;
--
-- AUTO_INCREMENT dla tabeli `declarations`
--
ALTER TABLE `declarations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT dla tabeli `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT dla tabeli `documentvalues`
--
ALTER TABLE `documentvalues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `months`
--
ALTER TABLE `months`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `ranks`
--
ALTER TABLE `ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT dla tabeli `registers`
--
ALTER TABLE `registers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT dla tabeli `registerspositions`
--
ALTER TABLE `registerspositions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT dla tabeli `registerspositionsvalues`
--
ALTER TABLE `registerspositionsvalues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;
--
-- AUTO_INCREMENT dla tabeli `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT dla tabeli `rolestoranks`
--
ALTER TABLE `rolestoranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT dla tabeli `roletouser`
--
ALTER TABLE `roletouser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT dla tabeli `selltypes`
--
ALTER TABLE `selltypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT dla tabeli `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT dla tabeli `units`
--
ALTER TABLE `units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT dla tabeli `unittodeclaration`
--
ALTER TABLE `unittodeclaration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT dla tabeli `unittypes`
--
ALTER TABLE `unittypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT dla tabeli `usertounit`
--
ALTER TABLE `usertounit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;
--
-- AUTO_INCREMENT dla tabeli `vatdocumenttypes`
--
ALTER TABLE `vatdocumenttypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
