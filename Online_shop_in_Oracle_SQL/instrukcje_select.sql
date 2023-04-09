--1. Stwórz widok i Wyswietl Imiona, nazwiska, ocenÄ™ oraz liczbÄ™ sprzedanych towarÃ³w, tych sprzedajÄ…cych ktÃ³rych nazwiska zaczynajÄ… siÄ™ na "N".
CREATE OR REPLACE VIEW Widok_1 AS
SELECT uzytkownik.imie, uzytkownik.nazwisko, sprzedajacy.ocena_sprzedajacego, sprzedajacy.ilosc_sprzedanych_towarow
FROM sprzedajacy
JOIN uzytkownik
ON id_sprzedajacego=id_uzytkownika
WHERE uzytkownik.nazwisko LIKE 'N%';
SELECT * FROM Widok_1;
--2. Stwórz i wyœwietl widok zawieraj¹cy imiona i nazwiska o najwiekszej liczbnie znakow wraz z ich fonetyczna wymowa.
CREATE OR REPLACE VIEW liczba_znakow AS
SELECT uzytkownik.imie Imie,uzytkownik.nazwisko Nazwisko,SOUNDEX(uzytkownik.imie)Fonetycznie_Imie,SOUNDEX(uzytkownik.nazwisko) Fonetycznie_Nazwisko
FROM uzytkownik
WHERE LENGTH(uzytkownik.imie)>(
SELECT AVG(LENGTH(uzytkownik.imie))
FROM uzytkownik)
AND LENGTH(uzytkownik.nazwisko)>(
SELECT AVG(LENGTH(uzytkownik.nazwisko))
FROM uzytkownik);
SELECT * FROM liczba_znakow;
--3. Wyswietl wszystkich kupujacych, ktorzy wydali wiecej niz 80% z kwoty maksymalnej dostawy, pochodzacych z Polski lub Francji
SELECT *
FROM kupujacy
JOIN uzytkownik
ON uzytkownik.id_uzytkownika=kupujacy.id_kupujacego
JOIN adres
ON adres.id_adresu=uzytkownik.id_adresu
JOIN koszyk
ON kupujacy.id_kupujacego=koszyk.id_kupujacego
JOIN dostawa 
ON dostawa.id_dostawy=koszyk.id_dostawy
WHERE (adres.kraj='Polska' 
OR adres.kraj='Francja')
AND dostawa.cena_dostawy > (0.8 * (
SELECT MAX(cena_dostawy)
FROM dostawa));
--4. Wyswietl ile kupujacy wydali na zakupy malejaco po kwocie 
SELECT kupujacy.id_kupujacego AS Klient,SUM(towar.cena_towaru*towar_koszyk.ile_towaru+dostawa.cena_dostawy) AS Kwota
FROM koszyk
JOIN towar_koszyk
ON koszyk.id_koszyka=towar_koszyk.id_koszyka
JOIN dostawa
ON dostawa.id_dostawy=koszyk.id_dostawy
JOIN towar
ON towar_koszyk.id_towaru=towar.id_towaru
JOIN kupujacy
ON koszyk.id_kupujacego=kupujacy.id_kupujacego
GROUP BY kupujacy.id_kupujacego
ORDER BY Kwota DESC;
--5. Wyswietl pierwszego zarejestrowanego sprzedajacego i kupujacego 
SELECT DISTINCT uK.imie,uK.nazwisko,uK.data_rejestracji,uS.imie,uS.nazwisko,uS.data_rejestracji
FROM sklep
JOIN koszyk
ON koszyk.id_sklepu=sklep.id_sklepu
JOIN kupujacy
ON koszyk.id_kupujacego=kupujacy.id_kupujacego
JOIN uzytkownik uK
ON kupujacy.id_kupujacego=uK.id_uzytkownika
JOIN towar_koszyk
ON towar_koszyk.id_koszyka=koszyk.id_koszyka
JOIN towar
ON towar.id_towaru=towar_koszyk.id_towaru
JOIN sprzedajacy
ON sprzedajacy.id_sprzedajacego=towar.id_sprzedajacego
JOIN uzytkownik uS
ON sprzedajacy.id_sprzedajacego=uS.id_uzytkownika
WHERE uK.data_rejestracji = (
SELECT MIN(data_rejestracji)
FROM uzytkownik
JOIN sprzedajacy
ON uzytkownik.id_uzytkownika=sprzedajacy.id_sprzedajacego)
OR uS.data_rejestracji = (
SELECT MIN(data_rejestracji)
FROM uzytkownik
JOIN kupujacy
ON kupujacy.id_kupujacego=uzytkownik.id_uzytkownika);
--6. Stworz i wyswietl widok ktory wyswietla sprzedajacych rosnaco po ocene pomiedzy zadanymi wartosciami
CREATE OR REPLACE VIEW Ocena AS
SELECT * 
FROM sprzedajacy
JOIN uzytkownik
ON uzytkownik.id_uzytkownika=sprzedajacy.id_sprzedajacego
WHERE sprzedajacy.ocena_sprzedajacego BETWEEN &p1 AND &p2
ORDER BY sprzedajacy.ocena_sprzedajacego ASC;
SELECT * FROM Ocena;
--7. Wyswietl jaka metoda platnosci jest najpopularniejsza
SELECT count(platnosc.id_platnosci),platnosc.rodzaj_platnosci
FROM faktura
JOIN platnosc
ON platnosc.id_platnosci=faktura.id_platnosci
GROUP BY platnosc.rodzaj_platnosci
ORDER BY count(platnosc.id_platnosci) DESC
OFFSET 0
ROWS FETCH NEXT 1
ROWS ONLY;
--8. Stworz i wyswietl widok ktory wyswietla planowana date dostawy towarow kosmetycznych i motoryzacyjnych (data dostawy jest zaplanowana 3 dni po dacie zakupu)
CREATE OR REPLACE VIEW data_dostawy AS
SELECT DISTINCT TO_CHAR(faktura.data_zakupu+3,'DD.MM.YYYY') as planowana_data_dostawy,kategoria.nazwa_kategorii
FROM faktura
JOIN koszyk
ON koszyk.id_koszyka=faktura.id_koszyka
JOIN towar_koszyk
ON towar_koszyk.id_koszyka=koszyk.id_koszyka
JOIN towar
ON towar_koszyk.id_towaru=towar.id_towaru
JOIN kategoria
ON towar.id_kategorii=kategoria.id_kategorii
WHERE kategoria.nazwa_kategorii='Kosmetyki'
OR kategoria.nazwa_kategorii='Motoryzacja';
SELECT * FROM data_dostawy;
--9. Stworz i wyswietl widok ktory pokazuje ile oszob mieszka pod jednym adresem
CREATE OR REPLACE VIEW rodziny AS
SELECT adres.ulica,adres.numer_domu,adres.miasto,adres.kraj,adres.kod_pocztowy,
count(uzytkownik.id_uzytkownika) as liczebnosc
FROM uzytkownik
JOIN adres
ON adres.id_adresu=uzytkownik.id_adresu
GROUP BY adres.ulica,adres.numer_domu,adres.miasto,adres.kraj,adres.kod_pocztowy;
SELECT * FROM rodziny;
--10. Wyswietl wszystkich kupujacych wraz z insformacja jakie maja konto
SELECT uzytkownik.imie,uzytkownik.nazwisko,
CASE WHEN czy_premium = 1 THEN 'premium'
WHEN czy_premium = 0 THEN 'zwykle'
ELSE 'nieokreslone' END AS Rodzaj_Konta
FROM kupujacy
JOIN uzytkownik
ON uzytkownik.id_uzytkownika=kupujacy.id_kupujacego;
