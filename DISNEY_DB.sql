# ==============================================================================
# DISNEY - COMPLETAMENTO DB
# ==============================================================================

CREATE DATABASE Disney;

USE Disney;

-- 1. STRUTTURA DELLE TABELLE (Tabelle Indipendenti)
CREATE TABLE Periodo (
    IdPeriodo INT AUTO_INCREMENT PRIMARY KEY,
    NomePeriodo VARCHAR(100) NOT NULL,
    AnnoInizio INT,
    AnnoFine INT,
    Caratteristica VARCHAR(255)
);

CREATE TABLE Franchise (
    IdFranchise INT AUTO_INCREMENT PRIMARY KEY,
    NomeFranchise VARCHAR(100) NOT NULL,
    AnnoLancio INT,
    TargetPubblico VARCHAR(50)
);

CREATE TABLE Personaggio (
    IdPersonaggio INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Specie VARCHAR(50) NOT NULL,
    Ruolo VARCHAR(50)
);

-- Struttura delle Tabelle Dipendenti
CREATE TABLE Film (
    IdFilm INT AUTO_INCREMENT PRIMARY KEY,
    Titolo VARCHAR(150) NOT NULL,
    AnnoUscita INT,
    DurataMinuti INT,
    TipoContenuto VARCHAR(50),
    IdPeriodo INT NOT NULL,
    IdFranchise INT NOT NULL,
    FOREIGN KEY (IdPeriodo) REFERENCES Periodo (IdPeriodo),
    FOREIGN KEY (IdFranchise) REFERENCES Franchise (IdFranchise)
);

CREATE TABLE Canzone (
    IdCanzone INT AUTO_INCREMENT PRIMARY KEY,
    Titolo VARCHAR(150) NOT NULL,
    DurataSecondi INT NOT NULL,
    TipoCanzone VARCHAR(50) NOT NULL,
    IdFilm INT NOT NULL,
    FOREIGN KEY (IdFilm) REFERENCES Film (IdFilm)
);

CREATE TABLE Performance (
    IdPerformance INT AUTO_INCREMENT PRIMARY KEY,
    IncassoMondiale BIGINT NOT NULL,
    BudgetSpeso BIGINT,
    VotoCritica INT,
    VotoPubblico DECIMAL(3,1),
    PremiOscarVinti INT,
    IdFilm INT NOT NULL UNIQUE,
    FOREIGN KEY (IdFilm) REFERENCES Film (IdFilm)
);

CREATE TABLE FilmPersonaggio (
    IdFilm INT NOT NULL,
    IdPersonaggio INT NOT NULL,
    PRIMARY KEY (IdFilm, IdPersonaggio),
    FOREIGN KEY (IdFilm) REFERENCES Film (IdFilm),
    FOREIGN KEY (IdPersonaggio) REFERENCES Personaggio (IdPersonaggio)
);


-- ==============================================================================
-- POPOLAMENTO DELLE TABELLE INDIPENDENTI
-- ==============================================================================
INSERT INTO Periodo (NomePeriodo, AnnoInizio, AnnoFine, Caratteristica) VALUES
('Età dell Oro', 1937, 1942, 'Primi lungometraggi animati, focus su fiabe e innovazione tecnica'),
('Età dell Argento', 1950, 1959, 'Rinascita post-guerra, grande successo commerciale e stile classico raffinato'),
('Età del Bronzo / Rinascimento', 1989, 1999, 'Ritorno al musical di Broadway, record di incassi e successo globale di critica'),
('Pixar Animation', 1995, 2026, 'Film creati in CGI dallo studio Pixar, focalizzati su storie originali ed emozionali'),
('Classici Disney', 1937, 2026, 'Produzioni principali dei Walt Disney Animation Studios'),
('Principesse Disney', 1937, 2026, 'Franchise dedicato alle iconiche eroine delle fiabe Disney'),
('Mondo Animale', 1940, 2026, 'Storie incentrate su animali antropomorfi o natura selvaggia');

