<?php
include '../config/config_connexion.php';
header('Content-Type: text/xml; charset=utf-8');
echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
echo "<list>";

$championnat = (isset($_POST["championnat"])) ? htmlentities($_POST["championnat"]) : NULL;

if ($championnat) {
    mysql_connect($hote, $login, $m_d_p);
    mysql_select_db($bdd);
    
    mysql_query("SET NAMES 'utf8'");
    
    $noms_champs[] = array();
    $query = mysql_query("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='" . $championnat . "'");
    while ($back = mysql_fetch_array($query)) {
       $noms_champs[] = $back["COLUMN_NAME"];
    }
    
    $query2 = mysql_query("SELECT * FROM " . $championnat);
    while ($back = mysql_fetch_assoc($query2)) {
        $element = array();
        for($i = 0; $i < count($noms_champs); $i += 1){
            $element[] = $noms_champs[$i]."=\"" . $back[$noms_champs[$i]] . "\" ";
        }
        $itemContent = "";
        for($j = 0; $j < count($element); $j += 1){
            $itemContent = $itemContent . $element[$j];
        }
        echo "<item " . $itemContent . "/>";
    }
}

echo "</list>";

?>