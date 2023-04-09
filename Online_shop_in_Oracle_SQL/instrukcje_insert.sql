--Inserty dla tabeli Sklep
INSERT INTO sklep
VALUES(Sklep_id.nextval, 'AmazonPL' , '.pl', 'Polska');

INSERT INTO sklep
VALUES(Sklep_id.nextval, 'AmazonDE' , '.de', 'Niemcy');

INSERT INTO sklep
VALUES(Sklep_id.nextval, 'AmazonUK' , '.uk', 'Wielka Brytania');

INSERT INTO sklep
VALUES(Sklep_id.nextval, 'AmazonIT' , '.it', 'Wlochy');

INSERT INTO sklep
VALUES(Sklep_id.nextval, 'AmazonFK' , '.fk', 'Francja');

INSERT INTO sklep
VALUES(Sklep_id.nextval, 'AmazonES' , '.es', 'Hiszpania');

INSERT INTO sklep
VALUES(Sklep_id.nextval, 'AmazonUS' , '.us', 'USA');

--Inserty dla tabeli Kategoria
INSERT INTO kategoria
VALUES(Kategoria_id.nextval, 'Elektronika');

INSERT INTO kategoria
VALUES(Kategoria_id.nextval, 'Moda');

INSERT INTO kategoria
VALUES(Kategoria_id.nextval, 'Kosmetyki');

INSERT INTO kategoria
VALUES(Kategoria_id.nextval, 'Zywnosc');

INSERT INTO kategoria
VALUES(Kategoria_id.nextval, 'Sport');

INSERT INTO kategoria
VALUES(Kategoria_id.nextval, 'Gospodarstwo domowe');

INSERT INTO kategoria
VALUES(Kategoria_id.nextval, 'Zdrowie');

INSERT INTO kategoria
VALUES(Kategoria_id.nextval, 'Rozrywka');

INSERT INTO kategoria
VALUES(Kategoria_id.nextval, 'Motoryzacja');

--Inserty dla tabeli Producent
INSERT INTO producent
VALUES(Producent_id.nextval, 'Bielenda');

INSERT INTO producent
VALUES(Producent_id.nextval, 'Aleksander');

INSERT INTO producent
VALUES(Producent_id.nextval, 'Biedronka');

INSERT INTO producent
VALUES(Producent_id.nextval, 'HM');

INSERT INTO producent
VALUES(Producent_id.nextval, 'Sowa');

INSERT INTO producent
VALUES(Producent_id.nextval, 'Peugeot');

INSERT INTO producent
VALUES(Producent_id.nextval, 'Ubisoft');

--Inserty dla tabeli Dostawa
INSERT INTO dostawa
VALUES(Dostawa_id.nextval, 'List ekonomiczny', 5.50);

INSERT INTO dostawa
VALUES(Dostawa_id.nextval, 'List priorytetowy', 6.90);

INSERT INTO dostawa
VALUES(Dostawa_id.nextval, 'List polecony priorytetowo', 7.30);

INSERT INTO dostawa
VALUES(Dostawa_id.nextval, 'Paczka pocztowa', 8.80);

INSERT INTO dostawa
VALUES(Dostawa_id.nextval, 'Przesylka kurierska', 12.90);

INSERT INTO dostawa
VALUES(Dostawa_id.nextval, 'Przesylka kurierska pobraniowa', 15.50);

--Inserty dla tabeli Adres
INSERT INTO adres
VALUES(Adres_id.nextval, 'Dluga' , '12A', 'Kielce', 'Polska', '25-005');

INSERT INTO adres
VALUES(Adres_id.nextval, 'Krotka' , '4B', 'Warszawa', 'Polska', '26-001');

INSERT INTO adres
VALUES(Adres_id.nextval, 'Mila' , '11A', 'Krakow', 'Polska', '24-007');

INSERT INTO adres
VALUES(Adres_id.nextval, 'Warszawska' , '24C', 'Przysucha', 'Polska', '26-400');

