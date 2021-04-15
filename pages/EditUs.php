<?php

include("../conex/conect.php");
$con = new Conect();
$rut = $_POST['erut'];
$nombre = $_POST['enombre'];
$contrasena = $_POST['econtrasena'];
$jerarquia = $_POST['ejerarquia'];

$query = "UPDATE trojas.usuario SET u_nombre = '$nombre', u_contrasena = '$contrasena', u_jerarquia = $jerarquia WHERE u_id = '$rut';";
$result = mysqli_query($con->conchet(), $query);

if (!$result) {
    die('Fallo la Edición.');
}

echo "Usuario Editado correctamente con RUT: ". $rut;


?>