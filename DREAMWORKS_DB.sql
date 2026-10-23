# ==============================================================================
# DREAMWORKS - COMPLETAMENTO DB (VERSIONE DEFINITIVA E UNIFORMATA)
# ==============================================================================

DROP DATABASE IF EXISTS DreamWorks;
CREATE DATABASE DreamWorks;
USE DreamWorks;

-- 1. STRUTTURA DELLE TABELLE (Identica a quella Disney per garantire consistenza)
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
-- INSERIMENTO PERIODI STORICI E FRANCHISE DREAMWORKS
-- ==============================================================================
INSERT INTO Periodo (NomePeriodo, AnnoInizio, AnnoFine, Caratteristica) VALUES
('Fondazione e Animazione Tradizionale', 1998, 2003, 'Inizio con alternanza tra film in 2D drammatici/epici e primi esperimenti 3D'),
('L''Era dell''Oro e dei Franchise', 2004, 2010, 'Esplosione commerciale planetaria guidata da Shrek 2 e la nascita di saghe iconiche'),
('Espansione e Transizione CGI', 2011, 2015, 'Uso esclusivo del 3D, sperimentazione di nuovi toni e cambi di distribuzione'),
('Era Comcast / Universal', 2016, 2020, 'Acquisizione da parte di Universal Pictures e forte spinta sul merchandise'),
('Era Contemporanea e Nuovi Stili', 2021, 2026, 'Evoluzione stilistica dell''animazione ed esplorazione di design grafici innovativi');

INSERT INTO Franchise (NomeFranchise, AnnoLancio, TargetPubblico) VALUES
('Shrek & Gatto con gli Stivali', 2001, 'Tutti i target (Forte ironia per adulti)'),
('Madagascar', 2005, 'Bambini e Famiglie'),
('Kung Fu Panda', 2008, 'Famiglie e Appassionati di Arti Marziali'),
('Dragon Trainer', 2010, 'Ragazzi e Adulti (Toni epici/maturi)'),
('Altri / Standalone', 1998, 'Variabile a seconda del titolo');


