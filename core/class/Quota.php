<?php

/*
 * ©2013 Croce Rossa Italiana
 */

class Quota extends Entita {
    
    protected static
        $_t  = 'quote',
        $_dt = null;

    use EntitaCache;
    
    public function volontario() {
        return $this->appartenenza()->volontario();
    }
    
    public function appartenenza() {
        return Appartenenza::id($this->appartenenza);
    }
    
    public function comitato() {
        return $this->appartenenza()->comitato();
    }
    
    public function conferma() {
        return Volontario::id($this->pConferma);
    }
    
    /**
     * Genera il codice numerico progressivo della quota sulla base dell'anno attuale
     *
     * @param bool $forza       Default false. Se vero, riesegue la numerazione.
     * @return int|false $progressivo     Il codice progressivo, false altrimenti 
     */
    public function assegnaProgressivo($forza = false) {
        if (!$forza && $this->progressivo) {
            return false;
        }
        $anno = (int) $this->anno;
        $locale = (int) $this->comitato()->locale()->id;

        $q = "SELECT MAX(progressivo) FROM 
                quote, appartenenza, comitati
              WHERE 
                    anno = {$anno}
                AND quote.appartenenza = appartenenza.id
                AND appartenenza.comitato = comitati.id
                AND comitati.locale = {$locale}";
        $q = $this->db->prepare($q);
        $q->execute();
        $r = $q->fetch(PDO::FETCH_NUM);

        if ($r) 
            $progressivo = (int) $r[0] + 1;
        else
            $progressivo = 1;

        $this->progressivo = $progressivo;
        return $progressivo;
    }

    /**
     * Ritorna il codice numerico progressivo della quota
     *
     * @return Codice progressivo della quota combinato con l'anno
     */
    public function progressivo() {
        if($this->progressivo) {
            return $this->anno.'/'.$this->progressivo;
        }
        return null;
    }

    public function benemerita() {
        return (bool) $this->benemerito == BENEMERITO_SI;
    }

    public function data() {
        return DT::daTimestamp($this->timestamp);
    }

    public function dataPagamento() {
        return DT::daTimestamp($this->timestamp);
    }

    public function annullata() {
        if ($this->pAnnullata && $this->tAnnullata) {
            return true;
        }
        return false;
    }

    public function annullatore() {
        return Utente::id($this->pAnnullata);
    }

    public function dataAnnullo() {
        return DT::daTimestamp($this->tAnnullata);
    }

    /**
     * Data una quota ne ritorna, se esiste il tesseramento a cui appartiene
     * @return Tesseramento     tesseramento sulla base dell'anno della quota
     */
    public function tesseramento() {
        if ($t = Tesseramento::by('anno', $this->anno)) {
            return $t;
        }
        return null;
    }

}
