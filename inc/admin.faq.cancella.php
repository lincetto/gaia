<?php

/*
 * ©2014 Croce Rossa Italiana
 */

paginaAdmin();
$parametri = array('id');
controllaParametri($parametri, 'admin.faq&errGen');

$faq = Faq::id($_GET['id']);

$faq->cancella();

redirect('admin.faq&ok');
