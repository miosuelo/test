<?php

include("../conex/conect.php");
$con = new Conect();
$rut = $_POST['erut'];
$nombre = $_POST['enombre'];
$contrasena = $_POST['econtrasena'];
$jerarquia = $_POST['ejerarquia'];

$query = "UPDATE usuario SET u_nombre = '$nombre', u_contrasena = '$contrasena', u_jerarquia = $jerarquia WHERE u_id = '$rut';";
$result = mysqli_query($con->conchet(), $query) ;

if (!$result) {

    die(mysqli_error($con->conchet()));
}

echo "Usuario Editado correctamente con RUT: ". $rut;


?>