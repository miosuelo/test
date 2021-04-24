<?php

include("../conex/conect.php");
$con = new Conect();
$query = "SELECT * from usuario";
$result = mysqli_query($con->conchet(), $query);
if (!$result) {
    die('Fallo ' . mysqli_error($con));
}
$checkBox = "";
$json = [];
$val[] = array();
$contador = 0;
while ($row = mysqli_fetch_array($result)) {

    if ($row["u_estado"] == 1) {
        $checkBox = "<div  class=' form-check form-switch form-switch-md'>
  <input type='checkbox' class=' mx-auto form-check-input' id='inpCheck$contador' onclick='changeState(this,$contador)' checked >
    
</div>";
    } else {
        $checkBox = "<div  class=' form-check form-switch form-switch-md'>
  <input type='checkbox' class=' mx-auto form-check-input' onclick='changeState(this,$contador)' id='inpCheck$contador' >
 
</div>";
    }


    array_push($json, array(
        "<input id='inpId$contador' class='rutTable form-control' disabled value = '" . rut($row['u_id']) . "'>",
        "<input id='inpNombre$contador' class='form-control'  value = '" . $row['u_nombre'] . "'>",
        "<input id='inpContrasena$contador' class='form-control'  value = '" . $row['u_contrasena'] . "'>",
        "<input id ='inpJerarquia$contador' class='form-control'  value = '" . $row['u_jerarquia'] . "'>",
        "<div class='text-center'><button class=' editing btn btn-warning ' numeroFila='" . "${contador}" . "' type='' onclick='clickEditar(this)'  >
  Editar </button> </div>",
        $checkBox

    ));
    $contador++;

}
function rut($rut_param)
{
    if($rut_param >2){
    $incluyeDigitoVerificador = true;
    //validaciones varias
    //....
    //Eliminamos espacios al principio y final
    $originalRut = trim($rut_param);

    //En caso de existir, eliminamos ceros ("0") a la izquierda
    $originalRut = ltrim($originalRut, '0');

    $input		= str_split($originalRut);
    $cleanedRut	= '';

    foreach ($input as $key => $chr) {

        //Digito Verificador
        if ((($key + 1) == count($input)) && ($incluyeDigitoVerificador)){
            if (is_numeric($chr) || ($chr == 'k') || ($chr == 'K'))
                $cleanedRut .= '-'.strtoupper($chr);
            else
                return false;
        }

        //Números del RUT
        elseif (is_numeric($chr))
            $cleanedRut .= $chr;
    }

    if (strlen($cleanedRut) < 3)
        return false;

    return $cleanedRut;
    }else{
        return $rut_param;
    }
}


echo json_encode($json)

?>
