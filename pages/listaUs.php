<?php

include("../conex/conect.php");
$con = new Conect();
$query = "SELECT * from usuario";
$result = mysqli_query($con->conchet(), $query);
if(!$result) {
    die('Fallo '. mysqli_error($con));
}

$json = array();
while($row = mysqli_fetch_array($result)) {
    $json[] = array(
        'idd' => $row['u_id'],
        'namem' => $row['u_nombre'],
        'pass' => $row['u_contrasena'],
        'jer' => $row['u_jerarquia']

    );
}
$jsonstring = json_encode($json);
echo $jsonstring;
?>


