

INSERT INTO obiekt_rekreacyjno_sportowy.uzytkownik(id, nazwa_uzytkownika, haslo, poziom_dostepu, miasto, ulica, kod_pocztowy, numer_telefonu,created)
VALUES('1','administrator','$2a$04$KWeGmrnv.s7rn/zWFN4p/emjZDCdW5pjD6DwsIxaj.GBHnfb6LoF6','ADMINISTRATOR',null,null,null,null,CURRENT_DATE);

INSERT INTO obiekt_rekreacyjno_sportowy.uzytkownik(id, nazwa_uzytkownika, haslo, poziom_dostepu, miasto, ulica, kod_pocztowy, numer_telefonu,created)
VALUES('2','user123','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER',null,null,null,null,CURRENT_DATE);

INSERT INTO `obiekt`(`nazwa`, `opis` , `zdjecie`)
VALUES ('Basen', 'Basen o wymiarach 25m x 50m, podzielony na 10 torow o szerokości 2,5m.' , 'resources/img/basen.jpg');

INSERT INTO `obiekt`(`nazwa`, `opis` , `zdjecie`)
VALUES ('Mala sala gimnastyczna', 'Sala gimnastyczna wymiarach 18m x 40m. W środku znajdują się dwa kosze do koszykówki, osprzęt do rozlożenia siatki do siatkówki oraz 8 stolów do tenisa stolowego' , 'resources/img/fitness.jpg');

INSERT INTO `obiekt`(`nazwa`, `opis` , `zdjecie`)
VALUES ('Hala tenisowa', 'Hala tenisowa o wymiarach 25m x 50m, podzielony na 10 torow o szerokości 2,5m.' , 'resources/img/tenis.jpg');

INSERT INTO `obiekt`(`nazwa`, `opis` , `zdjecie`)
VALUES ('Hala sztuk walki', 'Hala sztuk walki o wymiarach 25m x 50m, tylko dla największych koksów któzy chcą się bić jak pudzianowski ... czyli słąbo.' , 'resources/img/boks.jpg');

INSERT INTO `obiekt`(`nazwa`, `opis` , `zdjecie`)
VALUES ('Sala BJJ', 'Sala do brazylijskiego jujitsu. Polecamy wszystkim którzy są gibcy jak koty a są jak sieroty, aby skorzystali z tej ultranowoczesnej salki. Są super prysznice z bateriami nierdzewnymi i masażami pośladkowymi.' , 'resources/img/bjj.jpg');

INSERT INTO `obiekt`(`nazwa`, `opis` , `zdjecie`)
VALUES ('Sauna', 'Jeżeli chcesz sięwypocić jak dekarz albo rolnik w polu to zapraszamy do skorzystania z naszej ultranowoczesnej sauny... dla każdego nowego klienta lody Koral gratis.' , 'resources/img/sauna.jpg');

INSERT INTO `obiekt`(`nazwa`, `opis` , `zdjecie`)
VALUES ('Silownia', 'Tak tak to własnie my tu mamy te ciężary, także nie zwlekaj namów kolege do wspólnego wysiłku i wbijaj.' , 'resources/img/silownia.jpg');

INSERT INTO `obiekt`(`nazwa`, `opis` , `zdjecie`)
VALUES ('Boisko siatkarskie', 'SAala do siatkówki pełnowymiarowa. Na miejscu jest możliwość wyporzyczenia piłęk i sprzętu sędziowskiego.' , 'resources/img/siatka.jpg');

