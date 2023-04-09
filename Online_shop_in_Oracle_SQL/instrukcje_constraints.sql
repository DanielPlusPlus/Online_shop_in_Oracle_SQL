--Ograniczenie klucza glownego - dodanie wartosci juz uzywanej
INSERT INTO sklep VALUES (1,'SklepTest','.pl','Polska');
--Ograniczenie NOT NULL - dodanie wartosci NULL
INSERT INTO sklep VALUES (26,NULL,'.pl','Polska');
--Ograniczenie CHECK - dodanie wartosci spoza zadanych
INSERT INTO sklep VALUES (37,'SklepTest2','.abc','Polska');
--Ograniczenie NOT NULL - dodanie wartosci NULL
INSERT INTO sklep VALUES (54,'SklepTest3','.cr',NULL);