<?php

/*
 * ©2014 Croce Rossa Italiana
 */

paginaApp([APP_PRESIDENTE, APP_AUTOPARCO]);

if ( isset($_GET['mod']) ){

	$autoparco = $_GET['id'];
	$c = Autoparco::id($autoparco);
	proteggiAutoparco($c, [APP_AUTOPARCO, APP_PRESIDENTE]);

}else{

	$c = new Autoparco();
	
}

$c->nome        =   normalizzaNome($_POST['inputNome']);
$c->telefono    =   maiuscolo($_POST['inputTelefono']);

if ( !isset($_GET['mod']) || $me->admin() ){
	$comitato = $_POST['inputComitato'];
	$comitato = GeoPolitica::daOid($comitato);

	$c->comitato = $comitato->oid();
}

$ricerca  = $_POST['inputIndirizzo'] . ', ';
$ricerca .= $_POST['inputCivico'] . ' ';
$ricerca .= $_POST['inputCAP'] . ' ';
$ricerca .= $_POST['inputComune'] . ' (';
$ricerca .= $_POST['inputProvincia'] . ')';

$g = new Geocoder($ricerca);
$r = $g->risultati[0];

$c->indirizzo   = $r->via;
$c->civico      = $r->civico;
$c->cap         = $r->cap;
$c->comune      = $r->comune;
$c->provincia   = $r->provincia;
$c->formattato  = $r->formattato;

$c->localizzaStringa($c->formattato);

redirect('autoparco.autoparchi&new');
