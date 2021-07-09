CREATE DATABASE F1_2019
GO
USE F1_2019
GO
CREATE TABLE Kraje
(
	id_kraju INT CONSTRAINT PK_id_kraju PRIMARY KEY IDENTITY(1,1) ,
	nazwa_kraju NVARCHAR(25) NOT NULL UNIQUE
)
CREATE TABLE Kierowcy
(
	id_kierowcy INT CONSTRAINT PK_kierowcy PRIMARY KEY IDENTITY(1,1),
	imiê NVARCHAR(20),
	nazwisko NVARCHAR(25),
	reprezentowany_kraj NVARCHAR(25) CONSTRAINT FK_rk REFERENCES Kraje(nazwa_kraju),
	numer_kierowcy INT NOT NULL UNIQUE,
)
CREATE TABLE Dyrektorzy
(
	id_dyrektora INT CONSTRAINT PK_dyrektora PRIMARY KEY IDENTITY(1,1),
	imie NVARCHAR(20),
	nazwisko NVARCHAR(25)
)
CREATE TABLE Zespo³y
(
	id_zespo³u INT CONSTRAINT PK_zespo³u PRIMARY KEY IDENTITY(1,1),
	nazwa NVARCHAR(25) NOT NULL UNIQUE,
	numer_pierwszego_kierowcy INT CONSTRAINT FK_nr1_kierowcy REFERENCES Kierowcy(numer_kierowcy),
	numer_drugiego_kierowcy INT CONSTRAINT FK_nr2_kierowcy REFERENCES Kierowcy(numer_kierowcy),
	id_dyrektora INT CONSTRAINT FK_id_dyrektora REFERENCES Dyrektorzy(id_dyrektora),
	baza NVARCHAR(50)
)
CREATE TABLE Tory
(
	id_toru INT CONSTRAINT PK_toru PRIMARY KEY IDENTITY(1,1),
	nazwa_toru NVARCHAR(60) NOT NULL UNIQUE,
	lokalizacja NVARCHAR(25) CONSTRAINT FK_lokalizacja REFERENCES Kraje(nazwa_kraju),
	iloœæ_zakrêtów INT,
	d³ugoœæ_toru DECIMAL(5,3),
	okr¹¿enia INT
)
CREATE TABLE Kwalifikacje
(
	id_kwalifikacji INT CONSTRAINT PK_kwalifikacji PRIMARY KEY IDENTITY(1,1),
	pole_position INT CONSTRAINT FK_PP REFERENCES Kierowcy(id_kierowcy),
	Drugie_miejsce INT CONSTRAINT FK_Drugie_miejsce REFERENCES Kierowcy(id_kierowcy),
	Trzecie_miejsce INT CONSTRAINT FK_Trzecie_miejsce REFERENCES Kierowcy(id_kierowcy),
	data_kwalifikacji DATE,
	czas_pp	NVARCHAR(10)
)
CREATE TABLE Wyœcigi
(
	id_wyœcigu INT CONSTRAINT PK_wyœcigu PRIMARY KEY IDENTITY(1,1),
	nazwa_wyœcigu NVARCHAR(30),
	tor NVARCHAR(60) CONSTRAINT FK_tor REFERENCES Tory(nazwa_toru),
	zwyciêzca INT CONSTRAINT FK_zwyciezca REFERENCES Kierowcy(numer_kierowcy),
	zwyciêski_zespó³ INT CONSTRAINT FK_zwyciêski_zespó³ REFERENCES Zespo³y(id_zespo³u),
	najszybszy_czas_wyœcigu TIME(3),
	data_wyscigu DATE
)


