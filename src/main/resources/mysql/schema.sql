-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 05 Gru 2016, 18:02
-- Wersja serwera: 10.1.16-MariaDB
-- Wersja PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Baza danych: `obiekt_rekreacyjno_sportowy`
--
CREATE DATABASE IF NOT EXISTS `obiekt_rekreacyjno_sportowy` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `obiekt_rekreacyjno_sportowy`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cennik`
--

DROP TABLE IF EXISTS `cennik`;
CREATE TABLE IF NOT EXISTS `cennik` (
  `id` int(32) NOT NULL,
  `id_obiektu` int(32) NOT NULL,
  `wynajecie_robocze_taryfa_pierwsza` int(2) NOT NULL,
  `wynajecie_robocze_taryfa_druga` int(2) NOT NULL,
  `wynajecie_weekend_taryfa_pierwsza` int(2) NOT NULL,
  `wynajecie_weekend_taryfa_druga` int(2) NOT NULL,
  `karnet_robocze_taryfa_pierwsza` int(2) NOT NULL,
  `karnet_robocze_taryfa_druga` int(2) NOT NULL,
  `jednorazowe_wejscie` int(2),
  `godzina_zmiany_taryfy` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `czas_otwarcia_obiektu`
--

DROP TABLE IF EXISTS `czas_otwarcia_obiektu`;
CREATE TABLE IF NOT EXISTS `czas_otwarcia_obiektu` (
  `id` int(32) NOT NULL,
  `id_obiektu` int(32) NOT NULL,
  `poniedzialek_otwarcie` varchar(5),
  `poniedzialek_zamkniecie` varchar(5),
  `wtorek_otwarcie` varchar(5),
  `wtorek_zamkniecie` varchar(5),
  `sroda_otwarcie` varchar(5),
  `sroda_zamkniecie` varchar(5),
  `czwartek_otwarcie` varchar(5),
  `czwartek_zamkniecie` varchar(5),
  `piatek_otwarcie` varchar(5),
  `piatek_zamkniecie` varchar(5),
  `sobota_otwarcie` varchar(5),
  `sobota_zamkniecie` varchar(5),
  `niedziela_otwarcie` varchar(5),
  `niedziela_zamkniecie` varchar(5),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `karnet`
--

DROP TABLE IF EXISTS `karnet`;
CREATE TABLE IF NOT EXISTS `karnet` (
  `id` int(32) NOT NULL,
  `id_uzytkownika` int(32) NOT NULL,
  `id_obiektu` int(32) NOT NULL,
  `data_waznosci` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_obiektu` (`id_obiektu`),
  KEY `id_uzytkownika` (`id_uzytkownika`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------


--
-- Struktura tabeli dla tabeli `rezerwacja`
--

DROP TABLE IF EXISTS `rezerwacja`;
CREATE TABLE IF NOT EXISTS `rezerwacja` (
  `id` int(32) NOT NULL,
  `id_uzytkownika` int(32) NOT NULL,
  `id_obiektu` int(32) NOT NULL,
  `dzien_rezerwacji` date NOT NULL,
  `godzina_rezerwacji` varchar(10) NOT NULL,
  `godzina_zakonczenia_rezerwacji` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_uzytkownika` (`id_uzytkownika`),
  KEY `id_obiektu` (`id_obiektu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `obiekt`
--

DROP TABLE IF EXISTS `obiekt`;
CREATE TABLE IF NOT EXISTS `obiekt` (
  `id` int(32) NOT NULL,
  `nazwa` varchar(64) NOT NULL,
  `opis` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

DROP TABLE IF EXISTS `uzytkownik`;
CREATE TABLE IF NOT EXISTS `uzytkownik` (
  `id` int(32) NOT NULL,
  `nazwa_uzytkownika` varchar(128) NOT NULL,
  `haslo` varchar(128) NOT NULL,
  `poziom_dostepu` varchar(128) NOT NULL,
  `miasto` varchar(64) ,
  `ulica` varchar(64)  ,
  `adres_email` varchar(64)  ,
  `kod_pocztowy` varchar(10) ,
  `numer_telefonu` int(13) ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `cennik`
--
ALTER TABLE `cennik`
  ADD FOREIGN KEY (`id_obiektu`) REFERENCES `obiekt` (`id`);

--
-- Ograniczenia dla tabeli `czas_otwarcia_obiektu`
--
ALTER TABLE `czas_otwarcia_obiektu`
  ADD FOREIGN KEY (`id_obiektu`) REFERENCES `obiekt` (`id`);

--
-- Ograniczenia dla tabeli `karnet`
--
ALTER TABLE `karnet`
  ADD CONSTRAINT `karnet_ibfk_1` FOREIGN KEY (`id_obiektu`) REFERENCES `obiekt` (`id`),
  ADD CONSTRAINT `karnet_ibfk_2` FOREIGN KEY (`id_uzytkownika`) REFERENCES `uzytkownik` (`id`);

--
-- Ograniczenia dla tabeli `rezerwacja`
--
ALTER TABLE `rezerwacja`
  ADD CONSTRAINT `rezerwacja_ibfk_1` FOREIGN KEY (`id_uzytkownika`) REFERENCES `uzytkownik` (`id`),
  ADD CONSTRAINT `rezerwacja_ibfk_2` FOREIGN KEY (`id_obiektu`) REFERENCES `obiekt` (`id`);
