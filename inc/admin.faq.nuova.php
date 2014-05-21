<?php  

/*
 * ©2014 Croce Rossa Italiana
 */

paginaAdmin();
paginaModale();
?>

<form action="?p=admin.faq.nuova.ok" method="POST">
  <div class="modal fade automodal">
    <div class="modal-header">
      <h3><i class="icon-reorder"></i> Nuova FAQ</h3>
    </div>
    <div class="modal-body">
      <p>Con questo strumento è possibile inserire una nuova FAQ</p>
      <hr />
      <div class="row-fluid">
        <div class="span4 centrato">
          <label class="control-label" for="inputDomanda"><strong>Domanda</strong></label>
        </div>
        <div class="span8">
          <textarea class="span12" name="inputDomanda" id="inputDomanda" required /></textarea>
        </div>
      </div>
      <div class="row-fluid">
        <div class="span4 centrato">
          <label class="control-label" for="inputRisposta"><strong>Risposta</strong></label>
        </div>
        <div class="span8">
          <textarea class="span12" name="inputRisposta" id="inputRisposta" required /></textarea>
        </div>
      </div>
    </div>
        <div class="modal-footer">
          <a href="?p=admin.faq" class="btn">Annulla</a>
          <button type="submit" class="btn btn-success" >
              <i class="icon-ok"></i> Salva FAQ
          </button>
        </div>
</div>
    
</form>
