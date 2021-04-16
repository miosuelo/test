<?php
session_start();
include("../conex/conect.php");
include("../clases/usuario.php");
$con = new Conect();
$rut = $_POST['rut'];
$nombre = $_POST['nombre'];
$contrasena = $_POST['contrasena'];
$jerarquia = $_POST['jerarquia'];
$usuario = unserialize($_SESSION["usuario"]);
$uid = $usuario->getRut();
date_default_timezone_set("America/Santiago");
$new_date = date('Y-m-d');
$query = "INSERT into usuario(u_id, u_nombre, u_contrasena, u_jerarquia, u_admin, u_timestamp) VALUES ('$rut', '$nombre','$contrasena','$jerarquia','$uid','$new_date')";
$result = mysqli_query($con->conchet(), $query);

if (!$result) {
    die('Fallo la Inserción.');
}

echo "Usuario " . $nombre . " Agregado correctamente";

?>

