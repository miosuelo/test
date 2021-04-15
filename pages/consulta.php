<?php
/*
// Procesamos en envio desde el input via POST
$palabraclave = strval($_POST['busqueda']);
$busqueda = "{$palabraclave}%";
// Realizamos la conexión MySQLi
$conexion =new mysqli('localhost', 'root', '' , 'itrojas');
// Preparamos la consulta para realizar la busqueda del criterio
$consultaDB = $conexion->prepare("SELECT * FROM s_patente WHERE semiremolque LIKE ?");
$consultaDB->bind_param("s",$busqueda);
$consultaDB->execute();
$resultado = $consultaDB->get_result();
// Condicional para tratar a los resultados encontrados
if ($resultado->num_rows > 0) {
    while($registros = $resultado->fetch_assoc()) {
        // Llamando a la columna Pais_Nombre
        $ResultadoPais[] = $registros["s_patente"];
    }
    echo json_encode($ResultadoPais);
}
// Cerramos la conexión con el servidor
$consultaDB->close();*/
include("../conex/conect.php");
$value = $_POST['input'];
$con = new Conect();
$query = "SELECT s_id,s_patente FROM semiremolque WHERE s_patente LIKE '$value' ";
$result = mysqli_query($con->conchet(), $query);

if (!$result) {
    die('Fallo' . $value);
}

echo $result['s_patente'];

?>
