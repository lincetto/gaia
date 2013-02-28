<?php

/*
 * ©2012 Croce Rossa Italiana
 */

require('./core.inc.php');
    
/* Attiva il caching */
ob_start();

/* Sessione utente via cookie */
$sessione = new Sessione(@$_COOKIE['sessione']);
@setcookie('sessione', $sessione->id, time() + $conf['sessioni']['durata']);

/* Crea eventuale oggetto $me */
$me = $sessione->utente();

/* Pagina da visualizzare */
$p = $_GET['p'];
if (!$p) { $p = 'home'; }
$_f = "./inc/$p.php";
if ( !file_exists($_f) ) {
	$_f = "./inc/404.php";
}


?>
<!DOCTYPE html>
<html>
  <head>
  	<meta charset="utf-8" />
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Croce Rossa Italiana - Comitato Provinciale di Catania</title>
    <meta name="description" content="Descrizione di base">
    <meta name="author" content="Servizi Informatici - Croce Rossa Italiana Catania">
    <link rel="shortcut icon" href="/img/favicon.ico" />

	<!-- CSS -->

    <link href="css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="css/font-awesome.css" rel="stylesheet" media="screen">
    <link href="css/main.css" rel="stylesheet" media="screen">
    <link href="css/fullcalendar.css" rel="stylesheet" media="screen">
    <link href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" rel="stylesheet" media="screen">
    <!--[if IE]>
        <link href="css/main-ie.css" rel="stylesheet" media="screen">
    <![endif]-->
    
    <!-- JS -->
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="js/modernizr.custom.03290.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
    <script type="text/javascript" src="js/fullcalendar.min.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script type="text/javascript" src="js/app.js"></script>
    <script type="text/javascript" src="js/ui.datepicker-it.js"></script>


    
    
    <?php if (file_exists('js/'. $p . '.js')) { ?>
        <script type="text/javascript" src="js/<?php echo $p; ?>.js"></script>
    <?php } ?>
    
    <script type="text/javascript">
        $(window).load( function() {
            $("#myCarousel").carousel();
        });
    </script>

    
  </head>
  <body>
  
      <div class="navbar-wrapper">

      <div class="container">

        <div class="navbar">
          <div class="navbar-inner">

            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </a>
            <a class="brand" href="#">
            	<img src="./img/logoTop.png" />
            	&nbsp; <span class="muted">CRI</span> Catania
            </a>
            <div class="nav-collapse collapse">
              <ul class="nav">
                <li class="active"><a href="?p=home"><i class="icon-light-bulb"></i> «Gaia» &mdash; Reinventiamo la CRI</a></li>
                <li><a href="http://www.cricatania.it"><i class="icon-reply"></i> Torna a www.cricatania.it</a></li>
                
              </ul>
            </div><!--/.nav-collapse -->
            
            <!--
            <div class="paddingSopra pull-right">
            	<button class="btn btn-danger" data-toggle="modal" data-target="#scegliMetodo">
            		<strong>Registrati</strong>
            		&nbsp;
            		<i class="icon-plus"></i>
            	</button>
            </div>
            -->
            
            <?php
            if ( $u = $sessione->utente() ) { 
            ?>
			<div class="btn-group pull-right paddingSopra">
			  <a class="btn btn-danger" href="?p=me">
			  	<i class="icon-user icon-large"></i>&nbsp;
			  	Ciao, <strong><?php echo $u->nome; ?></strong></a>
			  <button class="btn dropdown-toggle btn-danger" data-toggle="dropdown">
				<span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu">
                              <?php if ( $u->stato == VOLONTARIO ) { ?>
			  	<!--<li><a href="#"><i class="icon-reorder"></i> Attività</a></li>-->
			  	<!--<li class="divider"></li>-->
				<!--<li class="nav-header">Impostazioni</li>-->
				<li><a href="?p=anagrafica"><i class="icon-edit"></i> Anagrafica</a></li>
				<!--<li><a href="?p=curriculum"><i class="icon-star"></i> Qualifiche</a></li>-->
			  	<li class="divider"></li>
                                
                                <?php if ( $u->admin() || $u->presiede() ) { ?>
                                    <li class="nav-header">Gestione</li>
                                    <li><a href="?p=admin.listaUtenti"><i class="icon-cogs"></i> Lista utenti</a></li>
                                    <li><a href="?p=admin.titoliPending"><i class="icon-cogs"></i> Titoli pending</a></li>
                                    <li><a href="?p=admin.comitatiPending"><i class="icon-cogs"></i> Comitati pending</a></li>
                                    <li><a href="?p=admin.ricercaxTitoli"><i class="icon-search"></i> Ricerca per Titoli</a></li>
                                    <li class="divider"></li>
                                    
                                <?php } ?>
                                <?php if ( $u->admin()  ) { ?>
                                    <li class="nav-header">Amministrazione</li>
                                    <li><a href="?p=admin.Presidenti"><i class="icon-cogs"></i> Presidenti</a></li>
                                    <li><a href="?p=admin"><i class="icon-cogs"></i> Admin</a></li>
                                    <li class="divider"></li>
                                <?php } ?>
                              <?php } ?>
                                
				<li><a href="?p=logout"><i class="icon-remove"></i> Esci</a></li>
			  </ul>
			</div>
			<?php } else { ?>
            <div class="paddingSopra pull-right">
            	<a class="btn btn-danger" href="?p=login">
            		<strong>Accedi</strong>
            		<i class="icon-key"></i>
            	</a>
            </div>
            <?php } ?>
			
			
          </div><!-- /.navbar-inner -->
        </div><!-- /.navbar -->

      </div> <!-- /.container -->
    </div><!-- /.navbar-wrapper -->

    <?php if ( in_array($p, $conf['slide'] ) ) { ?>
    <div id="myCarousel" class="carousel slide">
      <div class="carousel-inner">
        <div class="item active">
          <img src="./img/foto4.jpg" alt="">
          <div class="container">
            <div class="carousel-caption">
              <h1>Reinventiamo Croce Rossa</h1>
              <p class="lead">Facciamola nuova, più efficiente e trasparente</p>
              <!--<p class="lead">
		    	     <i class="icon-lightbulb icon-large"></i> Prendi posto
			        </p>-->
            </div>
          </div>
        </div>
        <div class="item">
          <img src="http://twitter.github.com/bootstrap/assets/img/examples/slide-01.jpg" alt="">
          <div class="container">
            <div class="carousel-caption">
              <h1>Persone in Prima Persona</h1>
              <p class="lead">Grazie al nuovo obiettivo trasparenza, vedi cosa sta facendo Croce Rossa attorno a te</p>
              <!--<p class="lead"><i class="icon-calendar"></i> Attività online</p>-->
            </div>
          </div>
        </div>
        <div class="item">
          <img src="./img/foto3.jpg" alt="">
          <div class="container">
            <div class="carousel-caption">
              <h1>Prendi parte alla rivoluzione</h1>
              <p class="lead">diventando un volontario di Croce Rossa. È semplice.</p>
              <a class="btn btn-large btn-warning" href="?p=riconoscimento&tipo=aspirante">Informati per il prossimo corso base</a>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
    </div><!-- /.carousel -->
    <?php } else { ?>
    <div id="myCarousel" class="carousel slide">
      <div class="carousel-inner">
        <div class="item active altoCento">
          <img class="altoCento" src="./img/noSlide.png" alt="">
          <div class="container">
          </div>
        </div>
      </div>
    </div><!-- /.carousel -->
    <?php } ?>
    
    <div class="container">

