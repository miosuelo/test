<?php

include("../conex/conect.php");
$con = new Conect();
$query = "SELECT * from vehiculo";
$result = mysqli_query($con->conchet(), $query);
if(!$result) {
    die('Fallo '. mysqli_error($con));
}

$json = array();
$contador = 0;
while($row = mysqli_fetch_array($result)) {
    if ($row["v_estado"] == 1) {
        $checkBox = "<div  class=' form-check form-switch form-switch-md'>
  <input type='checkbox' class=' mx-auto form-check-input' id='inpCheck$contador' onclick='changeState(this,$contador)' checked >
    
</div>";
    } else {
        $checkBox = "<div  class=' form-check form-switch form-switch-md'>
  <input type='checkbox' class=' mx-auto form-check-input' onclick='changeState(this,$contador)' id='inpCheck$contador' >
 
</div>";
    }


    array_push($json, array(
        "<input id='inpId$contador' class='form-control' disabled value = '" . $row['v_id']. "'>",
        "<input id='inpTipo$contador' class='form-control'  value = '" . $row['v_tipo'] . "'>",
        "<input id='inpPatente$contador' class='form-control'  value = '" . $row['v_patente'] . "'>",
        "<div class='text-center'><button class=' editing btn btn-warning ' numeroFila='" . "${contador}" . "' type='' onclick='clickEditar(this)'  >
  Editar </button> </div>",
        $checkBox

    ));
    $contador++;
}
$jsonstring = json_encode($json);
echo $jsonstring;
?>