<?php

/*
 * ©2013 Croce Rossa Italiana
 */

paginaAdmin();

$c = $_GET['id'];

if (isset($_GET['com'])){
    
        $t = new Comitato();
        $t->nome = normalizzaNome( $_POST['inputNome'] );
        $t->locale = $c;
        redirect('admin.comitati&new');
    
}elseif (isset($_GET['loc'])){
    
    $t = new Locale();
    $t->nome = normalizzaNome( $_POST['inputNome'] );
    $t->provinciale = $c;
    redirect('admin.comitati&new');
    
}elseif (isset($_GET['pro'])){
    
    $t = new Provinciale();
    $t->nome = normalizzaNome( $_POST['inputNome'] );
    $t->regionale = $c;
    redirect('admin.comitati&new');
    
}elseif (isset($_GET['regi'])){
    
    $t = new Regionale();
    $t->nome = normalizzaNome( $_POST['inputNome'] );
    $t->nazionale = $c;
    redirect('admin.comitati&new');
    
}elseif (isset($_GET['naz'])){
    
    $t = new Nazionale();
    $t->nome = normalizzaNome( $_POST['inputNome'] );
    redirect('admin.comitati&new');
    
}
