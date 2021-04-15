<?php

include("../conex/conect.php");
$con = new Conect();
$query = "SELECT * from vehiculo";
$result = mysqli_query($con->conchet(), $query);
if(!$result) {
    die('Fallo '. mysqli_error($con));
}

$json = array();
while($row = mysqli_fetch_array($result)) {
    $json[] = array(
       'id' => $row['v_id'],
        'tipo' => $row['v_tipo'],
        'patente' => $row['v_patente']


    );
}
$jsonstring = json_encode($json);
echo $jsonstring;
?>