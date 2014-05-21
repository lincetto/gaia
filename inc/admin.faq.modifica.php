<?php  

/*
 * ©2014 Croce Rossa Italiana
 */

paginaAdmin();

controllaParametri(array('id'), 'admin.faq&errGen');

$faq = Faq::id($_GET['id']);

?>

<form action="?p=admin.faq.modifica.ok&id=<?= $faq->id; ?>" method="POST">
    <div class="modal fade automodal">
        <div class="modal-header">
          <h3><i class="icon-reorder"></i> Modifica FAQ</h3>
        </div>
        <div class="modal-body">
            <div class="row-fluid">
                <div class="span4 centrato">
                    <label for="inputDomanda"> Domanda</label>
                </div>
                <div class="span8">
                    <textarea id="inputDomanda" class="span12" name="inputDomanda" type="text"><?php echo $faq->domanda; ?></textarea>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span4 centrato">
                    <label for="inputRisposta"> Risposta</label>
                </div>
                <div class="span8">
                    <textarea id="inputRisposta" class="span12" name="inputRisposta" type="text"><?php echo $faq->risposta; ?></textarea>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <a href="?p=admin.faq" class="btn">Annulla</a>
            <button type="submit" class="btn btn-success">
                <i class="icon-save"></i> Modifica
            </button>
        </div>
    </div>
</form>