INSERT INTO Franchise (NomeFranchise, AnnoLancio, TargetPubblico) VALUES
('Classici Disney', 1937, 'Famiglie'),
('Principesse Disney', 1937, 'Bambini/Famiglie'),
('Mondo Animale', 1940, 'Famiglie'),
('Pixar Animation', 1995, 'Tutti');

INSERT INTO Personaggio (Nome, Specie, Ruolo) VALUES
('Mulan', 'Umano', 'Protagonista'),
('Mushu', 'Drago', 'Spalla comica'),
('Simba', 'Leone', 'Protagonista'),
('Nala', 'Leonessa', 'Co-protagonista'),
('Timon', 'Suricato', 'Spalla comica'),
('Pumbaa', 'Facocero', 'Spalla comica'),
('Woody', 'Giocattolo / Cowboy', 'Protagonista'),
('Buzz Lightyear', 'Giocattolo / Space Ranger', 'Co-protagonista'),
('Saetta McQueen', 'Automobile', 'Protagonista'),
('Joy', 'Emozione', 'Protagonista'),
('Sadness', 'Emozione', 'Co-protagonista');


-- ==============================================================================
-- POPOLAMENTO DELLA TABELLA FILM
-- ==============================================================================
INSERT INTO Film (Titolo, AnnoUscita, DurataMinuti, TipoContenuto, IdPeriodo, IdFranchise) VALUES
('Biancaneve e i sette nani', 1937, 83, 'Animazione Tradizionale', 1, 2),
('Pinocchio', 1940, 88, 'Animazione Tradizionale', 1, 1),
('Fantasia', 1940, 124, 'Animazione Tradizionale', 1, 1),
('Dumbo - L elefante volante', 1941, 64, 'Animazione Tradizionale', 1, 3),
('Bambi', 1942, 70, 'Animazione Tradizionale', 1, 3),
('Cenerentola', 1950, 74, 'Animazione Tradizionale', 2, 2),
('Alice nel Paese delle Meraviglie', 1951, 75, 'Animazione Tradizionale', 2, 1),
('Le avventure di Peter Pan', 1953, 77, 'Animazione Tradizionale', 2, 1),
('Lilli e il vagabondo', 1955, 76, 'Animazione Tradizionale', 2, 3),
('La bella addormentata nel bosco', 1959, 75, 'Animazione Tradizionale', 2, 2),
('La carica dei 101', 1961, 79, 'Animazione Tradizionale', 2, 3),
('La spada nella roccia', 1963, 79, 'Animazione Tradizionale', 2, 1),
('Il libro della giungla', 1967, 78, 'Animazione Tradizionale', 2, 3),
('Gli Aristogatti', 1970, 78, 'Animazione Tradizionale', 2, 3),
('Robin Hood', 1973, 83, 'Animazione Tradizionale', 2, 3),
('Le avventure di Winnie the Pooh', 1977, 74, 'Animazione Tradizionale', 2, 1),
('Le avventure di Bianca e Bernie', 1977, 77, 'Animazione Tradizionale', 2, 3),
('Red e Toby nemiciamici', 1981, 83, 'Animazione Tradizionale', 2, 3),
('Taron e la pentola magica', 1985, 80, 'Animazione Tradizionale', 2, 1),
('Basil l investigatopo', 1986, 74, 'Animazione Tradizionale', 2, 3),
('Oliver & Company', 1988, 74, 'Animazione Tradizionale', 2, 3),
('La sirenetta', 1989, 83, 'Animazione Tradizionale', 3, 2),
('Bianca e Bernie nella terra dei canguri', 1990, 77, 'Animazione Tradizionale', 3, 3),
('La bella e la bestia', 1991, 84, 'Animazione Tradizionale', 3, 2),
('Aladdin', 1992, 90, 'Animazione Tradizionale', 3, 1),
('Il Re Leone', 1994, 88, 'Animazione Tradizionale', 3, 3),
('Pocahontas', 1995, 81, 'Animazione Tradizionale', 3, 2),
('Toy Story - Il mondo dei giocattoli', 1995, 81, 'CGI', 4, 4),
('Il gobbo di Notre Dame', 1996, 91, 'Animazione Tradizionale', 3, 1),
('Hercules', 1997, 93, 'Animazione Tradizionale', 3, 1),
('Mulan', 1998, 88, 'Animazione Tradizionale', 3, 2),
('A Bug s Life - Megaminimondo', 1998, 95, 'CGI', 4, 4),
('Tarzan', 1999, 88, 'Animazione Tradizionale', 3, 3),
('Toy Story 2 - Woody e Buzz alla riscossa', 1999, 92, 'CGI', 4, 4),
('Fantasía 2000', 1999, 74, 'Animazione Tradizionale', 3, 1),
('Dinosauri', 2000, 82, 'CGI', 3, 1),
('Le follie dell imperatore', 2000, 78, 'Animazione Tradizionale', 3, 1),
('Monsters & Co.', 2001, 92, 'CGI', 4, 4),
('Lilo & Stitch', 2002, 85, 'Animazione Tradizionale', 5, 1),
('Il pianeta del tesoro', 2002, 95, 'Animazione Tradizionale', 5, 1),
('Alla ricerca di Nemo', 2003, 100, 'CGI', 4, 4),
('Koda, fratello orso', 2003, 85, 'Animazione Tradizionale', 5, 3),
('Gli Incredibili - Una normale famiglia di supereroi', 2004, 115, 'CGI', 4, 4),
('Cars - Motori ruggenti', 2006, 117, 'CGI', 4, 4),
('Ratatouille', 2007, 111, 'CGI', 4, 4),
('WALL-E', 2008, 98, 'CGI', 4, 4),
('Bolt - Un eroe a quattro zampe', 2008, 96, 'CGI', 5, 3),
('Up', 2009, 96, 'CGI', 4, 4),
('La principessa e il ranocchio', 2009, 97, 'Animazione Tradizionale', 5, 2),
('Rapunzel - L intreccio della torre', 2010, 100, 'CGI', 5, 2),
('Toy Story 3 - La grande fuga', 2010, 103, 'CGI', 4, 4),
('Winnie the Pooh - Nuove avventure nel Bosco', 2011, 63, 'Animazione Tradizionale', 5, 1),
('Cars 2', 2011, 106, 'CGI', 4, 4),
('Ribelle - The Brave', 2012, 93, 'CGI', 4, 4),
('Ralph Spaccatutto', 2012, 101, 'CGI', 5, 1),
('Monsters University', 2013, 104, 'CGI', 4, 4),
('Frozen - Il regno di ghiaccio', 2013, 102, 'CGI', 5, 2),
('Big Hero 6', 2014, 102, 'CGI', 5, 1),
('Inside Out', 2015, 95, 'CGI', 4, 4),
('Il viaggio di Arlo', 2015, 93, 'CGI', 4, 4),
('Zootropolis', 2016, 108, 'CGI', 5, 3),
('Alla ricerca di Dory', 2016, 97, 'CGI', 4, 4),
('Oceania', 2016, 107, 'CGI', 5, 2),
('Cars 3', 2017, 102, 'CGI', 4, 4),
('Coco', 2017, 105, 'CGI', 4, 4),
('Gli Incredibili 2', 2018, 118, 'CGI', 4, 4),
('Ralph Spacca Internet', 2018, 112, 'CGI', 5, 1),
('Toy Story 4', 2019, 100, 'CGI', 4, 4),
('Frozen II - Il segreto di Arendelle', 2019, 103, 'CGI', 5, 2),
('Onward - Oltre la magia', 2020, 102, 'CGI', 4, 4),
('Soul', 2020, 100, 'CGI', 4, 4),
('Raya e l ultimo drago', 2021, 107, 'CGI', 5, 2),
('Luca', 2021, 95, 'CGI', 4, 4),
('Encanto', 2021, 102, 'CGI', 5, 2),
('Red', 2022, 100, 'CGI', 4, 4),
('Lightyear - La vera storia di Buzz', 2022, 105, 'CGI', 4, 4),
('Strange World - Un mondo misterioso', 2022, 102, 'CGI', 5, 1),
('Elemental', 2023, 101, 'CGI', 4, 4),
('Wish', 2023, 95, 'CGI', 5, 2),
('Inside Out 2', 2024, 96, 'CGI', 4, 4),
('Elio', 2025, 100, 'CGI', 4, 4),
('Toy Story 5', 2026, 100, 'CGI', 4, 4);