INSERT INTO Kraje(nazwa_kraju) VALUES('Wielka Brytania');
INSERT INTO Kraje(nazwa_kraju) VALUES('Finlandia');
INSERT INTO Kraje(nazwa_kraju) VALUES('Holandia');
INSERT INTO Kraje(nazwa_kraju) VALUES('Monako');
INSERT INTO Kraje(nazwa_kraju) VALUES('Niemcy');
INSERT INTO Kraje(nazwa_kraju) VALUES('Hiszpania');
INSERT INTO Kraje(nazwa_kraju) VALUES('Francja');
INSERT INTO Kraje(nazwa_kraju) VALUES('Tailandia');
INSERT INTO Kraje(nazwa_kraju) VALUES('Australia');
INSERT INTO Kraje(nazwa_kraju) VALUES('Meksyk');
INSERT INTO Kraje(nazwa_kraju) VALUES('Rosja');
INSERT INTO Kraje(nazwa_kraju) VALUES('Kanada');
INSERT INTO Kraje(nazwa_kraju) VALUES('Dania');
INSERT INTO Kraje(nazwa_kraju) VALUES('W³ochy');
INSERT INTO Kraje(nazwa_kraju) VALUES('Polska');
INSERT INTO Kraje(nazwa_kraju) VALUES('Austria');
INSERT INTO Kraje(nazwa_kraju) VALUES('USA');
INSERT INTO Kraje(nazwa_kraju) VALUES('Bahrajn');
INSERT INTO Kraje(nazwa_kraju) VALUES('Chiny');
INSERT INTO Kraje(nazwa_kraju) VALUES('Azerbejd¿an');
INSERT INTO Kraje(nazwa_kraju) VALUES('Wêgry');
INSERT INTO Kraje(nazwa_kraju) VALUES('Belgia');
INSERT INTO Kraje(nazwa_kraju) VALUES('Singapur');
INSERT INTO Kraje(nazwa_kraju) VALUES('Japonia');
INSERT INTO Kraje(nazwa_kraju) VALUES('Brazylia');
INSERT INTO Kraje(nazwa_kraju) VALUES('Abu Zabi');


INSERT INTO Dyrektorzy(imie, nazwisko) VALUES('Toto', 'Wolf');
INSERT INTO Dyrektorzy(imie, nazwisko) VALUES('Mattia', 'Binotto');
INSERT INTO Dyrektorzy(imie, nazwisko) VALUES('Christian', 'Horner');
INSERT INTO Dyrektorzy(imie, nazwisko) VALUES('Zak', 'Brown');
INSERT INTO Dyrektorzy(imie, nazwisko) VALUES('Cyril', 'Abiteboult');
INSERT INTO Dyrektorzy(imie, nazwisko) VALUES('Franz', 'Tost');
INSERT INTO Dyrektorzy(imie, nazwisko) VALUES('Otmar', 'Szafnauer');
INSERT INTO Dyrektorzy(imie, nazwisko) VALUES('Frédéric', 'Vasseur');
INSERT INTO Dyrektorzy(imie, nazwisko) VALUES('Günther', 'Steiner');
INSERT INTO Dyrektorzy(imie, nazwisko) VALUES('Simon', 'Roberts');


