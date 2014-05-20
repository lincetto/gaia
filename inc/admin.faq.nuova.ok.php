<?php

/*
 * ©2014 Croce Rossa Italiana
 */

paginaAdmin();
$parametri = array('inputDomanda', 'inputRisposta');
controllaParametri($parametri, 'admin.faq&errGen');

$domanda  = $_POST['inputDomanda'];
$risposta = $_POST['inputRisposta'];

$faq = new Faq();

$faq->domanda 	= $domanda;
$faq->risposta 	= $risposta;
$faq->pConferma = $me;
$faq->tConferma = time();

redirect('admin.faq&ok');
