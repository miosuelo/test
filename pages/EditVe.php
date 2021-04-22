<?php


include("../conex/conect.php");
$con = new Conect();
$vid = $_POST['vid'];
$vpatente = $_POST['vpat'];
$vtipo = $_POST['vtip'];

$query = "UPDATE vehiculo SET v_tipo = '$vtipo', v_patente = '$vpatente' WHERE v_id = '$vid';";
$result = mysqli_query($con->conchet(), $query);

if (!$result) {
    die('Fallo la Edición.');
}

echo "Vehiculo Editado correctamente ";