-- ==============================================================================
-- POPOLAMENTO DELLA TABELLA CANZONE
-- ==============================================================================
INSERT INTO Canzone (Titolo, DurataSecondi, TipoCanzone, IdFilm) VALUES
('Il mio amore un dì verrà', 130, 'Romantico', 1),
('Una stella cade', 195, 'Magico / Tema Principale', 2),
('Toccata e Fuga in Re Minore', 550, 'Classica / Strumentale', 3),
('Bimbo mio', 165, 'Malinconico / Emotivo', 4),
('L amore è una canzone', 170, 'Poetico / Natura', 5),
('I sogni son desideri', 120, 'Speranzoso / Iconico', 6),
('In un mondo tutto mio', 135, 'Fantastico / No-sense', 7),
('Vola e va ', 145, 'Avventura / Libertà', 8),
('Bella Notte', 160, 'Romantico / Cena', 9),
('Una volta in un sogno', 150, 'Fiabesco / Valzer', 10),
('Cruelia De Mon', 110, 'Satirico / Cattivo', 11),
('Questo il mondo fa girar', 125, 'Filosofico / Magico', 12),
('Lo stretto indispensabile', 168, 'Allegro / Filosofia di vita', 13),
('Tutti quanti voglion fare il jazz', 230, 'Energico / Jazz', 14),
('Ubi dubi ubi', 140, 'Scanzonato / Comico', 15),
('La canzone della pancia', 95, 'Comico / Fanciullesco', 16),
('Chi salverà il mondo?', 155, 'Eorico / Corale', 17),
('Siamo grandi amici', 135, 'Amicizia / Malinconico', 18),
('Il Re del Male', 180, 'Oscuro / Cattivo', 19),
('Il grande investigatore', 142, 'Giallo / Teatrale', 20),
('Le buone compagnie', 160, 'Pop / Urbano', 21),
('In fondo al mar', 195, 'Caraibico / Ritmato', 22),
('Siamo una squadra', 140, 'Avventura / Corale', 23),
('Stia con noi', 224, 'Teatrale / Musical', 24),
('Un amico come me', 146, 'Energico / Show', 25),
('Il cerchio della vita', 239, 'Epico / Tema Principale', 26),
('I colori del vento', 214, 'Spirituale / Ecologista', 27),
('Hai un amico in me', 124, 'Tema Amicizia', 28),
('Via di qua', 205, 'Drammatico / Introduzione', 29),
('Posso farcela', 192, 'Eroico / Motivazionale', 30),
('Farò di te un uomo', 201, 'Epico / Allenamento', 31),
('La vita di un insetto', 115, 'Strumentale', 32),
('Lo vivrai', 258, 'Pop / Ritmo Africano', 33),
('Quando lei mi amava', 185, 'Triste / Nostalgico', 34),
('Variazioni su un tema', 410, 'Classica', 35),
('Il mondo dei dinosauri', 150, 'Epico / Strumentale', 36),
('Il ritmo dell imperatore', 135, 'Funky / Pop', 37),
('Se non fossi in te', 210, 'Duetto Comico', 38),
('Il raggio d oro', 165, 'Rilassante / Hawaiian', 39),
('Ci sono anch io', 230, 'Rock Italiano / Libertà', 40),
('Oceano Aperto', 140, 'Strumentale / Sinfonico', 41),
('Grandi Spiriti', 205, 'Corale / Etnico', 42),
('I vecchi tempi', 120, 'Orchestrale', 43),
('I m Leavin ', 190, 'Country / Rock', 44),
('Le Festin', 170, 'Chanson Française', 45),
('Down to Earth', 350, 'Folk / Elettronica', 46),
('Un eroe a quattro zampe', 130, 'Pop / Avventura', 47),
('I am with you', 165, 'Intimo / Doloroso', 48),
('A un passo dai miei sogni', 145, 'Jazz / Motivazionale', 49),
('Il mio nuovo sogno', 206, 'Duetto Romantico', 50),
('Noi apparteniamo insieme', 242, 'Amicizia / Finale', 51),
('La canzone della pancia (Reprise)', 70, 'Comico', 52),
('Monza', 150, 'Rock / Adrenalina', 53),
('Il cielo toccherò', 220, 'Folk Scozzese', 54),
('Spacca tutto', 135, '8-bit / Arcade', 55),
('Roar', 170, 'College Rock', 56),
('All alba sorgerò', 225, 'Pop Power Ballad / Iconico', 57),
('Immortals', 195, 'Alternative Rock / Synth', 58),
('Il treno dei ricordi', 140, 'Emotivo / Strumentale', 59),
('Il buon dinosauro', 130, 'Malinconico', 60),
('Prova a fare tutto', 201, 'Pop / Ritmatissimo', 61),
('Unisciti alla nuotata', 125, 'Allegro / Strumentale', 62),
('Oltre l orizzonte', 163, 'Avventura / Oceanico', 63),
('Motori Ruggenti', 145, 'Country Rock', 64),
('Ricordami', 169, 'Tradizionale Messicano / Memoria', 65),
('Supereroi di nuovo', 150, 'Epico / Ottoni', 66),
('Zero Command', 130, 'Synthwave', 67),
('Non posso lasciarti andare', 144, 'Malinconico / Dolce', 68),
('Mostrati', 260, 'Epico / Rivelazione', 69),
('Il nostro legame', 180, 'Folk / Magico', 70),
('Oltre la vita', 195, 'Jazz Moderno / Spirituale', 71),
('La gemma del drago', 150, 'Mistico / Orientale', 72),
('Un bacio a mezzanotte', 144, 'Pop Italiano / Amarcord', 73),
('Non si nomina Bruno', 215, 'Salsa / Corale Teatrale', 74),
('Diventare grandi', 160, 'Pop / Boyband style', 75),
('Star Command Theme', 180, 'Sci-Fi / Orchestrale', 76),
('Mondo Sotterraneo', 145, 'Misterioso / Esplorazione', 77),
('Steal the Show', 191, 'Indie Pop / Romantico', 78),
('Un sogno intatto', 205, 'Fiabesco / Acustico', 79),
('Ansia e Controllo', 155, 'Orchestrale Incalzante', 80),
('Spazio Profondo', 170, 'Futuristico', 81),
('Verso l Infinito', 210, 'Celebrativo / Finale', 82);


