<?php

/*
 * ©2013 Croce Rossa Italiana
 */

paginaPrivata();
paginaAttivita();
paginaModale();

$attivita = $_POST['id'];
$attivita = new Attivita($attivita);

$referente = $_POST['inputReferente'];
$referente = new Volontario($referente);

$attivita->referente    = $referente;

$m = new Email('referenteAttivita', 'Referente attività');
$m->_NOME       = $referente->nome;
$m->_ATTIVITA   = $attivita->nome;
$m->_COMITATO   = $attivita->comitato()->nomeCompleto();
$m->a = $referente;
$m->invia();

if(isset($_GET['g'])){
    $g = new Gruppo();
    $g->nome        =   $attivita->nome;
    $g->comitato    =   $attivita->comitato()->id;
    $g->obiettivo   =   $attivita->area()->obiettivo;
    $g->area        =   $attivita->area();
    $g->referente   =   $referente;
    $g->attivita 	=	$attivita;
}
    
if ( $me->id == $referente->id ) {
    redirect('attivita.modifica&id=' . $attivita->id);
} else {
    redirect('attivita.grazie&id=' . $attivita->id);
}