INSERT INTO Kierowcy(imiê, nazwisko, reprezentowany_kraj, numer_kierowcy) VALUES('Lewis', 'Hamilton', 'Wielka Brytania','44');
INSERT INTO Kierowcy(imiê, nazwisko, reprezentowany_kraj, numer_kierowcy) VALUES('Valtteri', 'Bottas', 'Finlandia','77');
INSERT INTO Kierowcy(imiê, nazwisko, reprezentowany_kraj, numer_kierowcy) VALUES('Max', 'Verstappen', 'Holandia','33');
INSERT INTO Kierowcy(imiê, nazwisko, reprezentowany_kraj, numer_kierowcy) VALUES('Charles', 'Leclerc', 'Monako','16');
INSERT INTO Kierowcy(imiê, nazwisko, reprezentowany_kraj, numer_kierowcy) VALUES('Sebastian', 'Vettel', 'Niemcy','5');
INSERT INTO Kierowcy(imiê, nazwisko, reprezentowany_kraj, numer_kierowcy) VALUES('Carlos Jr.', 'Sainz', 'Hiszpania','55');
INSERT INTO Kierowcy(imiê, nazwisko, reprezentowany_kraj, numer_kierowcy) VALUES('Pierre', 'Gasly', 'Francja','10');
INSERT INTO Kierowcy(imiê, nazwisko, reprezentowany_kraj, numer_kierowcy) VALUES('Alexander', 'Albon', 'Tailandia','23');
INSERT INTO Kierowcy(imiê, nazwisko, reprezentowany_kraj, numer_kierowcy) VALUES('Daniel', 'Ricciardo', 'Australia','3');
INSERT INTO Kierowcy(imiê, nazwisko, reprezentowany_kraj, numer_kierowcy) VALUES('Sergio', 'Pérez', 'Meksyk','11');
INSERT INTO Kierowcy(imiê, nazwisko, reprezentowany_kraj, numer_kierowcy) VALUES('Lando', 'Norris', 'Wielka Brytania','4');
INSERT INTO Kierowcy(imiê, nazwisko, reprezentowany_kraj, numer_kierowcy) VALUES('Kimi', 'Räikkönen', 'Finlandia','7');
INSERT INTO Kierowcy(imiê, nazwisko, reprezentowany_kraj, numer_kierowcy) VALUES('Daniil', 'Kvyat', 'Rosja','26');
INSERT INTO Kierowcy(imiê, nazwisko, reprezentowany_kraj, numer_kierowcy) VALUES('Nico', 'Hülkenberg', 'Niemcy','27');
INSERT INTO Kierowcy(imiê, nazwisko, reprezentowany_kraj, numer_kierowcy) VALUES('Lance', 'Stroll', 'Kanada','18');
INSERT INTO Kierowcy(imiê, nazwisko, reprezentowany_kraj, numer_kierowcy) VALUES('Kevin', 'Magnussen', 'Dania','20');
INSERT INTO Kierowcy(imiê, nazwisko, reprezentowany_kraj, numer_kierowcy) VALUES('Antonio', 'Giovinazzi', 'W³ochy','99');
INSERT INTO Kierowcy(imiê, nazwisko, reprezentowany_kraj, numer_kierowcy) VALUES('Romain', 'Grosjean', 'Francja','8');
INSERT INTO Kierowcy(imiê, nazwisko, reprezentowany_kraj, numer_kierowcy) VALUES('Robert', 'Kubica', 'Polska','88');
INSERT INTO Kierowcy(imiê, nazwisko, reprezentowany_kraj, numer_kierowcy) VALUES('George', 'Russell', 'Wielka Brytania','63');


INSERT INTO Zespo³y(nazwa, numer_pierwszego_kierowcy, numer_drugiego_kierowcy, id_dyrektora, baza)
VALUES('Mercedes','44','77','1','Brackley i Brixworth, Wielka Brytania');
INSERT INTO Zespo³y(nazwa, numer_pierwszego_kierowcy, numer_drugiego_kierowcy, id_dyrektora, baza)
VALUES('Ferrari','5','16','2','Maranello, W³ochy');
INSERT INTO Zespo³y(nazwa, numer_pierwszego_kierowcy, numer_drugiego_kierowcy, id_dyrektora, baza)
VALUES('Red Bull Racing','33','23','3','Milton Keynes, Wielka Brytania');
INSERT INTO Zespo³y(nazwa, numer_pierwszego_kierowcy, numer_drugiego_kierowcy, id_dyrektora, baza)
VALUES('McLaren','4','55','4','Woking, Wielka Brytania');
INSERT INTO Zespo³y(nazwa, numer_pierwszego_kierowcy, numer_drugiego_kierowcy, id_dyrektora, baza)
VALUES('Renault','3','27','5','Enstone, Wielka Brytania i Viry-Châtillon, Francja');
INSERT INTO Zespo³y(nazwa, numer_pierwszego_kierowcy, numer_drugiego_kierowcy, id_dyrektora, baza)
VALUES('Alpha Tauri','10','26','6','Faenza, W³ochy');
INSERT INTO Zespo³y(nazwa, numer_pierwszego_kierowcy, numer_drugiego_kierowcy, id_dyrektora, baza)
VALUES('Racing Point','11','18','7','Silverstone, Wielka Brytania');
INSERT INTO Zespo³y(nazwa, numer_pierwszego_kierowcy, numer_drugiego_kierowcy, id_dyrektora, baza)
VALUES('Alfa Romeo','7','99','8','Hinwil, Szwajcaria');
INSERT INTO Zespo³y(nazwa, numer_pierwszego_kierowcy, numer_drugiego_kierowcy, id_dyrektora, baza)
VALUES('HAAS','8','20','9','Kannapolis, USA i Banbury, Wielka Brytania');
INSERT INTO Zespo³y(nazwa, numer_pierwszego_kierowcy, numer_drugiego_kierowcy, id_dyrektora, baza)
VALUES('Williams Racing','63','88','10','Grove, Wielka Brytania');


