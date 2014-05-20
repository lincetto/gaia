<?php

/*
* ©2014 Croce Rossa Italiana
*/

paginaAdmin();

$faq = Faq::elenco();

if ( isset($_GET['ok']) ) { ?>
    <div class="alert alert-success">
        <i class="icon-check"></i> <strong>Modifiche effettuate con successo</strong>.<br />
        Le modifiche che hai richiesto sono state correttamente apportate.
    </div>
<?php }elseif ( isset($_GET['errGen']) ) { ?>
    <div class="alert alert-block alert-error">
        <h4><i class="icon-warning-sign"></i> <strong>Qualcosa non ha funzionato</strong>.</h4>
        <p>L'operazione che stavi tentando di eseguire non è andata a buon fine. Per favore riprova.</p>
    </div> 
<?php }?>

<form action="?p=admin.faq.nuova" method="POST">

    <div class="pull-right btn-group">
        <a href="?p=admin.faq.nuova" class="btn btn-large btn-success">
        <i class="icon-plus"></i>
        Nuova Faq
    </a>
</div>

<i class="icon-order"></i><h2>Faq</h2>

<table class="table table-bordered">
    <tbody>
        <?php foreach ( $faq as $f ) { 
            ?>
            <tr>
                <td>
                    <p><strong>D:</strong></p>
                </td>
                <td>
                    <?php echo $f->domanda; ?>
                </td>
                <td>
                    <div class="btn-group">  
                        <a class="btn btn-small btn-info" href="?p=admin.faq.modifica&id=<?php echo $f->id; ?>" title="Modifica">
                            <i class="icon-edit"></i> Modifica
                        </a>
                        <a  onClick="return confirm('Vuoi veramente cancellare questa faq ?');" href="?p=admin.faq.cancella&id=<?php echo $f->id; ?>" title="Cancella" class="btn btn-small btn-danger">
                            <i class="icon-trash"></i> Cancella
                        </a>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <p><strong>R:</strong></p>
                </td>
                <td>
                    <?php echo $f->risposta; ?> 
                </td>
                <td>
                </td>
            </tr>
            <br/>
        <?php } ?>
    </tbody>
</table>

</form>
