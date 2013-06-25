-- phpMyAdmin SQL Dump
-- version 4.0.0-rc2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generato il: Giu 25, 2013 alle 13:11
-- Versione del server: 5.5.30-1~dotdeb.0
-- Versione PHP: 5.4.14-1~dotdeb.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gaia`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `anagrafica`
--
-- Creazione: Mag 28, 2013 alle 19:52
-- Ultimo cambiamento: Giu 25, 2013 alle 11:10
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `anagrafica` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cognome` varchar(255) DEFAULT NULL,
  `stato` varchar(8) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(127) DEFAULT NULL,
  `codiceFiscale` varchar(16) DEFAULT NULL,
  `timestamp` varchar(64) DEFAULT NULL,
  `admin` varchar(64) DEFAULT NULL,
  `consenso` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codiceFiscale` (`codiceFiscale`),
  KEY `email` (`email`),
  FULLTEXT KEY `nome` (`nome`,`cognome`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `appartenenza`
--
-- Creazione: Apr 17, 2013 alle 13:44
-- Ultimo cambiamento: Giu 25, 2013 alle 11:10
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `appartenenza` (
  `id` int(11) NOT NULL,
  `volontario` varchar(16) DEFAULT NULL,
  `comitato` varchar(16) DEFAULT NULL,
  `stato` varchar(8) DEFAULT NULL,
  `inizio` varchar(64) DEFAULT NULL,
  `fine` varchar(64) DEFAULT NULL,
  `timestamp` varchar(64) DEFAULT NULL,
  `conferma` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `volontario` (`volontario`),
  KEY `comitato` (`comitato`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `aree`
--
-- Creazione: Giu 25, 2013 alle 11:02
-- Ultimo cambiamento: Giu 25, 2013 alle 11:02
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `aree` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `comitato` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `responsabile` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `obiettivo` varchar(8) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comitato` (`comitato`),
  KEY `responsabile` (`responsabile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `attivita`
--
-- Creazione: Apr 28, 2013 alle 17:04
-- Ultimo cambiamento: Giu 25, 2013 alle 11:10
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `attivita` (
  `id` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(255) NOT NULL DEFAULT '',
  `luogo` varchar(255) DEFAULT NULL,
  `comitato` varchar(32) DEFAULT NULL,
  `visibilita` int(11) DEFAULT NULL,
  `referente` varchar(32) DEFAULT NULL,
  `tipo` varchar(8) DEFAULT NULL,
  `geo` point NOT NULL,
  `descrizione` text,
  `stato` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comitato` (`comitato`),
  KEY `referente` (`referente`),
  SPATIAL KEY `geo` (`geo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `autorizzazioni`
--
-- Creazione: Apr 17, 2013 alle 13:56
-- Ultimo cambiamento: Giu 25, 2013 alle 11:10
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `autorizzazioni` (
  `id` int(11) NOT NULL,
  `volontario` varchar(16) DEFAULT NULL,
  `partecipazione` varchar(16) DEFAULT NULL,
  `timestamp` varchar(64) DEFAULT NULL,
  `pFirma` varchar(16) DEFAULT NULL,
  `tFirma` varchar(64) DEFAULT NULL,
  `note` text,
  `stato` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `partecipazione` (`partecipazione`),
  KEY `volontario` (`volontario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `avatar`
--
-- Creazione: Apr 17, 2013 alle 13:56
-- Ultimo cambiamento: Giu 25, 2013 alle 11:10
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `avatar` (
  `id` int(11) NOT NULL,
  `utente` varchar(64) DEFAULT NULL,
  `timestamp` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `utente` (`utente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `comitati`
--
-- Creazione: Giu 25, 2013 alle 11:04
-- Ultimo cambiamento: Giu 25, 2013 alle 11:04
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `comitati` (
  `id` int(11) NOT NULL,
  `nome` varchar(64) DEFAULT NULL,
  `colore` varchar(8) DEFAULT NULL,
  `locale` int(11) DEFAULT NULL,
  `geo` point NOT NULL,
  PRIMARY KEY (`id`),
  KEY `locale` (`locale`),
  SPATIAL KEY `geo` (`geo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `commenti`
--
-- Creazione: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `commenti` (
  `id` int(11) NOT NULL,
  `attivita` varchar(16) DEFAULT NULL,
  `commento` varchar(255) DEFAULT NULL,
  `volontario` varchar(64) DEFAULT NULL,
  `tCommenta` varchar(16) DEFAULT NULL,
  `upCommento` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `volontario` (`volontario`),
  KEY `attivita` (`attivita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `coturni`
--
-- Creazione: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `coturni` (
  `id` int(11) NOT NULL,
  `volontario` varchar(16) DEFAULT NULL,
  `appartenenza` varchar(16) DEFAULT NULL,
  `turno` varchar(16) DEFAULT NULL,
  `stato` varchar(64) DEFAULT NULL,
  `pMonta` varchar(16) DEFAULT NULL,
  `tMonta` varchar(64) DEFAULT NULL,
  `pSmonta` varchar(16) DEFAULT NULL,
  `tSmonta` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comitato` (`appartenenza`),
  KEY `volontario` (`volontario`),
  KEY `turno` (`turno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `datiComitati`
--
-- Creazione: Apr 17, 2013 alle 13:50
-- Ultimo cambiamento: Giu 25, 2013 alle 11:10
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `datiComitati` (
  `id` varchar(128) NOT NULL DEFAULT '',
  `nome` varchar(32) NOT NULL DEFAULT '',
  `valore` text,
  PRIMARY KEY (`id`,`nome`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `datiLocali`
--
-- Creazione: Apr 17, 2013 alle 13:50
-- Ultimo cambiamento: Apr 17, 2013 alle 13:50
--

CREATE TABLE IF NOT EXISTS `datiLocali` (
  `id` varchar(128) NOT NULL DEFAULT '',
  `nome` varchar(32) NOT NULL DEFAULT '',
  `valore` text,
  PRIMARY KEY (`id`,`nome`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `datiNazionali`
--
-- Creazione: Apr 17, 2013 alle 13:50
-- Ultimo cambiamento: Apr 17, 2013 alle 13:50
--

CREATE TABLE IF NOT EXISTS `datiNazionali` (
  `id` varchar(128) NOT NULL DEFAULT '',
  `nome` varchar(32) NOT NULL DEFAULT '',
  `valore` text,
  PRIMARY KEY (`id`,`nome`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `datiProvinciali`
--
-- Creazione: Apr 17, 2013 alle 13:50
-- Ultimo cambiamento: Apr 17, 2013 alle 13:50
--

CREATE TABLE IF NOT EXISTS `datiProvinciali` (
  `id` varchar(128) NOT NULL DEFAULT '',
  `nome` varchar(32) NOT NULL DEFAULT '',
  `valore` text,
  PRIMARY KEY (`id`,`nome`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `datiRegionali`
--
-- Creazione: Apr 17, 2013 alle 13:50
-- Ultimo cambiamento: Apr 17, 2013 alle 13:50
--

CREATE TABLE IF NOT EXISTS `datiRegionali` (
  `id` varchar(128) NOT NULL DEFAULT '',
  `nome` varchar(32) NOT NULL DEFAULT '',
  `valore` text,
  PRIMARY KEY (`id`,`nome`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `datiSessione`
--
-- Creazione: Mar 06, 2013 alle 19:53
-- Ultimo cambiamento: Giu 25, 2013 alle 11:10
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `datiSessione` (
  `id` varchar(128) NOT NULL DEFAULT '',
  `nome` varchar(32) NOT NULL DEFAULT '',
  `valore` text,
  PRIMARY KEY (`id`,`nome`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `delegati`
--
-- Creazione: Giu 25, 2013 alle 11:07
-- Ultimo cambiamento: Giu 25, 2013 alle 11:07
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `delegati` (
  `id` int(11) NOT NULL,
  `comitato` varchar(16) DEFAULT NULL,
  `estensione` varchar(5) NOT NULL DEFAULT '0',
  `volontario` varchar(16) DEFAULT NULL,
  `applicazione` varchar(16) DEFAULT NULL,
  `dominio` varchar(16) DEFAULT NULL,
  `inizio` varchar(64) DEFAULT NULL,
  `fine` varchar(64) DEFAULT NULL,
  `pConferma` varchar(16) DEFAULT NULL,
  `tConferma` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comitato` (`comitato`),
  KEY `applicazione` (`applicazione`),
  KEY `volontario` (`volontario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `dettagliAttivita`
--
-- Creazione: Mar 06, 2013 alle 19:53
-- Ultimo cambiamento: Giu 25, 2013 alle 11:10
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `dettagliAttivita` (
  `id` varchar(128) NOT NULL DEFAULT '',
  `nome` varchar(32) NOT NULL DEFAULT '',
  `valore` text,
  PRIMARY KEY (`id`,`nome`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `dettagliComitato`
--
-- Creazione: Apr 17, 2013 alle 13:50
-- Ultimo cambiamento: Apr 17, 2013 alle 13:50
--

CREATE TABLE IF NOT EXISTS `dettagliComitato` (
  `id` varchar(128) NOT NULL DEFAULT '',
  `nome` varchar(32) NOT NULL DEFAULT '',
  `valore` text,
  PRIMARY KEY (`id`,`nome`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `dettagliPersona`
--
-- Creazione: Mar 06, 2013 alle 19:53
-- Ultimo cambiamento: Giu 25, 2013 alle 11:10
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `dettagliPersona` (
  `id` varchar(128) NOT NULL DEFAULT '',
  `nome` varchar(32) NOT NULL DEFAULT '',
  `valore` text,
  PRIMARY KEY (`id`,`nome`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `dimissioni`
--
-- Creazione: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `dimissioni` (
  `id` int(11) NOT NULL,
  `volontario` varchar(16) DEFAULT NULL,
  `appartenenza` varchar(16) DEFAULT NULL,
  `comitato` varchar(16) DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `tConferma` varchar(64) DEFAULT NULL,
  `pConferma` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `volontario` (`volontario`),
  KEY `comitato` (`comitato`),
  KEY `appartenenza` (`appartenenza`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `documenti`
--
-- Creazione: Apr 17, 2013 alle 14:06
-- Ultimo cambiamento: Giu 25, 2013 alle 11:10
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `documenti` (
  `id` varchar(64) NOT NULL,
  `volontario` varchar(16) DEFAULT NULL,
  `tipo` varchar(8) DEFAULT NULL,
  `timestamp` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `volontario` (`volontario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `elementiRichieste`
--
-- Creazione: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `elementiRichieste` (
  `id` int(11) NOT NULL,
  `richiesta` int(11) NOT NULL,
  `titolo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `file`
--
-- Creazione: Apr 17, 2013 alle 13:50
-- Ultimo cambiamento: Giu 25, 2013 alle 11:10
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `file` (
  `id` varchar(64) NOT NULL,
  `creazione` varchar(64) DEFAULT NULL,
  `autore` varchar(16) DEFAULT NULL,
  `scadenza` varchar(64) DEFAULT NULL,
  `mime` varchar(64) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `download` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scadenza` (`scadenza`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `gruppi`
--
-- Creazione: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `gruppi` (
  `id` int(11) NOT NULL,
  `comitato` varchar(16) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `obiettivo` varchar(8) DEFAULT NULL,
  `area` varchar(16) DEFAULT NULL,
  `referente` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comitato` (`comitato`),
  KEY `referente` (`referente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `gruppiPersonali`
--
-- Creazione: Giu 25, 2013 alle 11:09
-- Ultimo cambiamento: Giu 25, 2013 alle 11:09
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `gruppiPersonali` (
  `id` int(11) NOT NULL,
  `volontario` varchar(16) DEFAULT NULL,
  `comitato` varchar(16) DEFAULT NULL,
  `gruppo` varchar(16) DEFAULT NULL,
  `inizio` varchar(64) DEFAULT NULL,
  `fine` varchar(64) DEFAULT NULL,
  `timestamp` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `volontario` (`volontario`),
  KEY `comitato` (`comitato`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `locali`
--
-- Creazione: Apr 17, 2013 alle 13:50
-- Ultimo cambiamento: Giu 25, 2013 alle 11:10
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `locali` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `geo` point NOT NULL,
  `provinciale` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `provinciale` (`provinciale`),
  SPATIAL KEY `geo` (`geo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `nazionali`
--
-- Creazione: Apr 17, 2013 alle 13:50
-- Ultimo cambiamento: Apr 17, 2013 alle 14:18
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `nazionali` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `geo` point NOT NULL,
  PRIMARY KEY (`id`),
  SPATIAL KEY `geo` (`geo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `partecipazioni`
--
-- Creazione: Apr 17, 2013 alle 14:10
-- Ultimo cambiamento: Giu 25, 2013 alle 11:10
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `partecipazioni` (
  `id` int(11) NOT NULL,
  `volontario` varchar(16) DEFAULT NULL,
  `turno` varchar(16) DEFAULT NULL,
  `stato` varchar(8) DEFAULT NULL,
  `tipo` varchar(8) DEFAULT NULL,
  `timestamp` varchar(64) DEFAULT NULL,
  `tConferma` varchar(64) DEFAULT NULL,
  `pConferma` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `turno` (`turno`),
  KEY `volontario` (`volontario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `provinciali`
--
-- Creazione: Apr 17, 2013 alle 13:50
-- Ultimo cambiamento: Giu 25, 2013 alle 11:10
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `provinciali` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `geo` point NOT NULL,
  `regionale` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regionale` (`regionale`),
  SPATIAL KEY `geo` (`geo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `quote`
--
-- Creazione: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `quote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appartenenza` varchar(16) DEFAULT NULL,
  `timestamp` varchar(64) DEFAULT NULL,
  `tConferma` varchar(64) DEFAULT NULL,
  `pConferma` varchar(16) DEFAULT NULL,
  `quota` varchar(255) DEFAULT NULL,
  `causale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appartenenza` (`appartenenza`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `regionali`
--
-- Creazione: Apr 17, 2013 alle 13:50
-- Ultimo cambiamento: Giu 25, 2013 alle 11:10
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `regionali` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `geo` point NOT NULL,
  `nazionale` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nazionale` (`nazionale`),
  SPATIAL KEY `geo` (`geo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `reperibilita`
--
-- Creazione: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `reperibilita` (
  `id` int(11) NOT NULL,
  `volontario` varchar(16) DEFAULT NULL,
  `comitato` varchar(16) DEFAULT NULL,
  `inizio` varchar(64) DEFAULT NULL,
  `fine` varchar(64) DEFAULT NULL,
  `attivazione` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comitato` (`comitato`),
  KEY `volontario` (`volontario`),
  KEY `inizio` (`inizio`),
  KEY `fine` (`fine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `richiesteTurni`
--
-- Creazione: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `richiesteTurni` (
  `id` int(11) NOT NULL,
  `turno` int(11) NOT NULL,
  `timestamp` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `riserve`
--
-- Creazione: Apr 17, 2013 alle 13:50
-- Ultimo cambiamento: Giu 25, 2013 alle 11:10
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `riserve` (
  `id` int(11) NOT NULL,
  `stato` varchar(16) DEFAULT NULL,
  `appartenenza` varchar(16) DEFAULT NULL,
  `volontario` varchar(16) DEFAULT NULL,
  `inizio` varchar(64) DEFAULT NULL,
  `fine` varchar(64) DEFAULT NULL,
  `protNumero` varchar(16) DEFAULT NULL,
  `protData` varchar(64) DEFAULT NULL,
  `motivo` text,
  `negazione` text,
  `timestamp` varchar(64) DEFAULT NULL,
  `pConferma` varchar(16) DEFAULT NULL,
  `tConferma` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appartenenza` (`appartenenza`),
  KEY `volontario` (`volontario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `sessioni`
--
-- Creazione: Mar 06, 2013 alle 19:53
-- Ultimo cambiamento: Giu 25, 2013 alle 11:10
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `sessioni` (
  `id` varchar(128) NOT NULL,
  `utente` int(11) DEFAULT NULL,
  `azione` varchar(64) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `agent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `titoli`
--
-- Creazione: Mar 06, 2013 alle 19:53
-- Ultimo cambiamento: Giu 25, 2013 alle 11:10
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `titoli` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `tipo` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `nome` (`nome`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `titoliPersonali`
--
-- Creazione: Mar 06, 2013 alle 19:53
-- Ultimo cambiamento: Giu 25, 2013 alle 11:10
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `titoliPersonali` (
  `id` int(11) NOT NULL,
  `volontario` varchar(16) DEFAULT NULL,
  `titolo` varchar(16) DEFAULT NULL,
  `inizio` varchar(64) DEFAULT NULL,
  `fine` varchar(64) DEFAULT NULL,
  `luogo` varchar(64) DEFAULT NULL,
  `codice` varchar(64) DEFAULT NULL,
  `tConferma` varchar(64) DEFAULT NULL,
  `pConferma` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `trasferimenti`
--
-- Creazione: Apr 17, 2013 alle 13:50
-- Ultimo cambiamento: Giu 25, 2013 alle 11:10
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `trasferimenti` (
  `id` int(11) NOT NULL,
  `stato` varchar(16) DEFAULT NULL,
  `appartenenza` varchar(16) DEFAULT NULL,
  `volontario` varchar(16) DEFAULT NULL,
  `protNumero` varchar(16) DEFAULT NULL,
  `protData` varchar(64) DEFAULT NULL,
  `motivo` text,
  `negazione` text,
  `timestamp` varchar(64) DEFAULT NULL,
  `pConferma` varchar(16) DEFAULT NULL,
  `tConferma` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appartenenza` (`appartenenza`),
  KEY `volontario` (`volontario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `turni`
--
-- Creazione: Apr 17, 2013 alle 14:14
-- Ultimo cambiamento: Giu 25, 2013 alle 11:10
-- Ultimo controllo: Giu 25, 2013 alle 11:10
--

CREATE TABLE IF NOT EXISTS `turni` (
  `id` int(11) NOT NULL,
  `attivita` varchar(16) DEFAULT NULL,
  `nome` varchar(64) DEFAULT NULL,
  `inizio` varchar(64) DEFAULT NULL,
  `fine` varchar(64) DEFAULT NULL,
  `timestamp` varchar(64) DEFAULT NULL,
  `minimo` varchar(8) NOT NULL,
  `massimo` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attivita` (`attivita`),
  KEY `inizio` (`inizio`),
  KEY `fine` (`fine`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;