INSERT INTO adres
VALUES(Adres_id.nextval, 'Slowackiego' , '6A', 'Opoczno', 'Polska', '23-500');

INSERT INTO adres
VALUES(Adres_id.nextval, 'Legionow Polskich' , '8B', 'Przysucha', 'Polska', '26-400');

INSERT INTO adres
VALUES(Adres_id.nextval, 'Warszawska' , '64D', 'Kielce', 'Polska', '25-007');

INSERT INTO adres
VALUES(Adres_id.nextval, 'Sienkiewicza' , '6D', 'Lodz', 'Polska', '23-006');

--Inserty dla tabeli Uzytkownik
INSERT INTO uzytkownik
VALUES(Uzytkownik_id.nextval, 'Adam' , 'Nowak', 'nowak@gmail.com',TO_DATE('03.03.2003','DD.MM.YYYY'), 1);

INSERT INTO uzytkownik
VALUES(Uzytkownik_id.nextval, 'Julia' , 'Nowak', 'julianowak@gmail.com',TO_DATE('02.02.2003','DD.MM.YYYY'), 1);

INSERT INTO uzytkownik
VALUES(Uzytkownik_id.nextval, 'Jan' , 'Niski', 'niski@gmail.com',TO_DATE('13.05.2004','DD.MM.YYYY'), 4);

INSERT INTO uzytkownik
VALUES(Uzytkownik_id.nextval, 'Alicja' , 'Kochanowska', 'akocha@wp.pl',TO_DATE('01.01.2002','DD.MM.YYYY'), 8);

INSERT INTO uzytkownik
VALUES(Uzytkownik_id.nextval, 'Marek' , 'Kowalski', 'mkowalski@wp.pl',TO_DATE('06.09.2005','DD.MM.YYYY'), 2);

INSERT INTO uzytkownik
VALUES(Uzytkownik_id.nextval, 'Jakub' , 'Wysoki', 'wysokij@o2.pl',TO_DATE('25.07.2006','DD.MM.YYYY'), 3);

INSERT INTO uzytkownik
VALUES(Uzytkownik_id.nextval, 'Walentyna' , 'Nowacka', 'nowacka@gmail.com',TO_DATE('14.05.2002','DD.MM.YYYY'), 7);

INSERT INTO uzytkownik
VALUES(Uzytkownik_id.nextval, 'Lena' , 'Nowak', 'nowaklena@o2.pl',TO_DATE('23.11.2004','DD.MM.YYYY'), 6);

INSERT INTO uzytkownik
VALUES(Uzytkownik_id.nextval, 'Maja' , 'Wisla', 'majaw@wp.pl',TO_DATE('30.08.2003','DD.MM.YYYY'), 5);

--Inserty dla tabeli Sprzedajacy
INSERT INTO sprzedajacy
VALUES(1, 4.75, 2);

INSERT INTO sprzedajacy
VALUES(4, 2, 1);

INSERT INTO sprzedajacy
VALUES(2, 5, 5);

INSERT INTO sprzedajacy
VALUES(3, 4.75, 4);

INSERT INTO sprzedajacy
VALUES(5, 4, 1);

--Inserty dla tabeli Towar
INSERT INTO towar
VALUES(Towar_id.nextval, 'Krem do twarzy', 'Nowy', 21.99, 3, 2);

INSERT INTO towar
VALUES(Towar_id.nextval, 'Emulsja do twarzy', 'Nowy', 15.99, 3, 2);

INSERT INTO towar
VALUES(Towar_id.nextval, 'Silnik 2.0 HDI 110KM', 'Uzywany', 900, 9, 1);

INSERT INTO towar
VALUES(Towar_id.nextval, 'T-Shirt meski XL bialy', 'Nowy', 29.99, 2, 1);

INSERT INTO towar
VALUES(Towar_id.nextval, 'Gra planszowa statki', 'Nowy', 49.99, 8, 4);

