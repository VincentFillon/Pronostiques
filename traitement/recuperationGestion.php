<?php
include '../config/config_connexion.php';
header('Content-Type: text/xml; charset=utf-8');
echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
echo "<list>";

$login_test = (isset($_POST["login"])) ? htmlentities($_POST["login"]) : NULL;

mysql_connect($hote, $login, $m_d_p);
mysql_select_db($bdd);

mysql_query("SET NAMES 'utf8'");

$query_mail = mysql_query("SELECT * FROM utilisateurs WHERE login='" . $login_test . "'");

$result = array();

while ($back = mysql_fetch_array($query_mail)) {
   $result[] = $back["mail"];
}

echo "<item mail=\"" . $result[0] . "\">";

echo "</list>";

?>