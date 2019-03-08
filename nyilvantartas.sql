-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2018. Feb 23. 20:40
-- Kiszolgáló verziója: 5.7.14
-- PHP verzió: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `nyilvantartas`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `eszkozok`
--

CREATE TABLE `eszkozok` (
  `eszkozid` int(5) NOT NULL,
  `nev` varchar(50) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `ev` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `eszkozok`
--

INSERT INTO `eszkozok` (`eszkozid`, `nev`, `ev`) VALUES
(1, 'HP asztali számítógép', 2016),
(2, 'HP mini számítógép', 2017),
(3, 'HP 22 monitor', 2016),
(4, 'Kyocera nyomtató', 2014),
(5, 'HP 1020 nyomtató', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `leltar`
--

CREATE TABLE `leltar` (
  `leltarid` int(11) NOT NULL,
  `teremid` int(4) NOT NULL,
  `eszkozid` int(5) NOT NULL,
  `egyeb` varchar(30) COLLATE utf8mb4_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `leltar`
--

INSERT INTO `leltar` (`leltarid`, `teremid`, `eszkozid`, `egyeb`) VALUES
(1, 4, 1, NULL),
(2, 1, 1, 'tanári'),
(3, 1, 1, 't3'),
(4, 1, 2, 't4'),
(7, 5, 5, NULL),
(9, 5, 3, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termek`
--

CREATE TABLE `termek` (
  `teremid` int(4) NOT NULL,
  `teremszam` varchar(4) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `felhasznalas` varchar(30) COLLATE utf8mb4_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `termek`
--

INSERT INTO `termek` (`teremid`, `teremszam`, `felhasznalas`) VALUES
(1, '104', 'Informatika terem'),
(2, '123', 'Informatika tanári'),
(4, '136', NULL),
(5, 'M22', 'Informatika terem'),
(9, '127', 'Informatika terem');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `eszkozok`
--
ALTER TABLE `eszkozok`
  ADD PRIMARY KEY (`eszkozid`),
  ADD UNIQUE KEY `nev` (`nev`);

--
-- A tábla indexei `leltar`
--
ALTER TABLE `leltar`
  ADD PRIMARY KEY (`leltarid`),
  ADD KEY `eszkozid` (`eszkozid`),
  ADD KEY `teremid` (`teremid`);

--
-- A tábla indexei `termek`
--
ALTER TABLE `termek`
  ADD PRIMARY KEY (`teremid`),
  ADD UNIQUE KEY `teremszam` (`teremszam`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `eszkozok`
--
ALTER TABLE `eszkozok`
  MODIFY `eszkozid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT a táblához `leltar`
--
ALTER TABLE `leltar`
  MODIFY `leltarid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT a táblához `termek`
--
ALTER TABLE `termek`
  MODIFY `teremid` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `leltar`
--
ALTER TABLE `leltar`
  ADD CONSTRAINT `leltar_ibfk_1` FOREIGN KEY (`teremid`) REFERENCES `termek` (`teremid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `leltar_ibfk_2` FOREIGN KEY (`eszkozid`) REFERENCES `eszkozok` (`eszkozid`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