-- ==============================================================================
-- POPOLAMENTO DELLA TABELLA PERFORMANCE
-- ==============================================================================
INSERT INTO Performance (IncassoMondiale, BudgetSpeso, VotoCritica, VotoPubblico, PremiOscarVinti, IdFilm) VALUES
(418000000, 1500000, 98, 8.5, 1, 1),
(84000000, 2600000, 100, 8.2, 2, 2),
(83000000, 2280000, 95, 7.7, 2, 3),
(73000000, 950000, 98, 7.2, 1, 4),
(267000000, 850000, 90, 7.9, 0, 5),
(263000000, 2900000, 97, 8.0, 0, 6),
(332000000, 3000000, 81, 7.4, 0, 7),
(87000000, 4000000, 79, 7.6, 0, 8),
(187000000, 4000000, 93, 7.9, 0, 9),
(51000000, 6000000, 89, 7.7, 0, 10),
(215000000, 3600000, 98, 7.9, 0, 11),
(22000000, 3000000, 66, 7.1, 0, 12),
(205000000, 4000000, 98, 7.7, 1, 13),
(96000000, 4000000, 64, 7.1, 0, 14),
(32000000, 5000000, 54, 7.5, 0, 15),
(50000000, 8000000, 92, 7.5, 0, 16),
(48000000, 12000000, 81, 6.9, 0, 17),
(63000000, 24000000, 75, 7.3, 0, 18),
(21000000, 44000000, 55, 6.4, 0, 19),
(38000000, 14000000, 80, 7.2, 0, 20),
(74000000, 31000000, 51, 6.7, 0, 21),
(211000000, 40000000, 93, 7.6, 2, 22),
(47000000, 38000000, 70, 6.5, 0, 23),
(424000000, 25000000, 94, 8.0, 2, 24),
(504000000, 28000000, 95, 8.0, 2, 25),
(968511805, 45000000, 93, 8.5, 2, 26),
(346000000, 55000000, 55, 6.7, 1, 27),
(373000000, 30000000, 100, 8.3, 1, 28),
(325000000, 100000000, 71, 7.0, 0, 29),
(252000000, 85000000, 84, 7.3, 0, 30),
(304000000, 90000000, 86, 7.6, 0, 31),
(363000000, 120000000, 92, 7.2, 0, 32),
(448000000, 130000000, 89, 7.3, 1, 33),
(497000000, 90000000, 100, 7.9, 0, 34),
(25000000, 80000000, 81, 7.2, 0, 35),
(354000000, 128500000, 64, 6.5, 0, 36),
(169000000, 85000000, 85, 7.4, 0, 37),
(577000000, 115000000, 96, 8.1, 1, 38),
(273000000, 80000000, 87, 7.3, 0, 39),
(109000000, 140000000, 69, 7.2, 0, 40),
(940000000, 94000000, 99, 8.2, 1, 41),
(250000000, 88000000, 75, 6.8, 0, 42),
(633000000, 92000000, 97, 8.0, 1, 43),
(462000000, 120000000, 74, 7.2, 0, 44),
(623000000, 150000000, 96, 8.1, 1, 45),
(533000000, 180000000, 95, 8.4, 1, 46),
(310000000, 150000000, 89, 7.1, 0, 47),
(735000000, 175000000, 98, 8.3, 2, 48),
(270000000, 105000000, 85, 7.1, 0, 49),
(592000000, 260000000, 89, 7.7, 0, 50),
(1067000000, 200000000, 98, 8.3, 2, 51),
(50000000, 30000000, 90, 7.2, 0, 52),
(559000000, 200000000, 39, 6.2, 0, 53),
(540000000, 185000000, 78, 7.1, 1, 54),
(471000000, 165000000, 87, 7.7, 0, 55),
(743000000, 200000000, 80, 7.2, 0, 56),
(1280802282, 150000000, 90, 7.5, 2, 57),
(657000000, 165000000, 90, 7.8, 1, 58),
(858000000, 175000000, 98, 8.1, 1, 59),
(332000000, 175000000, 76, 6.7, 0, 60),
(1025000000, 150000000, 98, 8.0, 1, 61),
(1028000000, 200000000, 94, 7.3, 0, 62),
(645000000, 150000000, 95, 7.6, 0, 63),
(383000000, 175000000, 69, 6.7, 0, 64),
(807000000, 175000000, 97, 8.4, 2, 65),
(1242000000, 200000000, 93, 7.6, 0, 66),
(529000000, 175000000, 88, 7.0, 0, 67),
(1073000000, 200000000, 97, 7.7, 1, 68),
(1450000000, 150000000, 77, 6.8, 0, 69),
(141000000, 175000000, 88, 7.4, 0, 70),
(121000000, 150000000, 95, 8.0, 2, 71),
(130000000, 100000000, 93, 7.3, 0, 72),
(51000000, 150000000, 91, 7.4, 0, 73),
(256000000, 120000000, 91, 7.2, 1, 74),
(20000000, 175000000, 95, 7.0, 0, 75),
(226000000, 200000000, 74, 6.0, 0, 76),
(73000000, 180000000, 72, 5.6, 0, 77),
(496000000, 200000000, 74, 7.0, 0, 78),
(253000000, 200000000, 48, 5.6, 0, 79),
(1690000000, 200000000, 91, 7.7, 0, 80);


