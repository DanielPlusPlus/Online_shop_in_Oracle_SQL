CREATE TABLE sklep(
id_sklepu NUMBER CONSTRAINT id_sklepu_pk PRIMARY KEY,
nazwa_sklepu VARCHAR2(50) NOT NULL,
domena VARCHAR2(63) CONSTRAINT domena_check
CHECK (domena IN('.pl','.de','.uk','.it','.fk','.es','.us','.cr','.ar')),
kraj VARCHAR2(60) NOT NULL
);

CREATE TABLE kategoria(
id_kategorii NUMBER CONSTRAINT id_kategorii_pk PRIMARY KEY,
nazwa_kategorii VARCHAR2(50)
);

CREATE TABLE producent(
id_producenta NUMBER CONSTRAINT id_producenta_pk PRIMARY KEY,
nazwa_producenta VARCHAR2(50)
);

CREATE TABLE dostawa(
id_dostawy NUMBER CONSTRAINT id_dostawy_pk PRIMARY KEY,
sposob_dostawy VARCHAR2(40),
cena_dostawy FLOAT
);

CREATE TABLE adres(
id_adresu NUMBER CONSTRAINT id_adresu_pk PRIMARY KEY,
ulica VARCHAR2(50),
numer_domu VARCHAR2(10),
miasto VARCHAR2(60),
kraj VARCHAR2(60),
kod_pocztowy VARCHAR2(10)
);

CREATE TABLE uzytkownik(
id_uzytkownika NUMBER CONSTRAINT id_uzytkownika_pk PRIMARY KEY,
imie VARCHAR2(60),
nazwisko VARCHAR2(60),
email VARCHAR2(50),
data_rejestracji DATE DEFAULT (sysdate),
id_adresu NUMBER CONSTRAINT id_adresu_fk
REFERENCES adres(id_adresu)
);

CREATE TABLE sprzedajacy(
id_sprzedajacego NUMBER CONSTRAINT sprzedajacy_uzytkownik_fk
REFERENCES uzytkownik(id_uzytkownika),
ocena_sprzedajacego FLOAT,
ilosc_sprzedanych_towarow NUMBER,
CONSTRAINT id_sprzedajacego_pk PRIMARY KEY(id_sprzedajacego)
);

CREATE TABLE towar(
id_towaru NUMBER CONSTRAINT id_towaru_pk PRIMARY KEY,
nazwa_towaru VARCHAR2(50),
stan_towaru VARCHAR2(20),
cena_towaru FLOAT,
id_kategorii NUMBER CONSTRAINT towar_kategoria_fk
REFERENCES kategoria(id_kategorii),
id_sprzedajacego NUMBER CONSTRAINT towar_sprzedajacy_fk
REFERENCES sprzedajacy(id_sprzedajacego)
);

CREATE TABLE kupujacy(
id_kupujacego NUMBER CONSTRAINT kupujacy_uzytkownik_fk
REFERENCES uzytkownik(id_uzytkownika),
czy_premium NUMBER,
CONSTRAINT id_kupujacego_pk PRIMARY KEY(id_kupujacego)
);

CREATE TABLE koszyk(
id_koszyka NUMBER CONSTRAINT id_koszyka_pk PRIMARY KEY,
id_kupujacego NUMBER CONSTRAINT koszyk_kupujacy_fk
REFERENCES kupujacy(id_kupujacego),
id_sklepu NUMBER CONSTRAINT koszyk_sklep_fk
REFERENCES sklep(id_sklepu),
id_dostawy NUMBER CONSTRAINT koszyk_dostawa_fk
REFERENCES dostawa(id_dostawy)
);

CREATE TABLE platnosc(
id_platnosci NUMBER CONSTRAINT id_platnosci_pk PRIMARY KEY,
rodzaj_platnosci VARCHAR2(50)
);

CREATE TABLE faktura(
id_faktury NUMBER CONSTRAINT id_faktury_pk PRIMARY KEY,
data_zakupu DATE,
id_koszyka NUMBER CONSTRAINT faktura_koszyk_fk
REFERENCES koszyk(id_koszyka),
id_platnosci NUMBER CONSTRAINT id_platnosci_fk
REFERENCES platnosc(id_platnosci)
);

CREATE TABLE producent_towar(
id_producenta NUMBER CONSTRAINT producent_towar_producent_fk
REFERENCES producent(id_producenta),
id_towaru NUMBER CONSTRAINT producent_towar_towar_fk
REFERENCES towar(id_towaru),
CONSTRAINT producent_towar_pk PRIMARY KEY(id_producenta, id_towaru)
);

CREATE TABLE towar_koszyk(
id_towaru NUMBER CONSTRAINT towar_koszyk_oferta_fk
REFERENCES towar(id_towaru),
id_koszyka NUMBER CONSTRAINT oferta_koszyk_koszyk_fk
REFERENCES koszyk(id_koszyka),
ile_towaru NUMBER,
CONSTRAINT towar_koszyk_pk PRIMARY KEY(id_towaru, id_koszyka)
);