INSERT INTO towar
VALUES(Towar_id.nextval, 'Gra planszowa piramida', 'Nowy', 39.99, 8, 4);

INSERT INTO towar
VALUES(Towar_id.nextval, 'Orzechy wloskie 1kg', 'Nowy', 29.99, 4, 1);

INSERT INTO towar
VALUES(Towar_id.nextval, 'Ksiazka - Jak zostac milionerem', 'Uzywany', 3, 8, 3);

INSERT INTO towar
VALUES(Towar_id.nextval, 'Trackmania United Forever PC', 'Nowy', 80, 8, 3);

--Inserty dla tabeli Kupujacy
INSERT INTO kupujacy
VALUES(5,0);

INSERT INTO kupujacy
VALUES(6,0);

INSERT INTO kupujacy
VALUES(7,1);

INSERT INTO kupujacy
VALUES(8,0);

INSERT INTO kupujacy
VALUES(9,1);

--Inserty dla tabeli Koszyk
INSERT INTO koszyk
VALUES(Koszyk_id.nextval, 5, 1, 1);

INSERT INTO koszyk
VALUES(Koszyk_id.nextval, 6, 1, 2);

INSERT INTO koszyk
VALUES(Koszyk_id.nextval, 7, 1, 5);

INSERT INTO koszyk
VALUES(Koszyk_id.nextval, 8, 1, 1);

INSERT INTO koszyk
VALUES(Koszyk_id.nextval, 9, 1, 6);

--Inserty dla tabeli Platnosc
INSERT INTO platnosc
VALUES(Platnosc_id.nextval, 'Przelew bankowy');

INSERT INTO platnosc
VALUES(Platnosc_id.nextval, 'Karta bankowa');

INSERT INTO platnosc
VALUES(Platnosc_id.nextval, 'Przelew tradycyjny');

INSERT INTO platnosc
VALUES(Platnosc_id.nextval, 'PayPal');

INSERT INTO platnosc
VALUES(Platnosc_id.nextval, 'Za pobraniem');

--Inserty dla tabeli Faktura
INSERT INTO faktura
VALUES(Faktura_id.nextval,TO_DATE('17.05.2009','DD.MM.YYYY'), 1, 1);

INSERT INTO faktura
VALUES(Faktura_id.nextval,TO_DATE('25.12.2010','DD.MM.YYYY'), 2, 2);

INSERT INTO faktura
VALUES(Faktura_id.nextval,TO_DATE('04.12.2016','DD.MM.YYYY'), 3, 1);

INSERT INTO faktura
VALUES(Faktura_id.nextval,TO_DATE('13.09.2017','DD.MM.YYYY'), 4, 3);

INSERT INTO faktura
VALUES(Faktura_id.nextval,TO_DATE('01.01.2008','DD.MM.YYYY'), 5, 5);

--Inserty dla tabeli Producent-Towar
INSERT INTO producent_towar
VALUES(1, 1);

INSERT INTO producent_towar
VALUES(1, 2);

INSERT INTO producent_towar
VALUES(6, 3);

INSERT INTO producent_towar
VALUES(4, 4);

INSERT INTO producent_towar
VALUES(2, 5);

INSERT INTO producent_towar
VALUES(2, 6);

INSERT INTO producent_towar
VALUES(3,7);

INSERT INTO producent_towar
VALUES(5,8);

INSERT INTO producent_towar
VALUES(7,9);

--Inserty dla tabeli Towar-Koszyk
INSERT INTO towar_koszyk
VALUES(1, 1, 1);

INSERT INTO towar_koszyk
VALUES(2, 1, 2);

INSERT INTO towar_koszyk
VALUES(4, 2, 1);

INSERT INTO towar_koszyk
VALUES(7, 2, 4);

INSERT INTO towar_koszyk
VALUES(5, 3, 1);

INSERT INTO towar_koszyk
VALUES(9, 4, 1);

INSERT INTO towar_koszyk
VALUES(8, 5, 1);