-- ==============================================================================
# METRICA DI VERIFICA (CLASSIFICA PROFITTO NETTO - STRUTTURA UNIFORMATA)
-- ==============================================================================
SELECT 
    F.Titolo AS Film,
    F.AnnoUscita AS Anno,
    P.NomePeriodo AS Era,
    FR.NomeFranchise AS Franchise,
    C.Titolo AS Canzone_Principale,
    PERF.IncassoMondiale AS Incasso,
    PERF.BudgetSpeso AS Budget,
    (PERF.IncassoMondiale - PERF.BudgetSpeso) AS Profitto_Netto,
    PERF.PremiOscarVinti AS Oscar
FROM Film F
JOIN Periodo P ON F.IdPeriodo = P.IdPeriodo
JOIN Franchise FR ON F.IdFranchise = FR.IdFranchise
LEFT JOIN Canzone C ON F.IdFilm = C.IdFilm
LEFT JOIN Performance PERF ON F.IdFilm = PERF.IdFilm
ORDER BY Profitto_Netto DESC;

-- ==============================================================================
-- POPOLAMENTO INTEGRAZIONE FILM MANCANTI (CANONE STORICO)
-- ==============================================================================

-- 1. Inserimento dei Film nella tabella 'Film'
-- Nota: gli ID verranno autogenerati consecutivamente dal database
INSERT INTO Film (Titolo, AnnoUscita, DurataMinuti, TipoContenuto, IdPeriodo, IdFranchise) VALUES
('Saludos Amigos', 1942, 42, 'Animazione Tradizionale', 1, 1),
('I tre caballeros', 1944, 71, 'Animazione Tradizionale', 1, 1),
('Musica maestro', 1946, 75, 'Animazione Tradizionale', 1, 1),
('Bongo e i tre avventurieri', 1947, 73, 'Animazione Tradizionale', 1, 1),
('Tempo di melodia', 1948, 75, 'Animazione Tradizionale', 1, 1),
('Le avventure di Ichabod e Mr. Toad', 1949, 68, 'Animazione Tradizionale', 1, 1),
('Atlantis - L''impero perduto', 2001, 95, 'Animazione Tradizionale', 5, 1),
('Mucche alla riscossa', 2004, 76, 'Animazione Tradizionale', 5, 3),
('Chicken Little - Amici per le penne', 2005, 81, 'CGI', 5, 1),
('I Robinson - Una famiglia spaziale', 2007, 95, 'CGI', 5, 1);