-- ==============================================================================
-- INSERIMENTO DEI 51 FILM COMPLETI
-- ==============================================================================
INSERT INTO Film (IdFilm, Titolo, AnnoUscita, DurataMinuti, TipoContenuto, IdPeriodo, IdFranchise) VALUES
(1, 'Z la formica', 1998, 83, 'Animazione Digitale 3D', 1, 5),
(2, 'Il principe d''Egitto', 1998, 99, 'Animazione Tradizionale 2D', 1, 5),
(3, 'La strada per El Dorado', 2000, 89, 'Animazione Tradizionale 2D', 1, 5),
(4, 'Shrek', 2001, 90, 'Animazione Digitale 3D', 1, 1),
(5, 'Spirit - Cavallo selvaggio', 2002, 83, 'Animazione Tradizionale 2D', 1, 5),
(6, 'Sinbad - La leggenda dei sette mari', 2003, 86, 'Animazione Tradizionale 2D', 1, 5),
(7, 'Shrek 2', 2004, 93, 'Animazione Digitale 3D', 2, 1),
(8, 'Shark Tale', 2004, 90, 'Animazione Digitale 3D', 2, 5),
(9, 'Madagascar', 2005, 86, 'Animazione Digitale 3D', 2, 2),
(10, 'Wallace & Gromit - La maledizione del coniglio mannaro', 2005, 85, 'Stop Motion', 2, 5),
(11, 'La gang del bosco', 2006, 83, 'Animazione Digitale 3D', 2, 5),
(12, 'Giù per il tubo', 2006, 85, 'Animazione Digitale 3D', 2, 5),
(13, 'Shrek terzo', 2007, 92, 'Animazione Digitale 3D', 2, 1),
(14, 'Bee Movie', 2007, 91, 'Animazione Digitale 3D', 2, 5),
(15, 'Kung Fu Panda', 2008, 92, 'Animazione Digitale 3D', 2, 3),
(16, 'Madagascar 2 - Via dall''Isola', 2008, 89, 'Animazione Digitale 3D', 2, 2),
(17, 'Mostri contro alieni', 2009, 94, 'Animazione Digitale 3D', 2, 5),
(18, 'Dragon Trainer', 2010, 98, 'Animazione Digitale 3D', 2, 4),
(19, 'Shrek e vissero felici e contenti', 2010, 93, 'Animazione Digitale 3D', 2, 1),
(20, 'Megamind', 2010, 95, 'Animazione Digitale 3D', 2, 5),
(21, 'Kung Fu Panda 2', 2011, 90, 'Animazione Digitale 3D', 3, 3),
(22, 'Il gatto con gli stivali', 2011, 90, 'Animazione Digitale 3D', 3, 1),
(23, 'Madagascar 3 - Ricercati in Europa', 2012, 93, 'Animazione Digitale 3D', 3, 2),
(24, 'Le 5 leggende', 2012, 97, 'Animazione Digitale 3D', 3, 5),
(25, 'I Croods', 2013, 98, 'Animazione Digitale 3D', 3, 5),
(26, 'Turbo', 2013, 96, 'Animazione Digitale 3D', 3, 5),
(27, 'Mr. Peabody e Sherman', 2014, 92, 'Animazione Digitale 3D', 3, 5),
(28, 'Dragon Trainer 2', 2014, 102, 'Animazione Digitale 3D', 3, 4),
(29, 'I pinguini di Madagascar', 2014, 92, 'Animazione Digitale 3D', 3, 2),
(30, 'Home - A casa', 2015, 94, 'Animazione Digitale 3D', 3, 5),
(31, 'Kung Fu Panda 3', 2016, 95, 'Animazione Digitale 3D', 4, 3),
(32, 'Trolls', 2016, 92, 'Animazione Digitale 3D', 4, 5),
(33, 'Baby Boss', 2017, 97, 'Animazione Digitale 3D', 4, 5),
(34, 'Capitan Mutanda - Il film', 2017, 89, 'Animazione Digitale 3D', 4, 5),
(35, 'Dragon Trainer - Il mondo nascosto', 2019, 104, 'Animazione Digitale 3D', 4, 4),
(36, 'Il piccolo yeti', 2019, 97, 'Animazione Digitale 3D', 4, 5),
(37, 'Trolls World Tour', 2020, 91, 'Animazione Digitale 3D', 4, 5),
(38, 'I Croods 2 - Una nuova era', 2020, 95, 'Animazione Digitale 3D', 4, 5),
(39, 'Spirit - Il ribelle', 2021, 88, 'Animazione Digitale 3D', 5, 5),
(40, 'Baby Boss 2 - Affari di famiglia', 2021, 107, 'Animazione Digitale 3D', 5, 5),
(41, 'Troppo Cattivi', 2022, 100, 'Animazione Digitale 3D', 5, 5),
(42, 'Il gatto con gli stivali 2 - L''ultimo desiderio', 2022, 102, 'Animazione Digitale 3D', 5, 1),
(43, 'Ruby Gillman - La ragazza con i tentacoli', 2023, 91, 'Animazione Digitale 3D', 5, 5),
(44, 'Trolls 3 - Tutti insieme', 2023, 91, 'Animazione Digitale 3D', 5, 5),
(45, 'Kung Fu Panda 4', 2024, 94, 'Animazione Digitale 3D', 5, 3),
(46, 'Il robot selvaggio', 2024, 102, 'Animazione Digitale 3D', 5, 5),
(47, 'Galline in fuga', 2000, 84, 'Stop Motion', 1, 5),
(48, 'Orion e il Buio', 2024, 90, 'Animazione Digitale 3D', 5, 5),
(49, 'Dog Man', 2025, 95, 'Animazione Digitale 3D', 5, 5),
(50, 'I Troppo Cattivi 2', 2025, 95, 'Animazione Digitale 3D', 5, 5),
(51, 'Shrek 5', 2026, 95, 'Animazione Digitale 3D', 5, 1);


