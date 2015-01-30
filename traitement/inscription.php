<?php
include '../config/config_connexion.php';
header('Content-Type: text/xml; charset=utf-8');
echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
echo "<list>";

$email = (isset($_POST["email"])) ? htmlentities($_POST["email"]) : NULL;
$login_test = (isset($_POST["login"])) ? htmlentities($_POST["login"]) : NULL;
$mdp = (isset($_POST["mdp"])) ? htmlentities($_POST["mdp"]) : NULL;

mysql_connect($hote, $login, $m_d_p);
mysql_select_db($bdd);

mysql_query("SET NAMES 'utf8'");

$query_mail = mysql_query("SELECT * FROM utilisateurs WHERE mail='" . $email . "'");
$nb_query_email =  mysql_num_rows($query_mail);

$query_login = mysql_query("SELECT * FROM utilisateurs WHERE login='" . $login_test . "'");
$nb_query_login =  mysql_num_rows($query_login);

if ( $nb_query_login == 0 && $nb_query_email == 0) {
    $mdp_hash = sha1($salt.$mdp);
    $date = date('y-m-d');
    mysql_query("INSERT INTO utilisateurs (login, mdp, mail, profil) VALUES ('" . $login_test . "', '" . $mdp_hash . "', '" . $email . "', 'Lambda')");
    echo '<item reponse="ok" login="' . $login_test . '" />';
}
if ( $nb_query_email > 0 ) {
    echo '<item reponse="email" />';
}
if ( $nb_query_login > 0 ) {
    echo '<item reponse="login" />';
}

echo "</list>";

?>