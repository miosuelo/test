<?php

include("../conex/conect.php");
$con = new Conect();
$state = $_POST['state'];
$id = $_POST['id'];
$query = "UPDATE semiremolque SET s_estado = '$state' WHERE s_id = '$id'";
$result = mysqli_query($con->conchet(), $query);

if (!$result) {

    die(mysqli_error($con->conchet()));
}

echo "Estado usuario: $state $id" ;


?>