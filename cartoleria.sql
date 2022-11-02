-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Creato il: Nov 02, 2022 alle 14:03
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
(3, 'Cartucce e Toner'),
(4, 'Macchine ufficio'),
(5, 'Spedizione'),
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
  `id_categoria` int(11) DEFAULT NULL,
  `quantita` int(11) NOT NULL,
  `prezzo_di_vendita` double NOT NULL,
  `codice_prodotto` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `prodotti`
--

INSERT INTO `prodotti` (`id`, `nome_prodotto`, `descrizione`, `id_categoria`, `quantita`, `prezzo_di_vendita`, `codice_prodotto`) VALUES
(1, 'Penna a sfera', 'La penna a sfera, o anche biro dal nome del suo inventore László Bíró, è uno strumento per scrivere su carta che rilascia inchiostro da un serbatoio interno attraverso l\'azione di rotolamento di una sfera metallica a contatto con la carta.', 1, 100, 2.5, '837360'),
(2, 'Matita', 'Una matita (o lapis) è uno strumento per disegnare e per scrivere. La matita comune è solitamente un bastoncino di legno con un\'anima in grafite; esiste anche il cosiddetto portamine o matita a mine in cui si inseriscono mine di materiale colorato che si differenziano per grandezza (0,5 mm, 0,7 mm ecc.).', 1, 200, 1.99, '018272'),
(3, 'Gomma per cancellare', 'La gomma per cancellare è uno strumento di cancelleria in gomma, naturale o sintetica, atto a rimuovere meccanicamente inchiostri o tracce di grafite da supporti di scrittura o disegno. Si divide in più tipi, dipendentemente dal tipo di tratto da rimuovere.', 1, 50, 1.2, '018221'),
(4, 'Temperamatite', 'Il temperamatite, anche detto temperino, è un oggetto di cancelleria molto comune, realizzato in acciaio, ferro, plastica o altri materiali. La sua funzione è appuntire le matite, affinché queste possano scrivere.', 1, 35, 3, '143589'),
(5, 'Portamine', 'I portamine sono frequentemente utilizzati perché sono affidabili, cancellabili, ricaricabili, a basso costo e, inoltre, un prodotto molto sostenibile. I portamine possono essere usati per disegnare, schizzare o scrivere note veloci. Molti illustratori usano i portamine per disegnare gli schizzi prima di finire l\'opera con l\'inchiostro di china. Nel vasto assortimento di portamine si trovano anche modelli con i quali è facile scrivere come con quelli standard.', 1, 20, 3.5, '294416'),
(6, 'Nastro adesivo', 'Il nastro adesivo (a volte impropriamente chiamato Scotch) è un nastro di plastica o carta a cui è applicata una sostanza adesiva. Il nastro può essere adesivo da un solo lato o da entrambi (nastro biadesivo), nel secondo caso una delle due facce del nastro è spesso protetta da una pellicola.\r\n\r\nÈ utilizzato per incollare oggetti fra loro per lo più temporaneamente, ma anche permanentemente. L\'adesione avviene per semplice contatto con l\'oggetto.\r\n\r\nI più diffusi sono preparati con adesivi sensibili alla pressione e sono autoadesivi. Esistono anche nastri adesivi termoattivabili (che prima dell\'applicazione devono essere attivati con il calore) e nastri adesivi attivabili ad acqua (che devono essere bagnati con acqua).', 1, 58, 1.5, '199986'),
(7, 'Colla stick', 'La colla (a) stick o colla a bastoncino è un tipo di colla venduta in bastoncini a scatto o a vite. L\'utilizzatore può applicare la colla aprendo il bastoncino e tenendolo fermo con una mano, così da non sporcarsi le dita. Questo tipo di colla è utilizzato principalmente in ambito domestico, scolastico e in ufficio. La colla stick più famosa è la Pritt della Henkel ma esistono anche altri marchi in commercio, come UHU e Giotto. n commercio colle stick di varie dimensioni, le più diffuse sono di 10, 20 o 40 grammi.La Giotto produce circa 1540 tubetti di colla, la pritt 3045 e la UHU 1230. Nel 2013 la Giotto ha prodotto circa 3461 tubetti di colla e ha inventato la colla piccola da 10 grammi.', 1, 40, 2, '198936'),
(8, 'Post it', 'Un foglietto Post-it® potrebbe essere utile per fare riferimento alle annotazioni di una determinata giornata. I Foglietti Post-it® sono straordinari perché consentono di appuntarsi le idee a cui fare riferimento in seguito.', 1, 260, 5, '864379'),
(9, 'Forbici', 'Le forbici sono uno strumento molto utilizzato per tagliare materiali sottili che richiedono poca forza, quali carta, cartone, tessuti, corde, cavi, alimenti, fogli sottili di metallo e plastica, fili, capelli, unghie.', 1, 63, 3.2, '346765'),
(10, 'Calcolatrice', 'Una calcolatrice è una macchina da calcolo automatizzata, di dimensioni fisiche contenute, in grado di eseguire calcoli matematici ed elaborazione dati. Le prime calcolatrici della storia sono meccaniche e solo in parte automatizzate.', 4, 96, 10, '435778'),
(11, 'Plastificatrice', 'Una macchina plastificatrice permette, in sostanza, di poter rivestire con due film plastici trasparenti uno o più fogli di carta o cartoncino di varie dimensioni e grammature.', 4, 15, 42.5, '746645'),
(12, 'Taglierina', 'Il taglierino (spesso chiamato anche trincetto o cutter) è un utensile utilizzato per tagliare.\r\n\r\nEsso è costituito da una lama di metallo scorrevole che viene fissata al corpo dello strumento tramite un piccolo cilindro cavo. Realizzato per essere trasportabile e di facile utilizzo, il taglierino viene spesso impiegato in vari ambienti lavorativi come uffici o magazzini, in cui il suo principale utilizzo è quello di aprire imballaggi o tagliare nastri o corde.\r\n\r\nÈ chiamato anche taglierina sebbene con questo termine si indichi più propriamente una piccola macchina per tagliare la carta o per rifilare i margini delle fotografie.', 4, 10, 30, '967564'),
(13, 'Evidenziatore', 'L\'evidenziatore è un pennarello dalla punta a scalpello utilizzato per richiamare l\'attenzione su alcune sezioni di un documento, grazie ad una marcatura effettuata con colori particolarmente vividi e traslucidi o fluorescenti.', 1, 230, 2.2, '765432'),
(14, 'Cartuccia compatibile Epson T1302 Cervo CIANO', 'Cartuccia compatibile Epson T1302 Cervo CIANO 945 pagine per Stampanti: Epson STYLUS OFFICE B42WD, Epson STYLUS OFFICE BX320FW, Epson STYLUS OFFICE BX525, Epson STYLUS OFFICE BX525WD, Epson STYLUS OFFICE BX535WD, Epson STYLUS OFFICE BX625, Epson STYLUS OFFICE BX625FWD, Epson STYLUS OFFICE BX630FW, Epson STYLUS OFFICE BX635FWD, Epson STYLUS OFFICE BX925FWD, etc.', 3, 20, 2.4, '976480'),
(15, 'Cartuccia compatibile Epson T1301 Cervo NERO', 'Cartuccia compatibile Epson T1301 Cervo NERO 945 pagine per Stampanti: Epson STYLUS OFFICE B42WD, Epson STYLUS OFFICE BX320FW, Epson STYLUS OFFICE BX525, Epson STYLUS OFFICE BX525WD, Epson STYLUS OFFICE BX535WD, Epson STYLUS OFFICE BX625, Epson STYLUS OFFICE BX625FWD, Epson STYLUS OFFICE BX630FW, Epson STYLUS OFFICE BX635FWD, Epson STYLUS OFFICE BX925FWD, etc.', 3, 30, 3.2, '273906'),
(16, 'Toner compatibile Xerox 106R01147 NERO', 'Toner compatibile Xerox 106R01147 NERO 10000 pagine per Stampanti: Xerox PHASER 6350', 3, 8, 11.5, '357895'),
(17, 'Toner compatibile Xerox 106R01145 MAGENTA', 'Toner compatibile Xerox 106R01145 MAGENTA 8000 pagine per Stampanti: Xerox PHASER 6350', 3, 12, 11.2, '273590'),
(18, 'Carta per stampanti', 'Nonostante l’avvento del digitale stampe e fotocopie sono ancora oggi un articolo estremamente diffuso. In ufficio, a scuola e nelle università, negli studi professionali, a casa e in ogni attività commerciale si ha continuamente a che fare con fogli di carta e di ogni tipo. Nel nuovo catalogo MondOffice abbiamo pensato a un vasto assortimento di offerte per carta per stampanti e fotocopiatrici, articoli versatili e specifici per ogni esigenza che possano garantire risultati impeccabili e costi contenuti.', 2, 140, 7.8, '346890'),
(19, 'Carta speciale laser e inkjet', 'Film adesivo bianco lucido adatto per fotocopiatrici a colori e monocromatiche e stampanti laser adatto anche per macchine con temperatura di fissaggio elevata. Questo film bianco dissoluto per stampanti laser a colori offre presentazioni di visualizzazione brillanti e veritiere e può essere utilizzato come un toner universale a colori. ', 2, 27, 14.8, '137051'),
(20, 'Busta imbottita', 'Leggere, resistenti e di facile utilizzo le buste imbottite con pluriball sono dotate di semplice chiusura autoadesiva per una sigillatura rapida e affidabile. ', 5, 40, 2.6, '356786'),
(21, 'Nastro da imballaggio', 'Il nastro adesivo in PVC (Polivinilcloruro) è l\'ideale per qualsiasi tipo di imballo (vetro, legno, plastica, cartone), garantisce una resistenza a lunga durata, senza lasciare residui di colla sulle superfici. Particolarmente indicato per pacchi pesanti è resistente agli agenti atmosferici e gode di buona bagnabilità.', 5, 55, 3.8, '188700'),
(22, 'Scatola di cartone', 'Lo scatolone è un contenitore di forma generalmente parallelepipeda o cilindrica e munito di coperchio usato per riporre o trasportare materiali solidi di vario genere.', 5, 80, 2.3, '118933'),
(23, 'Tubo per spedizione', 'Tubi per spedizioni sono ideali per la spedizione di prodotti come poster, stampe, tele, manifesti e disegni. Leggeri, resistenti agli urti e molto sicuri, i tubi per spedizioni in cartone avana dallo spessore di 1,5 mm con tappi in plastica trasparente. Leggeri, economici ma altamente protettivi.', 5, 25, 5, '119951'),
(24, 'Stampante', 'La stampante, unità di stampa o unità stampante, è una periferica di output elettronica del computer in grado di eseguire l\'operazione di stampa su carta di dati scelti dall\'utente. Attraverso la stampante il computer è quindi in grado di trasferire immagini e/o testi su carta.', 6, 5, 120, '854533'),
(25, 'Chiave USB 16GB', 'Una chiave USB (anche chiavetta USB, penna USB, unità flash USB o in lingua inglese USB flash drive, o pen drive) è una memoria di massa portatile che si collega al computer mediante la porta USB.\r\n\r\nI dati sono memorizzati in una memoria flash, tipicamente di tipo NAND, contenuta al suo interno. La capacità è limitata unicamente dalla densità delle memorie flash impiegate, con il costo per megabyte che aumenta rapidamente per alte capacità. Molti modelli dispongono di un occhiello per permetterne l\'aggancio all\'anello di un comune portachiavi.', 6, 20, 12, '355790'),
(26, 'Tastiera PC', 'La tastiera è una serie ordinata di tasti la cui pressione permette l\'inserimento, nella memoria del computer, di un particolare carattere, oppure l\'esecuzione di un particolare comando da parte del computer.', 6, 10, 25, '257830');

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
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
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
  `cap` varchar(10) NOT NULL,
  `provincia` varchar(20) NOT NULL,
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
