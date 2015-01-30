<!-- 
    Created on : 28 oct. 2014, 16:15:16
    Author     : Vincent FILLON
-->
<?php
    // Démarrage de la session utilisateur
    session_start();
    $session_login = (isset($_GET['login'])) ? htmlentities($_GET['login']) : NULL;
    if ( $session_login ) {
        $_SESSION['login'] = $session_login;
    }
    $session_admin = (isset($_GET['admin'])) ? htmlentities($_GET['admin']) : NULL;
    if ( $session_admin ) {
        $_SESSION['admin'] = $session_admin;
    }
    $page = (isset($_GET['page'])) ? htmlentities($_GET['page']) : NULL;
?>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Site de pronostiques">
        <meta name="author" content="Passe Valentin, Fillon Vincent, Pacheco Mélanie, Lastennet Loïc">
        <link rel="shortcut icon" href="images/favicon.ico">

        <title>Pronostiques</title>

        <!-- Local Bootstrap core CSS -->
        <link href="bootstrap-3.3.0/dist/css/bootstrap.css" rel="stylesheet">
        
        <!-- CDM Bootstrap core CSS
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
        -->
        
        <!-- Custom styles for this template -->
        <link href="style/style.css" rel="stylesheet">
    </head>

    <body>

        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.php?page=accueil.tpl"><img id="logo-navbar" src="images/logo/Logo.png"></a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                    <?php 
                        $active_pronostiques = "";
                        $active_compte = "";
                        $active_admin = "";
                        $active_accueil = "";
                        if ( $page ) {
                            switch ( $page ) {
                                case "pronostiques.tpl":
                                    $active_pronostiques = 'class="active"';
                                    break;
                                case "compte.tpl":
                                    $active_compte = 'class="active"';
                                    break;
                                case "admin.tpl":
                                    $active_admin = 'class="active"';
                                    break;
                                default:
                                    $active_accueil = 'class="active"';
                                    break;
                            }
                        }
                        else {
                            $active_accueil = 'class="active"';
                        }
                    ?>
                        <li <?php echo $active_accueil ?>><a href="index.php?page=accueil.tpl">Classements</a></li>
                    <?php if ( isset($_SESSION['login']) ) { ?>
                        <li <?php echo $active_pronostiques ?>><a href="index.php?page=pronostiques.tpl&login=<?php echo $_SESSION['login']?>">Pronostiques</a></li>
                        <li <?php echo $active_compte ?>><a href="index.php?page=compte.tpl&login=<?php echo $_SESSION['login']?>">Mon compte</a></li>
                    <?php } 
                          if ( isset($_SESSION['admin']) ) { ?>
                        <li <?php echo $active_admin ?>><a href="index.php?page=admin.tpl&login=<?php echo $_SESSION['login']?>">Gestion administrateur</a></li>
                          <?php } ?>
                    </ul>
                <?php if ( isset($_SESSION['login']) ) { ?>
                    <a id="deconnexion_button" href="index.php?page=deconnexion.tpl"><button type="button" class="btn navbar-btn navbar-right">Déconnexion</button></a>
                <?php } else { ?>
                    <a id="connexion_button" href="index.php?page=connexion.tpl"><button type="button" class="btn navbar-btn navbar-right">Connexion</button></a>
                <?php } ?>
                </div>
            </div>
        </div>

        <div class="container">
            <div id="contenu-body">
                <!-- Contenu importé depuis les differentes pages : "nom_page".tpl -->
                <?php
                    if ( $page ) {
                        if ( isset($_SESSION['login']) ) {
                            include('templates/' . $page);
                        }
                        else {
                            if ( $page == "accueil.tpl" || $page == "inscription.tpl" ) {
                                include('templates/' . $page);
                            }
                            else {
                                include('templates/connexion.tpl');
                            }
                        }
                    }
                    else {
                        include('templates/accueil.tpl');
                    }
                ?>
            </div>
        </div>


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        
        <!-- Local Bootstrap core JavaScript -->
        <script src="bootstrap-3.3.0/dist/js/bootstrap.min.js"></script>
        
        <!-- CDN Bootstrap core JavaScript :
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> 
        -->
        
        <!-- JavaScript du projet -->
        <script src="js/indexJS.js"></script>
    </body>
</html>