<?php

	/* Qui si include la pagina */
	require($_f);
	
?>
      <hr>

      <div class="footer row-fluid">
      	<div class="span6">
	        <p>&copy;2013 <strong>Croce Rossa Italiana</strong><br />
    	    <span class="muted">Servizi Informatici del Comitato Provinciale di Catania</span></p>
   		</div>
      	<div class="span6 allinea-destra">
	        <a href="http://www.cricatania.it">Torna al sito</a> &middot;
	        <a href="?p=about">Informazioni si Gaia</a> &middot;
	        <a href="mailto:informatica@cricatania.it">Supporto</a><br />
	        Croce Rossa. <strong>Persone in prima persona.</strong>
   		  </div>
      </div>

    </div> <!-- /container -->

 
    <!-- Statistiche --> 
    <script type="text/javascript">
    var pkBaseURL = (("https:" == document.location.protocol) ? "https://stats.cricatania.it/" : "http://stats.cricatania.it/");
    document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
    </script><script type="text/javascript">
    try {
    var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 2);
    piwikTracker.trackPageView();
    piwikTracker.enableLinkTracking();
    } catch( err ) {}
    </script><noscript><p><img src="http://stats.cricatania.it/piwik.php?idsite=2" style="border:0" alt="" /></p></noscript>
    <!-- Fine statistiche -->
			
  </body>
</html>