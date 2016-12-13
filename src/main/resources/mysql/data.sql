

INSERT INTO obiekt_rekreacyjno_sportowy.uzytkownik(id, nazwa_uzytkownika, haslo, poziom_dostepu, miasto, ulica, kod_pocztowy, numer_telefonu,created)
VALUES('1','administrator','$2a$04$KWeGmrnv.s7rn/zWFN4p/emjZDCdW5pjD6DwsIxaj.GBHnfb6LoF6','ADMINISTRATOR',null,null,null,null,CURRENT_DATE);

INSERT INTO obiekt_rekreacyjno_sportowy.uzytkownik(id, nazwa_uzytkownika, haslo, poziom_dostepu, miasto, ulica, kod_pocztowy, numer_telefonu,created)
VALUES('2','user123','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER',null,null,null,null,CURRENT_DATE);

INSERT INTO `obiekt`(`nazwa`, `opis`)
VALUES ('Basen', 'Basen o wymiarach 25m x 50m, podzielony na 10 torow o szerokości 2,5m');

INSERT INTO `obiekt`(`nazwa`, `opis`)
VALUES ('Mala sala gimnastyczna', 'Sala gimnastyczna wymiarach 18m x 40m. W środku znajdują się dwa kosze do koszykówki, osprzęt do rozlożenia siatki do siatkówki oraz 8 stolów do tenisa stolowego');

INSERT INTO `cennik`(`id_obiektu`, `wynajecie_robocze_taryfa_pierwsza`, `wynajecie_robocze_taryfa_druga`, `wynajecie_weekend_taryfa_pierwsza`,
`wynajecie_weekend_taryfa_druga`, `karnet_taryfa_pierwsza`, `karnet_taryfa_druga`, `jednorazowe_wejscie`, `godzina_zmiany_taryfy`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Basen'), 80, 100, 100, 150, 90, 120, 10, '15:00');

INSERT INTO `cennik`(`id_obiektu`, `wynajecie_robocze_taryfa_pierwsza`, `wynajecie_robocze_taryfa_druga`, `wynajecie_weekend_taryfa_pierwsza`,
`wynajecie_weekend_taryfa_druga`, `karnet_taryfa_pierwsza`, `karnet_taryfa_druga`, `jednorazowe_wejscie`, `godzina_zmiany_taryfy`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Mala sala gimnastyczna'), 45, 60, 60, 80, null, null, null, '17:00');

INSERT INTO `czas_otwarcia_obiektu`(`id_obiektu`, `poniedzialek_otwarcie`, `poniedzialek_zamkniecie`, `wtorek_otwarcie`, `wtorek_zamkniecie`, `sroda_otwarcie`, `sroda_zamkniecie`, `czwartek_otwarcie`, `czwartek_zamkniecie`, `piatek_otwarcie`, `piatek_zamkniecie`, `sobota_otwarcie`, `sobota_zamkniecie`, `niedziela_otwarcie`, `niedziela_zamkniecie`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Basen'), '06:00', '23:00', '06:00', '23:00', '06:00', '23:00', '06:00', '23:00', '06:00', '23:00', '07:30', '24:00', '07:30', '24:00');


INSERT INTO `czas_otwarcia_obiektu`(`id_obiektu`, `poniedzialek_otwarcie`, `poniedzialek_zamkniecie`, `wtorek_otwarcie`, `wtorek_zamkniecie`, `sroda_otwarcie`, `sroda_zamkniecie`, `czwartek_otwarcie`, `czwartek_zamkniecie`, `piatek_otwarcie`, `piatek_zamkniecie`, `sobota_otwarcie`, `sobota_zamkniecie`, `niedziela_otwarcie`, `niedziela_zamkniecie`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Mala sala gimnastyczna'), '08:00', '23:00', '08:00', '23:00', '08:00', '23:00', '08:00', '23:00', '08:00', '23:00', '10:30', '24:00', '10:30', '24:00');


# username : administrator, password administrator
# username : user123, password user123
