<?php




include("../conex/conect.php");
$con = new Conect();
$tipo = $_POST['tipo'];
$patente = $_POST['patente'];


$query = "INSERT into semiremolque(s_tipo, s_patente) VALUES ('$tipo', '$patente')";
$result = mysqli_query($con->conchet(), $query);

if (!$result) {
    die('Fallo la Inserción.');
}

echo "Vehiculo " . $patente . " Agregado correctamente";


