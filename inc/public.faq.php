<?php

/*
* ©2014 Croce Rossa Italiana
*/

?>
<div class="row-fluid">
  <?php if ( !$me instanceof Anonimo ) { ?>
    <div class="span3">
      <?php menuVolontario(); ?>
    </div>
    <div class="span8">
  <?php }else{ ?>
    <div class="span12">
  <?php } ?>

      <h2><i class="icon-reorder"></i> FAQ</h2>
      <hr />
      <?php $faq = Faq::elenco();
        foreach ($faq as $f){ ?>
          <strong>Domanda: </strong><?= $f->domanda; ?><br/>
          <strong>Risposta: </strong><?= $f->risposta; ?><br/>
        <?php } ?>
    </div>
</div>

