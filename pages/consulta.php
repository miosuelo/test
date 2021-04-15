<?php

include("../conex/conect.php");

$con = new Conect();
$query = "SELECT s_patente FROM semiremolque";
$result = $con->select($query);

if (!$result) {
    die('Fallo' . "busqueda");
}
$array = [];

while ($var = $result->fetch_array()){
   array_push($array, $var["s_patente"]);
}
echo json_encode($array)

?>
