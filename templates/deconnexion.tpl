<?php
    // Arrêt de la session utilisateur
    session_unset();
    session_destroy();
    header('location: index.php?page=accueil.tpl');
?>