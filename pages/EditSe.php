<?php


include("../conex/conect.php");
$con = new Conect();
$sid = $_POST['sid'];
$spatente = $_POST['spat'];
$stipo = $_POST['stip'];

$query = "UPDATE semiremolque SET s_tipo = '$stipo', s_patente = '$spatente' WHERE s_id = '$sid';";
$result = mysqli_query($con->conchet(), $query);

if (!$result) {
    die('Fallo la Edición.');
}

echo "Vehiculo Editado correctamente ";


