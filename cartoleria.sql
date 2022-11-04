-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Creato il: Nov 04, 2022 alle 09:03
-- Versione del server: 5.7.34
-- Versione PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cartoleria`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `categorie_prodotti`
--

CREATE TABLE `categorie_prodotti` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `categorie_prodotti`
--

INSERT INTO `categorie_prodotti` (`id`, `descrizione`) VALUES
(1, 'Cancelleria'),
(2, 'Carta'),
(3, 'Zaini e borse'),
(4, 'Belle arti'),
(5, 'Stilografiche'),
(6, 'Informatica');

-- --------------------------------------------------------

--
-- Struttura della tabella `ordini`
--

CREATE TABLE `ordini` (
  `id` int(11) NOT NULL,
  `id_utente` int(11) DEFAULT NULL,
  `totale_ordine` double NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti`
--

CREATE TABLE `prodotti` (
  `id` int(11) NOT NULL,
  `nome_prodotto` varchar(50) NOT NULL,
  `descrizione` text NOT NULL,
  `quantita` int(11) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `prezzo_di_vendita` double NOT NULL,
  `codice_prodotto` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `prodotti`
--

INSERT INTO `prodotti` (`id`, `nome_prodotto`, `descrizione`, `quantita`, `id_categoria`, `prezzo_di_vendita`, `codice_prodotto`) VALUES
(1, 'Penna a sfera', 'La penna a sfera, o anche biro dal nome del suo inventore László Bíró, è uno strumento per scrivere su carta che rilascia inchiostro da un serbatoio interno attraverso l\'azione di rotolamento di una sfera metallica a contatto con la carta.', 100, 1, 2.5, '837360'),
(2, 'Matita', 'Una matita (o lapis) è uno strumento per disegnare e per scrivere. La matita comune è solitamente un bastoncino di legno con un\'anima in grafite; esiste anche il cosiddetto portamine o matita a mine in cui si inseriscono mine di materiale colorato che si differenziano per grandezza (0,5 mm, 0,7 mm ecc.).', 200, 1, 1.99, '018272'),
(3, 'Gomma per cancellare', 'La gomma per cancellare è uno strumento di cancelleria in gomma, naturale o sintetica, atto a rimuovere meccanicamente inchiostri o tracce di grafite da supporti di scrittura o disegno. Si divide in più tipi, dipendentemente dal tipo di tratto da rimuovere.', 50, 1, 1.2, '018221'),
(4, 'Temperamatite', 'Il temperamatite, anche detto temperino, è un oggetto di cancelleria molto comune, realizzato in acciaio, ferro, plastica o altri materiali. La sua funzione è appuntire le matite, affinché queste possano scrivere.', 35, 1, 3, '143589'),
(5, 'Portamine', 'I portamine sono frequentemente utilizzati perché sono affidabili, cancellabili, ricaricabili, a basso costo e, inoltre, un prodotto molto sostenibile. I portamine possono essere usati per disegnare, schizzare o scrivere note veloci. Molti illustratori usano i portamine per disegnare gli schizzi prima di finire l\'opera con l\'inchiostro di china. Nel vasto assortimento di portamine si trovano anche modelli con i quali è facile scrivere come con quelli standard.', 20, 1, 3.5, '294416'),
(6, 'Nastro adesivo', 'Il nastro adesivo (a volte impropriamente chiamato Scotch) è un nastro di plastica o carta a cui è applicata una sostanza adesiva. Il nastro può essere adesivo da un solo lato o da entrambi (nastro biadesivo), nel secondo caso una delle due facce del nastro è spesso protetta da una pellicola.\r\n\r\nÈ utilizzato per incollare oggetti fra loro per lo più temporaneamente, ma anche permanentemente. L\'adesione avviene per semplice contatto con l\'oggetto.\r\n\r\nI più diffusi sono preparati con adesivi sensibili alla pressione e sono autoadesivi. Esistono anche nastri adesivi termoattivabili (che prima dell\'applicazione devono essere attivati con il calore) e nastri adesivi attivabili ad acqua (che devono essere bagnati con acqua).', 58, 1, 1.5, '199986'),
(7, 'Colla stick', 'La colla (a) stick o colla a bastoncino è un tipo di colla venduta in bastoncini a scatto o a vite. L\'utilizzatore può applicare la colla aprendo il bastoncino e tenendolo fermo con una mano, così da non sporcarsi le dita. Questo tipo di colla è utilizzato principalmente in ambito domestico, scolastico e in ufficio. La colla stick più famosa è la Pritt della Henkel ma esistono anche altri marchi in commercio, come UHU e Giotto. n commercio colle stick di varie dimensioni, le più diffuse sono di 10, 20 o 40 grammi.La Giotto produce circa 1540 tubetti di colla, la pritt 3045 e la UHU 1230. Nel 2013 la Giotto ha prodotto circa 3461 tubetti di colla e ha inventato la colla piccola da 10 grammi.', 40, 1, 2, '198936'),
(8, 'Post it', 'Un foglietto Post-it® potrebbe essere utile per fare riferimento alle annotazioni di una determinata giornata. I Foglietti Post-it® sono straordinari perché consentono di appuntarsi le idee a cui fare riferimento in seguito.', 260, 1, 5, '864379'),
(9, 'Forbici', 'Le forbici sono uno strumento molto utilizzato per tagliare materiali sottili che richiedono poca forza, quali carta, cartone, tessuti, corde, cavi, alimenti, fogli sottili di metallo e plastica, fili, capelli, unghie.', 63, 1, 3.2, '346765'),
(10, 'Calcolatrice', 'Una calcolatrice è una macchina da calcolo automatizzata, di dimensioni fisiche contenute, in grado di eseguire calcoli matematici ed elaborazione dati. Le prime calcolatrici della storia sono meccaniche e solo in parte automatizzate.', 96, 4, 10, '435778'),
(11, 'Plastificatrice', 'Una macchina plastificatrice permette, in sostanza, di poter rivestire con due film plastici trasparenti uno o più fogli di carta o cartoncino di varie dimensioni e grammature.', 15, 4, 42.5, '746645'),
(12, 'Taglierina', 'Il taglierino (spesso chiamato anche trincetto o cutter) è un utensile utilizzato per tagliare.\r\n\r\nEsso è costituito da una lama di metallo scorrevole che viene fissata al corpo dello strumento tramite un piccolo cilindro cavo. Realizzato per essere trasportabile e di facile utilizzo, il taglierino viene spesso impiegato in vari ambienti lavorativi come uffici o magazzini, in cui il suo principale utilizzo è quello di aprire imballaggi o tagliare nastri o corde.\r\n\r\nÈ chiamato anche taglierina sebbene con questo termine si indichi più propriamente una piccola macchina per tagliare la carta o per rifilare i margini delle fotografie.', 10, 4, 30, '967564'),
(13, 'Evidenziatore', 'L\'evidenziatore è un pennarello dalla punta a scalpello utilizzato per richiamare l\'attenzione su alcune sezioni di un documento, grazie ad una marcatura effettuata con colori particolarmente vividi e traslucidi o fluorescenti.', 230, 1, 2.2, '765432'),
(14, 'Zaino ', 'Uno zaino è, nella sua forma più semplice, una sacca in tessuto caricata sulle spalle di una persona e assicurata con due fasce che vanno sopra le spalle e sotto le ascelle.', 20, 3, 15.8, '976480'),
(15, 'Zaino per laptop', 'I tuoi spostamenti quotidiani verso l\'ufficio richiedono uno zaino per laptop resistente e sicuro. Dotati di funzionalità di scurezza hi-tech per proteggere i tuoi accessori, tasche per organizzare il contenuto, questi zaini per laptop sono perfetti per ogni esigenza, dall\'ufficio, ai viaggi di lavoro, alla scuola.', 30, 3, 28, '273906'),
(17, 'Set colori a olio', 'La pittura con i colori ad olio è una tecnica pittorica antica basata sull\'impasto di pigmento in polvere (naturale o sintetico) con leganti generalmente inerti (ad esempio l\'essenza di trementina rettificata, l\'olio di lino, solventi vari).', 12, 3, 35, '273590'),
(18, 'Acquerelli', 'L\'acquerello o acquarello è una tecnica pittorica che prevede l\'uso di pigmenti finemente macinati e mescolati con un legante, diluiti in acqua.', 30, 2, 10.9, '346890'),
(19, 'Pennelli', 'Il pennello è uno strumento utilizzato per dipingere o, a volte, per scrivere, e in generale per stendere sostanze liquide o viscose su di una superficie. Ha forma allungata e ad un\'estremità si trova un ciuffo di peli che permette l\'assorbimento di inchiostro o materia colorante.', 43, 2, 6.9, '137051'),
(20, 'Penna stilografica a sfera', 'La penna a sfera, conosciuta anche come biro, prende il nome dal suo inventore ed è indubbiamente la più diffusa sul mercato. Per queste penne viene utilizzato un inchiostro denso a base oleosa che si conserva a lungo: provate a riprendere in mano una penna a sfera dopo anni dall’ultimo utilizzo e noterete che dopo un’iniziale difficoltà la scrittura risulterà fluida come al solito.\n\nCome funziona una penna a sfera? L’inchiostro, presente sotto forma di pasta densa, si scioglie grazie al calore prodotto dalla rotazione della sfera. La stessa sfera, ruotando, sposta l’inchiostro sul foglio di carta e si asciuga subito dopo il contatto. Le penne a sfera sono le più economiche e sono scelte soprattutto per farne un uso quotidiano, ovvero quando c’è necessità di scrivere molto e su ogni tipo di supporto cartaceo. Non necessitano di particolare manutenzione.', 40, 5, 140, '356786'),
(21, 'Nastro da imballaggio', 'Il nastro adesivo in PVC (Polivinilcloruro) è l\'ideale per qualsiasi tipo di imballo (vetro, legno, plastica, cartone), garantisce una resistenza a lunga durata, senza lasciare residui di colla sulle superfici. Particolarmente indicato per pacchi pesanti è resistente agli agenti atmosferici e gode di buona bagnabilità.', 55, 1, 3.8, '188700'),
(22, 'Inchiostro', 'Gli inchiostri per stilografica sono indispensabili per una scrittura fluida ed efficace: diventa necessario sapersi orientare tra le varie tipologie di inchiostri per penne stilografiche per scegliere il prodotto migliore che ottimizzi le performance del nostro pregiato strumento da scrittura senza comprometterne la funzionalità.\n\nI serbatoi di inchiostro per penne stilografiche sono riempiti con particolari preparati, soluzioni di coloranti o sospensioni di pigmenti, creati appositamente per essere utilizzati in questo ambito. Gli inchiostri si differenziano in base al tempo di asciugatura, alle sfumature, alla fluidità e alla delicatezza. Scopriamo insieme come scegliere l’inchiostro per stilografica migliore in base alle nostre esigenze.', 36, 5, 8.5, '118933'),
(23, 'Penna stilografica classica', 'Una penna stilografica è una penna utilizzata per la scrittura, composta da una cannetta piena d\'inchiostro e da un pennino. L\'inchiostro liquido confluisce al pennino attraverso un sistema di distribuzione che combina gravità e capillarità. L\'inchiostro può essere fornito o da cartucce o da un contagocce oppure da una varietà di meccanismi per rifornire l\'inchiostro nel serbatoio. Ad esempio alcune penne hanno una pompetta di gomma collegata al serbatoio dell\'inchiostro per risucchiare l\'inchiostro da una boccetta. La maggior parte delle penne stilografiche di nuova produzione usano o delle cartucce usa e getta oppure un serbatoio rimovibile con un meccanismo a vite o a pistone per la fornitura dell\'inchiostro.', 25, 5, 120, '119951'),
(24, 'Stampante', 'La stampante, unità di stampa o unità stampante, è una periferica di output elettronica del computer in grado di eseguire l\'operazione di stampa su carta di dati scelti dall\'utente. Attraverso la stampante il computer è quindi in grado di trasferire immagini e/o testi su carta.', 5, 6, 120, '854533'),
(25, 'Chiave USB 16GB', 'Una chiave USB (anche chiavetta USB, penna USB, unità flash USB o in lingua inglese USB flash drive, o pen drive) è una memoria di massa portatile che si collega al computer mediante la porta USB.\r\n\r\nI dati sono memorizzati in una memoria flash, tipicamente di tipo NAND, contenuta al suo interno. La capacità è limitata unicamente dalla densità delle memorie flash impiegate, con il costo per megabyte che aumenta rapidamente per alte capacità. Molti modelli dispongono di un occhiello per permetterne l\'aggancio all\'anello di un comune portachiavi.', 20, 6, 12, '355790'),
(26, 'Tastiera PC', 'La tastiera è una serie ordinata di tasti la cui pressione permette l\'inserimento, nella memoria del computer, di un particolare carattere, oppure l\'esecuzione di un particolare comando da parte del computer.', 10, 6, 25, '257830');

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti_in_ordini`
--

CREATE TABLE `prodotti_in_ordini` (
  `id_prodotto` int(11) DEFAULT NULL,
  `id_ordine` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `profili`
--

CREATE TABLE `profili` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `indirizzo` varchar(50) NOT NULL,
  `citta` varchar(50) NOT NULL,
  `cap` varchar(5) NOT NULL,
  `provincia` varchar(2) NOT NULL,
  `regione` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `id_profilo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `categorie_prodotti`
--
ALTER TABLE `categorie_prodotti`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ordini`
--
ALTER TABLE `ordini`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_utente` (`id_utente`);

--
-- Indici per le tabelle `prodotti`
--
ALTER TABLE `prodotti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indici per le tabelle `prodotti_in_ordini`
--
ALTER TABLE `prodotti_in_ordini`
  ADD KEY `id_prodotto` (`id_prodotto`),
  ADD KEY `id_ordine` (`id_ordine`);

--
-- Indici per le tabelle `profili`
--
ALTER TABLE `profili`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profilo` (`id_profilo`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `categorie_prodotti`
--
ALTER TABLE `categorie_prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `ordini`
--
ALTER TABLE `ordini`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT per la tabella `profili`
--
ALTER TABLE `profili`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `ordini`
--
ALTER TABLE `ordini`
  ADD CONSTRAINT `id_utente` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  ADD CONSTRAINT `id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorie_prodotti` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `prodotti_in_ordini`
--
ALTER TABLE `prodotti_in_ordini`
  ADD CONSTRAINT `id_ordine` FOREIGN KEY (`id_ordine`) REFERENCES `ordini` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_prodotto` FOREIGN KEY (`id_prodotto`) REFERENCES `prodotti` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `utenti`
--
ALTER TABLE `utenti`
  ADD CONSTRAINT `id_profilo` FOREIGN KEY (`id_profilo`) REFERENCES `profili` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
