--Dodający kolumnę
ALTER TABLE platnosc
ADD prowizja float;

--Dodający ograniczenia do dodanej kolumny
ALTER TABLE platnosc
ADD CONSTRAINT prowizja_ct UNIQUE(prowizja);

--Usuwający ograniczenia dotyczące dodanej kolumny
ALTER TABLE platnosc
DROP CONSTRAINT prowizja_ct;

--Usuwający dodaną kolumnę
ALTER TABLE platnosc
DROP COLUMN prowizja;