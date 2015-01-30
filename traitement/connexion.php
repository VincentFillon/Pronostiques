<?php
include '../config/config_connexion.php';
header('Content-Type: text/xml; charset=utf-8');
echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
echo "<list>";

$login_test = (isset($_POST["login"])) ? htmlentities($_POST["login"]) : NULL;
$mdp = (isset($_POST["mdp"])) ? htmlentities($_POST["mdp"]) : NULL;

mysql_connect($hote, $login, $m_d_p);
mysql_select_db($bdd);

mysql_query("SET NAMES 'utf8'");

$query_login = mysql_query("SELECT * FROM utilisateurs WHERE login='" . $login_test . "'");
$nb_query_login =  mysql_num_rows($query_login);

if ( $nb_query_login != 0 ) {
    $mdp_hash = sha1($salt.$mdp);
    $query_mdp = mysql_query("SELECT * FROM utilisateurs WHERE login='" . $login_test . "' AND mdp='" . $mdp_hash . "'");
    $nb_query_mdp =  mysql_num_rows($query_mdp);
    if ( $nb_query_mdp != 0 ) {
        $query_admin = mysql_query("SELECT * FROM utilisateurs WHERE login='" . $login_test . "' AND mdp='" . $mdp_hash . "' AND profil='ADMIN'");
        $nb_query_admin =  mysql_num_rows($query_admin);
        if ( $nb_query_admin != 0 ) {
            echo '<item reponse="ok" login="' . $login_test . '" admin="ADMIN" />';
        }
        else {
            echo '<item reponse="ok" login="' . $login_test . '" />';
        }
    }
    else {
        echo '<item reponse="mdp" />';
    }
}
else {
    echo '<item reponse="login" />';
}

echo "</list>";

?>