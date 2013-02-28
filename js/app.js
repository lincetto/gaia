/*
 * ©2012 Croce Rossa Italiana
 * Tutti i diritti sono riservati
 */

var
    uid = null,
    sid = null,
    uob = null;
    
var conf = {
    api:    'api.php?a='
};

$(window).ready( function () { 
    
    /* Impostazioni di jQuery UI */
    $.datepicker.setDefaults( $.datepicker.regional[ "it" ] );
    
    /* Impostazioni iniziali AJAX */
    $.ajaxSetup({
       type:        "POST",
       dataType:    "json",
       error:       _rete_errore,
       success:    _rete_ok
    });
      
    /* Carica eventuali impostazioni */
    sid = $.cookie('sessione');
    _sincronizza();
    api('welcome', {}, _aggiorna_chiSono());
    
    /* Bind */
    $("#_logout").click( _logout );
    $("#_login").click( _login );
    $("#barraRicerca").keyup( _barraRicerca );

} );

/* Test di funzionamento in HTML5 e caricamento dei polyfill */
Modernizr.load([
  {
    /* Campi richiesti  */
    test: Modernizr.input.required,
    nope: ['js/polyfill/required.js']
        
  },
  {
    /* Placeholder! */
    test: Modernizr.input.placeholder,
    nope: ['js/polyfill/placeholder.css', 'js/polyfill/placeholder.js']
  },
]);

function _rete_errore(a, b, c) {
    alert('C\'è stato un errore nel processare la richiesta.');
}

function _rete_ok(a, b, c) {
    sid = a.session.id;
    uob = a.session.user;
    if ( uob ) {
        uid = uob.id;
    }
    _sincronizza();
}

function _sincronizza() {
    $.ajaxSetup({
        data: {
            sid:    sid
        }
    });
    $.cookie('sessione', sid);
    _aggiorna_chiSono();
}

function _aggiorna_chiSono() {
}
  
function api(operazione, dati, callback) {
    $.post(conf.api + operazione, dati, [_rete_ok, callback]);
}

function _dump( x ) {
}

function _logout () {
    api('logout');
}

function _login () {
   
}

function _barraRicerca () {
    var q = $("#barraRicerca").val();
    if ( q.length < 1 ) {
        $("#laRicerca").hide(1000);
    } else {
        $("#laRicerca").show(1000);
    }
    $("#barraRicerca").addClass('inRicerca');
    api('ricercaSalone', {query: q}, _mostraRisultati);
}

function _mostraRisultati () {
    setTimeout(
    function() {$("#barraRicerca").removeClass('inRicerca');},
    1000);
    
}

function _abilita_filtraggio (idInput, idTabella) {
    $(idInput).keyup ( function () {
        var testo = $(idInput).val().toLowerCase(); 
        if ( testo.length < 2 ) { /* 2, minimo numero di caratteri */
            $(idTabella + " tr").show();
            return;
        }

        $(idTabella + " tr").each( function ( i, e ) {
            var x = false;
            $(e).children("td").each( function (a, b) {
                var attuale = $(b).text().toLowerCase();
                if ( attuale.indexOf(testo) !== -1 )  {
                    x = true;
                    return;
                }
            });
            if ( x ) {
                $(e).show(); 
            } else {
                $(e).hide(); 
            }
        });
        $(idTabella + " thead tr").show();
        
    });
}