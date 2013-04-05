<?php

/*
 * ©2013 Croce Rossa Italiana
 */

paginaPresidenziale();

?>
<script type="text/javascript"><?php require './js/presidente.utenti.js'; ?></script>
<br/>
    <div class="control-group" align="right">
        <div class="controls">
            <div class="input-prepend">
                <span class="add-on"><i class="icon-search"></i></span>
                <input required id="cercaUtente" placeholder="Cerca volontario o titolo..." class="span4" type="text">
            </div>
        </div>
    </div> 
<hr />

<?php if (isset($_GET['ok'])) { ?>
    <div class="alert alert-success">
        <strong><i class="icon-ok"></i> Azione eseguita</strong> correttamente [<?php echo date('H:i:s'); ?>]
    </div>
<?php } ?>

<table class="table table-striped table-bordered" id="tabellaUtenti">
    <thead>
        <th>Nome</th>
        <th>Cognome</th>
        <th>Codice Fiscale</th>
        <th>Titolo</th>
        <th>Dettagli</th>
        <th>Azione</th>
    </thead>
    <?php 
    $comitati= $me->comitatiDiCompetenza();
    foreach($comitati as $comitato){
             foreach ( $comitato->titoliPendenti() as $_t ) {
                 $_v = $_t->volontario();
                   //$a=$_t->volontario()->id;
                   //$a = Appartenenza::filtra([['volontario',$a],['comitato',$comitato]]);
                   //if($a[0]!=''){
                ?>
    <tr>
        <td><?php echo $_v->nome; ?></td>
        <td><?php echo $_v->cognome; ?></td>
        <td><?php echo $_v->codiceFiscale; ?></td>
        <td><strong><?php echo $_t->titolo()->nome; ?></strong></td>
        <td><small>
                                <i class="icon-calendar muted"></i>
                                <?php echo date('d-m-Y', $_t->inizio); ?>
                                
                                <?php if ( $_t->fine ) { ?>
                                    <br />
                                    <i class="icon-time muted"></i>
                                    <?php echo date('d-m-Y', $_t->fine); ?>
                                <?php } ?>
                                <?php if ( $_t->luogo ) { ?>
                                    <br />
                                    <i class="icon-road muted"></i>
                                    <?php echo $_t->luogo; ?>
                                 <?php } ?>
                                 <?php if ( $_t->codice ) { ?>
                                    <br />
                                    <i class="icon-barcode muted"></i>
                                    <?php echo $_t->codice; ?>
                                  <?php } ?>
                                    
                            </small></td>
        <td>    
            <a class="btn btn-success btn-block" href="?p=presidente.titolo.ok&id=<?php echo $_t->id; ?>&si">
                <i class="icon-ok"></i>
                    &nbsp;Conferma&nbsp;
            </a>
            <a class="btn btn-danger btn-block btn-small" href="?p=presidente.titolo.ok&id=<?php echo $_t->id; ?>&no">
                <i class="icon-ban-circle"></i>
                    Nega
            </a>
        </td>
        
    </tr>
    <?php }}//} ?>
</table>