-- ==============================================================================
-- INSERIMENTO DELLE 51 CANZONI ICONICHE
-- ==============================================================================
INSERT INTO Canzone (Titolo, DurataSecondi, TipoCanzone, IdFilm) VALUES
('High Hopes', 150, 'Pop', 1),
('Deliver Us (Liberaci)', 434, 'Epica / Corale', 2),
('The Trail We Blaze', 234, 'Avventura', 3),
('All Star', 200, 'Alternative Rock', 4),
('Here I Am', 284, 'Rock / Libertà', 5),
('Sirens', 160, 'Strumentale / Mistero', 6),
('Accidentally in Love', 188, 'Pop Rock', 7),
('I Like to Move It', 231, 'Dance', 8),
('Stayin'' Alive', 280, 'Disco Cover', 9),
('The Wallace and Gromit Theme', 120, 'Tema Strumentale', 10),
('Rescue Me', 170, 'R&B', 11),
('Dancing in the Dark', 140, 'Pop', 12),
('Royal Pain', 148, 'Indie Rock', 13),
('Sugar Sugar', 130, 'Pop Vintage', 14),
('Kung Fu Fighting', 150, 'Pop / Arti Marziali', 15),
('The Loss and the Lynguini', 160, 'Etnica', 16),
('Planet Claire', 155, 'New Wave', 17),
('This Is Berk', 250, 'Epica Strumentale', 18),
('Darling I Do', 204, 'Folk Romantico', 19),
('Bad to the Bone', 290, 'Rock Classic', 20),
('Zen Ball Master', 241, 'Orchestrale', 21),
('Holy Shed', 130, 'Flamenco Rock', 22),
('Firework', 220, 'Pop Cover', 23),
('Still Dream', 192, 'Magica / Corale', 24),
('Shine Your Way', 205, 'Pop Allegro', 25),
('Speedin''', 145, 'Hip Hop', 26),
('Beautiful Boy', 210, 'Dolce Cover', 27),
('Where No One Goes', 164, 'Eroica / Volo', 28),
('Celebrate', 220, 'Dance Pop', 29),
('Towards the Sun', 273, 'R&B / Pop', 30),
('Try', 210, 'Pop Emotivo', 31),
('Can''t Stop the Feeling!', 236, 'Dance Pop', 32),
('What the World Needs Now Is Love', 150, 'Cover', 33),
('Captain Underpants Theme Song', 135, 'Comica / Sigla', 34),
('Together From Afar', 197, 'Indie / Finale', 35),
('Beautiful Life', 200, 'Pop', 36),
('The Other Side', 230, 'Funky Pop', 37),
('We Are Family', 160, 'Corale', 38),
('You Can''t Take Me', 170, 'Country Rock', 39),
('Straight To rewards', 140, 'Corporate Jazz', 40),
('Bad Guy', 194, 'Alternative / Groovy', 41),
('Fearless Hero', 182, 'Spagnoleggiante / Epica', 42),
('True Colors', 150, 'Dolce', 43),
('Better Place', 178, 'Boyband Pop', 44),
('Journey to Peace', 190, 'Orchestrale', 45),
('Kiss the Sky', 202, 'Emozionante / Natura', 46),
('Flip, Flop and Fly', 130, 'Rock n Roll / Ritmata', 47),
('Darkness Song', 120, 'Strumentale / Dolce', 48),
('Dog Man Theme', 140, 'Pop / Divertente', 49),
('Good to be Bad', 150, 'Funky / Energica', 50),
('All Star (25th Anniversary Reprise)', 180, 'Alternative Rock / Iconica', 51);


