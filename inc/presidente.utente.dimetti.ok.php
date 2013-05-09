<?php

/*
 * ©2013 Croce Rossa Italiana
 */

paginaPresidenziale();

$v     = $_GET['id'];
$v = Volontario::by('id', $v);

$m = new Email('dimissionevolontario', 'Dimissione Volontario: ' . $v->nomeCompleto());
$m->a = $v->volontario();
$m->_NOME       = $v->volontario()->nome;
$m-> _MOTIVO = $_POST['motivo'];
$m->invia();
                
$d = new Dimissione();
$d->volontario = $v->id;

$a = Appartenenza::filtra([['volontario', $v]]);
$i = Delegato::filtra([['volontario',$v]]);
$g = TitoloPersonale::filtra([['volontario', $v]]);

foreach ($i as $_i){
    $b = new Delegato($_i);
    $b->fine = time();   
}

foreach ($g as $_g){
    $g = new TitoloPersonale($_g);
    $g->fine = time();   
}

foreach ( $a as $_a){
    if($_a->attuale()){
        $d->appartenenza = $_a;
        $d->comitato = $_a->comitato;
        $d->motivo = $_POST['motivo'];
        $d->tConferma = time();
        $d->pConferma = $me;
        $x = new Appartenenza($_a);
        $x->fine = time();
        $x->stato = MEMBRO_DIMESSO;
        $f = new Persona($v);
        $f->stato = PERSONA;
        $f->admin='';
    }
}
                    
redirect('presidente.utenti&dim');   
?>