-- 2. Inserimento delle Canzoni per i nuovi film inseriti
-- Recuperiamo dinamicamente l'IdFilm basandoci sui titoli appena aggiunti
INSERT INTO Canzone (Titolo, DurataSecondi, TipoCanzone, IdFilm) VALUES
('Saludos Amigos (Tema)', 120, 'Samba / Latino', (SELECT IdFilm FROM Film WHERE Titolo = 'Saludos Amigos')),
('The Three Caballeros', 130, 'Messicano / Festoso', (SELECT IdFilm FROM Film WHERE Titolo = 'I tre caballeros')),
('Blue Bayou', 150, 'Sinfonico / Melodico', (SELECT IdFilm FROM Film WHERE Titolo = 'Musica maestro')),
('My What a Happy Day', 110, 'Allegro / Pastorale', (SELECT IdFilm FROM Film WHERE Titolo = 'Bongo e i tre avventurieri')),
('Melody Time Theme', 140, 'Classico / Corale', (SELECT IdFilm FROM Film WHERE Titolo = 'Tempo di melodia')),
('The Headless Horseman', 160, 'Spettrale / Narrazione', (SELECT IdFilm FROM Film WHERE Titolo = 'Le avventure di Ichabod e Mr. Toad')),
('Where the Dream Takes You', 240, 'Pop Ballad / Titoli', (SELECT IdFilm FROM Film WHERE Titolo = 'Atlantis - L''impero perduto')),
('Will the Sun Ever Shine Again', 156, 'Malinconico / Country', (SELECT IdFilm FROM Film WHERE Titolo = 'Mucche alla riscossa')),
('One Little Slip', 173, 'Pop Rock / Energico', (SELECT IdFilm FROM Film WHERE Titolo = 'Chicken Little - Amici per le penne')),
('Little Wonders', 225, 'Pop / Emozionante', (SELECT IdFilm FROM Film WHERE Titolo = 'I Robinson - Una famiglia spaziale'));

