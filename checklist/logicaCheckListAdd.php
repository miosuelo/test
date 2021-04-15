<?php
session_start();
$_SESSION["sucess"] = 0;
include "../conex/conect.php";
$con = new Conect();
$r_id = 0;
$respuestas = array();
$preguntas = array();

$supervisor = $_POST["supervisor"];
$vehiculo = $_POST["vehiculo"];
$semirr = $_POST["semirremolque"];
$formulario = $con->select("select IFNULL(max(f_id)+1,1) AS id from formulario")->fetch_assoc();
$sql = "";

foreach ($_POST as $key => $value) {
    if (strpos($key, 'pregunta') === 0) {
        array_push($preguntas, $value);

    }
    if (strpos($key, 'respuesta') === 0) {
        array_push($respuestas, $value);
    }
    if (strpos($key, 'observacion') === 0) {
        $idRespuesta = $con->select("select max(r_id)+1 as id from respuesta")->fetch_assoc();
        $r_id = $idRespuesta["id"];
        $con->select("INSERT INTO respuesta (r_id, r_respuesta) VALUES ($r_id, '$value')");
        array_push($respuestas, $r_id);

    }
}
date_default_timezone_set("America/Santiago");
$new_date = date('Y-m-d');
echo $formulario["id"];
$con->select("INSERT INTO formulario ( f_id,f_date, f_estado, f_tipo, u_id,s_id) VALUES (".$formulario["id"].",'$new_date', 1, '1', '$supervisor', $semirr)");

$con->select("INSERT INTO s_has_v (semiremolque_s_id, vehiculo_v_id) VALUES($semirr, $vehiculo) ");
//respuestas for

for ($i = 0; $i < count($preguntas); $i++) {

    $con->select("INSERT INTO formulario_has_pregunta (formulario_f_id, preguntas_p_id, respuesta_r_id) VALUES (".$formulario["id"].", $preguntas[$i], $respuestas[$i])");
}

$_SESSION["success"] = 1;
header("Location: ../pages/principal.php");