INSERT INTO Tory(nazwa_toru, lokalizacja, iloœæ_zakrêtów, d³ugoœæ_toru, okr¹¿enia) 
VALUES ('Albert Park Circut', 'Australia', '16', '5.303', '58');
INSERT INTO Tory(nazwa_toru, lokalizacja, iloœæ_zakrêtów, d³ugoœæ_toru, okr¹¿enia) 
VALUES ('Bahrain International Circuit', 'Bahrajn', '15', '5.412', '57');
INSERT INTO Tory(nazwa_toru, lokalizacja, iloœæ_zakrêtów, d³ugoœæ_toru, okr¹¿enia) 
VALUES ('Shanghai International Circuit', 'Chiny', '16', '5.451', '56');
INSERT INTO Tory(nazwa_toru, lokalizacja, iloœæ_zakrêtów, d³ugoœæ_toru, okr¹¿enia) 
VALUES ('Baku street circuit', 'Azerbejd¿an', '20', '6.003', '51');
INSERT INTO Tory(nazwa_toru, lokalizacja, iloœæ_zakrêtów, d³ugoœæ_toru, okr¹¿enia) 
VALUES ('Catalunya Circuit', 'Hiszpania', '16', '4.655', '66');
INSERT INTO Tory(nazwa_toru, lokalizacja, iloœæ_zakrêtów, d³ugoœæ_toru, okr¹¿enia) 
VALUES ('Circuit de Monaco', 'Monako', '18', '3.337', '78');
INSERT INTO Tory(nazwa_toru, lokalizacja, iloœæ_zakrêtów, d³ugoœæ_toru, okr¹¿enia) 
VALUES ('Gilles Villeneuve Circuit', 'Kanada', '15', '4.361', '70');
INSERT INTO Tory(nazwa_toru, lokalizacja, iloœæ_zakrêtów, d³ugoœæ_toru, okr¹¿enia) 
VALUES ('Circuit Paul Ricard', 'Francja', '15', '5.842', '53');
INSERT INTO Tory(nazwa_toru, lokalizacja, iloœæ_zakrêtów, d³ugoœæ_toru, okr¹¿enia) 
VALUES ('Red Bull Ring', 'Austria', '10', '4.326', '71');
INSERT INTO Tory(nazwa_toru, lokalizacja, iloœæ_zakrêtów, d³ugoœæ_toru, okr¹¿enia) 
VALUES ('Silverstone Circuit', 'Wielka Brytania', '18', '5.891', '52');
INSERT INTO Tory(nazwa_toru, lokalizacja, iloœæ_zakrêtów, d³ugoœæ_toru, okr¹¿enia) 
VALUES ('Hockenheimring', 'Niemcy', '13', '4.574', '64');
INSERT INTO Tory(nazwa_toru, lokalizacja, iloœæ_zakrêtów, d³ugoœæ_toru, okr¹¿enia) 
VALUES ('Hungaroring', 'Wêgry', '16', '4.381', '70');
INSERT INTO Tory(nazwa_toru, lokalizacja, iloœæ_zakrêtów, d³ugoœæ_toru, okr¹¿enia) 
VALUES ('Circuit de Spa-Francorchamps', 'Belgia', '19', '7.004', '44');
INSERT INTO Tory(nazwa_toru, lokalizacja, iloœæ_zakrêtów, d³ugoœæ_toru, okr¹¿enia) 
VALUES ('Monza Circuit', 'W³ochy', '11', '5.793', '53');
INSERT INTO Tory(nazwa_toru, lokalizacja, iloœæ_zakrêtów, d³ugoœæ_toru, okr¹¿enia) 
VALUES ('Marina Bay Street Circuit', 'Singapur', '23', '5.065', '61');
INSERT INTO Tory(nazwa_toru, lokalizacja, iloœæ_zakrêtów, d³ugoœæ_toru, okr¹¿enia) 
VALUES ('Sochi Autodrom', 'Rosja', '18', '5.872', '53');
INSERT INTO Tory(nazwa_toru, lokalizacja, iloœæ_zakrêtów, d³ugoœæ_toru, okr¹¿enia) 
VALUES ('Suzuka Circuit', 'Japonia', '18', '5.807', '52');
INSERT INTO Tory(nazwa_toru, lokalizacja, iloœæ_zakrêtów, d³ugoœæ_toru, okr¹¿enia) 
VALUES ('Autódromo Hermanos Rodríguez', 'Meksyk', '17', '4.305', '71');
INSERT INTO Tory(nazwa_toru, lokalizacja, iloœæ_zakrêtów, d³ugoœæ_toru, okr¹¿enia) 
VALUES ('Circuit of The Americas', 'USA', '20', '5.500', '56');
INSERT INTO Tory(nazwa_toru, lokalizacja, iloœæ_zakrêtów, d³ugoœæ_toru, okr¹¿enia) 
VALUES ('Interlagos Circuit', 'Brazylia', '15', '4.309', '71');
INSERT INTO Tory(nazwa_toru, lokalizacja, iloœæ_zakrêtów, d³ugoœæ_toru, okr¹¿enia) 
VALUES ('Yas Marina Circuit', 'Abu Zabi', '21', '5.554', '55');