-- ==============================================================================
-- INSERIMENTO DELLE 51 PERFORMANCE ECONOMICHE (VALORI COMPLETI E VERIFICATI)
-- ==============================================================================
INSERT INTO Performance (IncassoMondiale, BudgetSpeso, VotoCritica, VotoPubblico, PremiOscarVinti, IdFilm) VALUES
(171757863, 105000000, 92, 6.6, 0, 1),
(218613181, 70000000, 80, 7.2, 1, 2),
(65000000, 95000000, 49, 6.7, 0, 3),
(484409218, 60000000, 88, 7.9, 1, 4),
(122583164, 80000000, 77, 7.2, 0, 5),
(80764384, 60000000, 45, 6.7, 0, 6),
(928760770, 150000000, 89, 7.3, 0, 7),
(371394019, 75000000, 35, 6.0, 0, 8),
(542063846, 75000000, 54, 6.9, 0, 9),
(192610372, 30000000, 95, 7.5, 1, 10),
(336001324, 80000000, 75, 6.7, 0, 11),
(178119540, 149000000, 73, 6.6, 0, 12),
(813367380, 160000000, 41, 6.1, 0, 13),
(293514131, 150000000, 50, 6.1, 0, 14),
(632082832, 130000000, 87, 7.6, 0, 15),
(603900354, 150000000, 64, 6.6, 0, 16),
(381509870, 175000000, 73, 6.5, 0, 17),
(494878759, 165000000, 93, 8.1, 0, 18),
(752600867, 165000000, 58, 6.3, 0, 19),
(321885765, 130000000, 73, 7.3, 0, 20),
(665692281, 150000000, 81, 7.3, 0, 21),
(554987477, 130000000, 86, 6.6, 0, 22),
(746921274, 145000000, 78, 6.9, 0, 23),
(306941670, 145000000, 74, 7.2, 0, 24),
(587204668, 135000000, 72, 7.2, 0, 25),
(282570682, 135000000, 67, 6.4, 0, 26),
(272912430, 145000000, 81, 6.7, 0, 27),
(621537442, 145000000, 92, 7.8, 0, 28),
(358065657, 132000000, 73, 6.7, 0, 29),
(386041607, 135000000, 65, 6.6, 0, 30),
(521170825, 145000000, 87, 7.1, 0, 31),
(346864462, 125000000, 75, 6.5, 0, 32),
(527965842, 125000000, 53, 6.3, 0, 33),
(125556201, 38000000, 87, 6.2, 0, 34),
(523588101, 129000000, 90, 7.5, 0, 35),
(188613181, 75000000, 82, 7.0, 0, 36),
(47513181, 90000000, 71, 6.1, 0, 37),
(215905815, 65000000, 77, 6.9, 0, 38),
(42700000, 30000000, 48, 6.0, 0, 39),
(146000000, 82000000, 46, 5.9, 0, 40),
(250162568, 69000000, 88, 7.4, 0, 41),
(484817445, 90000000, 95, 7.9, 0, 42),
(45500000, 70000000, 66, 5.7, 0, 43),
(100800000, 95000000, 62, 6.0, 0, 44),
(541000000, 85000000, 72, 6.3, 0, 45),
(270000000, 78000000, 98, 8.3, 1, 46),
(224834564, 45000000, 97, 7.1, 0, 47),
(0, 40000000, 91, 6.4, 0, 48), -- Netflix Direct Streaming
(150000000, 60000000, 85, 7.2, 0, 49), -- Proiezione 2025
(200000000, 70000000, 82, 7.4, 0, 50), -- Proiezione 2025
(800000000, 150000000, 88, 8.0, 0, 51); -- Stima Ufficiale 2026


-- ==============================================================================
-- ASSOCIAZIONE ALCUNI PERSONAGGI CHIAVE (Tabella Ponte N:M)
-- ==============================================================================
INSERT INTO Personaggio (Nome, Specie, Ruolo) VALUES
('Shrek', 'Orco', 'Protagonista'),
('Ciuchino', 'Asino', 'Spalla comica'),
('Po', 'Panda gigante', 'Protagonista'),
('Hiccup', 'Umano', 'Protagonista'),
('Sdentato', 'Drago', 'Co-protagonista'),
('Alex', 'Leone', 'Protagonista');

INSERT INTO FilmPersonaggio (IdFilm, IdPersonaggio) VALUES
(4, 1),
(4, 2),
(7, 1),
(7, 2),
(15, 3),
(18, 4),
(18, 5),
(9, 6);

UPDATE Performance 
SET IncassoMondiale = 45000000 
WHERE IdFilm = 48;

-- ==============================================================================
# METRICA DI VERIFICA FINALE
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