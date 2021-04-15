<?php

include("../conex/conect.php");
$con = new Conect();
$query = "SELECT * from semiremolque";
$result = mysqli_query($con->conchet(), $query);
if(!$result) {
    die('Fallo '. mysqli_error($con));
}

$json = array();
while($row = mysqli_fetch_array($result)) {
    $json[] = array(
        'id' => $row['s_id'],
        'tipo' => $row['s_tipo'],
        'patente' => $row['s_patente']


    );
}
$jsonstring = json_encode($json);
echo $jsonstring;
?>