INSERT INTO Kwalifikacje(pole_position, Drugie_miejsce, Trzecie_miejsce, data_kwalifikacji, czas_pp) 
VALUES('1', '2', '5','2019.03.16', '1:20.486');
INSERT INTO Kwalifikacje(pole_position, Drugie_miejsce, Trzecie_miejsce, data_kwalifikacji, czas_pp) 
VALUES('4', '5', '1','2019.03.30', '1:27.866');
INSERT INTO Kwalifikacje(pole_position, Drugie_miejsce, Trzecie_miejsce, data_kwalifikacji, czas_pp) 
VALUES('2', '1', '5','2019.04.13', '1:31.547');
INSERT INTO Kwalifikacje(pole_position, Drugie_miejsce, Trzecie_miejsce, data_kwalifikacji, czas_pp) 
VALUES('2', '1', '5','2019.04.27', '1:40.495');
INSERT INTO Kwalifikacje(pole_position, Drugie_miejsce, Trzecie_miejsce, data_kwalifikacji, czas_pp) 
VALUES('2', '1', '5','2019.05.11', '1:15.406');
INSERT INTO Kwalifikacje(pole_position, Drugie_miejsce, Trzecie_miejsce, data_kwalifikacji, czas_pp) 
VALUES('1', '2', '3','2019.05.25', '1:10.166');
INSERT INTO Kwalifikacje(pole_position, Drugie_miejsce, Trzecie_miejsce, data_kwalifikacji, czas_pp) 
VALUES('5', '1', '4','2019.06.08', '1:10.240');
INSERT INTO Kwalifikacje(pole_position, Drugie_miejsce, Trzecie_miejsce, data_kwalifikacji, czas_pp) 
VALUES('1', '2', '4','2019.06.22', '1:28.319');
INSERT INTO Kwalifikacje(pole_position, Drugie_miejsce, Trzecie_miejsce, data_kwalifikacji, czas_pp) 
VALUES('4', '1', '3','2019.06.29', '1:03.003');
INSERT INTO Kwalifikacje(pole_position, Drugie_miejsce, Trzecie_miejsce, data_kwalifikacji, czas_pp) 
VALUES('2', '1', '4','2019.07.13', '1:25.093');
INSERT INTO Kwalifikacje(pole_position, Drugie_miejsce, Trzecie_miejsce, data_kwalifikacji, czas_pp) 
VALUES('1', '3', '2','2019.07.27', '1:11.767');
INSERT INTO Kwalifikacje(pole_position, Drugie_miejsce, Trzecie_miejsce, data_kwalifikacji, czas_pp) 
VALUES('3', '2', '1','2019.08.03', '1:14.572');
INSERT INTO Kwalifikacje(pole_position, Drugie_miejsce, Trzecie_miejsce, data_kwalifikacji, czas_pp) 
VALUES('4', '5', '1','2019.08.31', '1:42.519');
INSERT INTO Kwalifikacje(pole_position, Drugie_miejsce, Trzecie_miejsce, data_kwalifikacji, czas_pp) 
VALUES('4', '2', '1','2019.09.07', '1:19.307');
INSERT INTO Kwalifikacje(pole_position, Drugie_miejsce, Trzecie_miejsce, data_kwalifikacji, czas_pp) 
VALUES('4', '1', '5','2019.09.21', '1:36.217');
INSERT INTO Kwalifikacje(pole_position, Drugie_miejsce, Trzecie_miejsce, data_kwalifikacji, czas_pp) 
VALUES('4', '1', '5','2019.09.28', '1:31.628');
INSERT INTO Kwalifikacje(pole_position, Drugie_miejsce, Trzecie_miejsce, data_kwalifikacji, czas_pp) 
VALUES('5', '4', '2','2019.10.12', '1:27.064');
INSERT INTO Kwalifikacje(pole_position, Drugie_miejsce, Trzecie_miejsce, data_kwalifikacji, czas_pp) 
VALUES('3', '4', '5','2019.10.26', '1:14.758');
INSERT INTO Kwalifikacje(pole_position, Drugie_miejsce, Trzecie_miejsce, data_kwalifikacji, czas_pp) 
VALUES('2', '5', '3','2019.11.02', '1:32.029');
INSERT INTO Kwalifikacje(pole_position, Drugie_miejsce, Trzecie_miejsce, data_kwalifikacji, czas_pp) 
VALUES('3', '5', '1','2019.11.16', '1:07.508');
INSERT INTO Kwalifikacje(pole_position, Drugie_miejsce, Trzecie_miejsce, data_kwalifikacji, czas_pp) 
VALUES('1', '2', '3','2019.11.30', '1:34.779');