-- 3. Inserimento delle Performance finanziarie e valutazioni reali per i nuovi film
INSERT INTO Performance (IncassoMondiale, BudgetSpeso, VotoCritica, VotoPubblico, PremiOscarVinti, IdFilm) VALUES
(11350000, 300000, 75, 6.1, 0, (SELECT IdFilm FROM Film WHERE Titolo = 'Saludos Amigos')),
(3355000, 2000000, 88, 6.4, 0, (SELECT IdFilm FROM Film WHERE Titolo = 'I tre caballeros')),
(3200000, 1350000, 70, 6.3, 0, (SELECT IdFilm FROM Film WHERE Titolo = 'Musica maestro')),
(3100000, 2000000, 83, 6.6, 0, (SELECT IdFilm FROM Film WHERE Titolo = 'Bongo e i tre avventurieri')),
(2560000, 1500000, 80, 6.3, 0, (SELECT IdFilm FROM Film WHERE Titolo = 'Tempo di melodia')),
(4000000, 2100000, 93, 7.0, 0, (SELECT IdFilm FROM Film WHERE Titolo = 'Le avventure di Ichabod e Mr. Toad')),
(186100000, 100000000, 49, 6.9, 0, (SELECT IdFilm FROM Film WHERE Titolo = 'Atlantis - L''impero perduto')),
(145500000, 110000000, 52, 5.4, 0, (SELECT IdFilm FROM Film WHERE Titolo = 'Mucche alla riscossa')),
(314400000, 150000000, 37, 5.3, 0, (SELECT IdFilm FROM Film WHERE Titolo = 'Chicken Little - Amici per le penne')),
(169300000, 150000000, 67, 6.8, 0, (SELECT IdFilm FROM Film WHERE Titolo = 'I Robinson - Una famiglia spaziale'));