INSERT INTO `cennik`(`id_obiektu`, `wynajecie_robocze_taryfa_pierwsza`, `wynajecie_robocze_taryfa_druga`, `wynajecie_weekend_taryfa_pierwsza`,
`wynajecie_weekend_taryfa_druga`, `karnet_taryfa_pierwsza`, `karnet_taryfa_druga`, `jednorazowe_wejscie`, `godzina_zmiany_taryfy`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Basen'), 80, 100, 100, 150, 90, 120, 10, '15:00');

INSERT INTO `cennik`(`id_obiektu`, `wynajecie_robocze_taryfa_pierwsza`, `wynajecie_robocze_taryfa_druga`, `wynajecie_weekend_taryfa_pierwsza`,
`wynajecie_weekend_taryfa_druga`, `karnet_taryfa_pierwsza`, `karnet_taryfa_druga`, `jednorazowe_wejscie`, `godzina_zmiany_taryfy`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Mala sala gimnastyczna'), 45, 60, 60, 80, null, null, null, '17:00');

INSERT INTO `cennik`(`id_obiektu`, `wynajecie_robocze_taryfa_pierwsza`, `wynajecie_robocze_taryfa_druga`, `wynajecie_weekend_taryfa_pierwsza`,
`wynajecie_weekend_taryfa_druga`, `karnet_taryfa_pierwsza`, `karnet_taryfa_druga`, `jednorazowe_wejscie`, `godzina_zmiany_taryfy`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Hala tenisowa'), 80, 100, 100, 150, 90, 120, 10, '15:00');

INSERT INTO `cennik`(`id_obiektu`, `wynajecie_robocze_taryfa_pierwsza`, `wynajecie_robocze_taryfa_druga`, `wynajecie_weekend_taryfa_pierwsza`,
`wynajecie_weekend_taryfa_druga`, `karnet_taryfa_pierwsza`, `karnet_taryfa_druga`, `jednorazowe_wejscie`, `godzina_zmiany_taryfy`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Hala sztuk walki'), 45, 60, 60, 80, null, null, null, '17:00');

INSERT INTO `cennik`(`id_obiektu`, `wynajecie_robocze_taryfa_pierwsza`, `wynajecie_robocze_taryfa_druga`, `wynajecie_weekend_taryfa_pierwsza`,
`wynajecie_weekend_taryfa_druga`, `karnet_taryfa_pierwsza`, `karnet_taryfa_druga`, `jednorazowe_wejscie`, `godzina_zmiany_taryfy`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Sala BJJ'), 80, 100, 100, 150, 90, 120, 10, '15:00');

INSERT INTO `cennik`(`id_obiektu`, `wynajecie_robocze_taryfa_pierwsza`, `wynajecie_robocze_taryfa_druga`, `wynajecie_weekend_taryfa_pierwsza`,
`wynajecie_weekend_taryfa_druga`, `karnet_taryfa_pierwsza`, `karnet_taryfa_druga`, `jednorazowe_wejscie`, `godzina_zmiany_taryfy`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Sauna'), 45, 60, 60, 80, null, null, null, '17:00');

INSERT INTO `cennik`(`id_obiektu`, `wynajecie_robocze_taryfa_pierwsza`, `wynajecie_robocze_taryfa_druga`, `wynajecie_weekend_taryfa_pierwsza`,
`wynajecie_weekend_taryfa_druga`, `karnet_taryfa_pierwsza`, `karnet_taryfa_druga`, `jednorazowe_wejscie`, `godzina_zmiany_taryfy`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Silownia'), 80, 100, 100, 150, 90, 120, 10, '15:00');

INSERT INTO `cennik`(`id_obiektu`, `wynajecie_robocze_taryfa_pierwsza`, `wynajecie_robocze_taryfa_druga`, `wynajecie_weekend_taryfa_pierwsza`,
`wynajecie_weekend_taryfa_druga`, `karnet_taryfa_pierwsza`, `karnet_taryfa_druga`, `jednorazowe_wejscie`, `godzina_zmiany_taryfy`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Boisko siatkarskie'), 45, 60, 60, 80, null, null, null, '17:00');




INSERT INTO `czas_otwarcia_obiektu`(`id_obiektu`, `poniedzialek_otwarcie`, `poniedzialek_zamkniecie`, `wtorek_otwarcie`, `wtorek_zamkniecie`, `sroda_otwarcie`, `sroda_zamkniecie`, `czwartek_otwarcie`, `czwartek_zamkniecie`, `piatek_otwarcie`, `piatek_zamkniecie`, `sobota_otwarcie`, `sobota_zamkniecie`, `niedziela_otwarcie`, `niedziela_zamkniecie`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Basen'), '06:00', '23:00', '06:00', '23:00', '06:00', '23:00', '06:00', '23:00', '06:00', '23:00', '07:30', '24:00', '07:30', '24:00');


INSERT INTO `czas_otwarcia_obiektu`(`id_obiektu`, `poniedzialek_otwarcie`, `poniedzialek_zamkniecie`, `wtorek_otwarcie`, `wtorek_zamkniecie`, `sroda_otwarcie`, `sroda_zamkniecie`, `czwartek_otwarcie`, `czwartek_zamkniecie`, `piatek_otwarcie`, `piatek_zamkniecie`, `sobota_otwarcie`, `sobota_zamkniecie`, `niedziela_otwarcie`, `niedziela_zamkniecie`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Mala sala gimnastyczna'), '08:00', '23:00', '08:00', '23:00', '08:00', '23:00', '08:00', '23:00', '08:00', '23:00', '10:30', '24:00', '10:30', '24:00');


INSERT INTO `aktualnosci`(`id`, `id_obiektu`, `tytul`, `opis`, `data`) VALUES ('1',(SELECT `id` from `obiekt` where `nazwa` = 'Basen'),'Mega promocja !','Super mega swietny basen
','2017-01-03')


# username : administrator, password administrator
# username : user123, password user123