INSERT INTO Wyœcigi(nazwa_wyœcigu, tor, zwyciêzca, zwyciêski_zespó³, najszybszy_czas_wyœcigu , data_wyscigu) 
VALUES ('Australian Grand Prix', 'Albert Park Circut', '77', '1', '1:25:27.325', '2019.03.17');
INSERT INTO Wyœcigi(nazwa_wyœcigu, tor, zwyciêzca, zwyciêski_zespó³, najszybszy_czas_wyœcigu, data_wyscigu) 
VALUES ('Bahrain Grand Prix', 'Bahrain International Circuit', '44', '1', '1:34:21.295', '2019.03.31');
INSERT INTO Wyœcigi(nazwa_wyœcigu, tor, zwyciêzca, zwyciêski_zespó³, najszybszy_czas_wyœcigu, data_wyscigu) 
VALUES ('Chinese Grand Prix', 'Shanghai International Circuit', '44', '1', '1:32:06.350', '2019.04.14');
INSERT INTO Wyœcigi(nazwa_wyœcigu, tor, zwyciêzca, zwyciêski_zespó³, najszybszy_czas_wyœcigu, data_wyscigu) 
VALUES ('Azerbijan Grand Prix', 'Baku street circuit', '77', '1', '1:31:52.942', '2019.04.28');
INSERT INTO Wyœcigi(nazwa_wyœcigu, tor, zwyciêzca, zwyciêski_zespó³, najszybszy_czas_wyœcigu, data_wyscigu) 
VALUES ('Spanish Grand Prix', 'Catalunya Circuit', '44', '1', '1:35:50.443', '2019.05.12');
INSERT INTO Wyœcigi(nazwa_wyœcigu, tor, zwyciêzca, zwyciêski_zespó³, najszybszy_czas_wyœcigu, data_wyscigu) 
VALUES ('Monaco Grand Prix', 'Circuit de Monaco', '44', '1', '1:43:28.437', '2019.05.26');
INSERT INTO Wyœcigi(nazwa_wyœcigu, tor, zwyciêzca, zwyciêski_zespó³, najszybszy_czas_wyœcigu, data_wyscigu) 
VALUES ('Canadian Grand Prix', 'Gilles Villeneuve Circuit', '44', '1', '1:29:07.084', '2019.06.09');
INSERT INTO Wyœcigi(nazwa_wyœcigu, tor, zwyciêzca, zwyciêski_zespó³, najszybszy_czas_wyœcigu, data_wyscigu) 
VALUES ('French Grand Prix', 'Circuit Paul Ricard', '44', '1', '1:24:31.198', '2019.06.23');
INSERT INTO Wyœcigi(nazwa_wyœcigu, tor, zwyciêzca, zwyciêski_zespó³, najszybszy_czas_wyœcigu, data_wyscigu) 
VALUES ('Austrian Grand Prix', 'Red Bull Ring', '33', '3', '1:22:01.822', '2019.06.30');
INSERT INTO Wyœcigi(nazwa_wyœcigu, tor, zwyciêzca, zwyciêski_zespó³, najszybszy_czas_wyœcigu, data_wyscigu) 
VALUES ('British Grand Prix', 'Silverstone Circuit', '44', '1', '1:21:08.452', '2019.07.14');
INSERT INTO Wyœcigi(nazwa_wyœcigu, tor, zwyciêzca, zwyciêski_zespó³, najszybszy_czas_wyœcigu, data_wyscigu) 
VALUES ('German Grand Prix', 'Hockenheimring', '33', '3', '1:44:31.275', '2019.07.28');
INSERT INTO Wyœcigi(nazwa_wyœcigu, tor, zwyciêzca, zwyciêski_zespó³, najszybszy_czas_wyœcigu, data_wyscigu) 
VALUES ('Hungarian Grand Prix', 'Hungaroring', '44', '1', '1:35:03.796', '2019.08.04');
INSERT INTO Wyœcigi(nazwa_wyœcigu, tor, zwyciêzca, zwyciêski_zespó³, najszybszy_czas_wyœcigu, data_wyscigu) 
VALUES ('Belgian Grand Prix', 'Circuit de Spa-Francorchamps', '16', '2', '01:23:45.710', '2019.09.01');
INSERT INTO Wyœcigi(nazwa_wyœcigu, tor, zwyciêzca, zwyciêski_zespó³, najszybszy_czas_wyœcigu, data_wyscigu) 
VALUES ('Italian Grand Prix', 'Monza Circuit', '16', '2', '01:15:26.665', '2019.09.08');
INSERT INTO Wyœcigi(nazwa_wyœcigu, tor, zwyciêzca, zwyciêski_zespó³, najszybszy_czas_wyœcigu, data_wyscigu) 
VALUES ('Singapore Grand Prix', 'Marina Bay Street Circuit', '5', '2', '01:58:33.667', '2019.09.22');
INSERT INTO Wyœcigi(nazwa_wyœcigu, tor, zwyciêzca, zwyciêski_zespó³, najszybszy_czas_wyœcigu, data_wyscigu) 
VALUES ('Russian Grand Prix', 'Sochi Autodrom', '44', '1', '01:33:38.992', '2019.09.29');
INSERT INTO Wyœcigi(nazwa_wyœcigu, tor, zwyciêzca, zwyciêski_zespó³, najszybszy_czas_wyœcigu, data_wyscigu) 
VALUES ('Janapesse Grand Prix', 'Suzuka Circuit', '77', '1', '01:21:46.755', '2019.10.13');
INSERT INTO Wyœcigi(nazwa_wyœcigu, tor, zwyciêzca, zwyciêski_zespó³, najszybszy_czas_wyœcigu, data_wyscigu) 
VALUES ('Mexican Grand Prix', 'Autódromo Hermanos Rodríguez', '44', '1', '01:36:48.904', '2019.10.27');
INSERT INTO Wyœcigi(nazwa_wyœcigu, tor, zwyciêzca, zwyciêski_zespó³, najszybszy_czas_wyœcigu, data_wyscigu) 
VALUES ('USA Grand Prix', 'Circuit of The Americas', '77', '1', '01:33:55.653', '2019.11.03');
INSERT INTO Wyœcigi(nazwa_wyœcigu, tor, zwyciêzca, zwyciêski_zespó³, najszybszy_czas_wyœcigu, data_wyscigu) 
VALUES ('Brazilian Grand Prix', 'Interlagos Circuit', '33', '3', '01:33:14.678', '2019.11.17');
INSERT INTO Wyœcigi(nazwa_wyœcigu, tor, zwyciêzca, zwyciêski_zespó³, najszybszy_czas_wyœcigu, data_wyscigu) 
VALUES ('Abu Dhabi Grand Prix', 'Yas Marina Circuit', '44', '1', '01:34:05.715', '2019.12.01');