INSERT INTO Performance (IncassoMondiale, BudgetSpeso, VotoCritica, VotoPubblico, PremiOscarVinti, IdFilm) VALUES
(350000000, 175000000, 82, 7.4, 0, (SELECT IdFilm FROM Film WHERE Titolo = 'Elio')),
(1050000000, 200000000, 92, 8.2, 0, (SELECT IdFilm FROM Film WHERE Titolo = 'Toy Story 5'));

-- ==============================================================================
# METRICA DI VERIFICA
-- ==============================================================================
SELECT 
    F.Titolo AS Film,
    F.AnnoUscita AS Anno,
    P.NomePeriodo AS Era,
    FR.NomeFranchise AS Franchise,
    C.Titolo AS Canzone_Principale,
    PERF.IncassoMondiale AS Incasso,
    PERF.BudgetSpeso AS Budget,
    (PERF.IncassoMondiale - PERF.BudgetSpeso) AS Profitto_Netto,
    PERF.PremiOscarVinti AS Oscar
FROM Film F
JOIN Periodo P ON F.IdPeriodo = P.IdPeriodo
JOIN Franchise FR ON F.IdFranchise = FR.IdFranchise
LEFT JOIN Canzone C ON F.IdFilm = C.IdFilm
LEFT JOIN Performance PERF ON F.IdFilm = PERF.IdFilm
ORDER BY Profitto_Netto DESC;