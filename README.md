# Disney vs DreamWorks — Database relazionale e analisi comparativa (MySQL)

Progetto personale di progettazione di due database relazionali — uno per i film **Disney**, uno per **DreamWorks** — e analisi comparativa dei loro film: incassi, budget, profitto netto, canzoni e premi Oscar.

**Autrice:** Carol Pagano · **Strumento:** MySQL Workbench

---

## Cosa contiene il progetto

- **Progettazione di due database** con struttura identica, una per studio: 7 tabelle collegate tra loro — `Film`, `Periodo`, `Franchise`, `Personaggio`, `Canzone`, `Performance` e la tabella di collegamento `FilmPersonaggio`.
- **Modello E-R** per entrambi gli studi (uno schema per database).
- **Creazione e popolamento** delle tabelle con dati reali sui film (incassi, budget, Oscar, canzoni).
- **Query di analisi**: classifica dei film per profitto netto (incasso − budget), con il collegamento a era, franchise e canzone principale.

## Tecniche SQL usate

Progettazione di uno schema a più tabelle con chiavi esterne · `JOIN` multipli tra più tabelle · `LEFT JOIN` (per includere i film senza canzone o senza dati finanziari) · campi calcolati (profitto netto) · `ORDER BY`.

## File

| File | Contenuto |
|---|---|
| `DISNEY_DB.sql` | Database Disney completo: struttura, popolamento e query di analisi |
| `DREAMWORKS_DB.sql` | Database DreamWorks completo: struttura, popolamento e query di analisi |
| `Modello ER - DISNEY.png` | Modello entità-relazione Disney |
| `Modello ER - DREAMWORKS.png` | Modello entità-relazione DreamWorks |
| `DISNEY_DREAMWORKS.xlsx` | Dati di partenza e dati esterni usati per popolare i database |

## Come eseguire

In MySQL Workbench, apri ed esegui `DISNEY_DB.sql` e `DREAMWORKS_DB.sql`. Ogni script crea il proprio database, lo popola e include in fondo la query di analisi.
