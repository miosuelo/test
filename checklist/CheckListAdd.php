<!DOCTYPE html>

<html>

<head>
    <title>Check List </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="css/main.css">

</head>

<body>
<?php
header("Content-Type: text/html;charset=utf-8");


session_start();
$id = $_POST["a_id"];

include('../pages/header.php');


$usuario = unserialize($_SESSION["usuario"]);
$cone = new Conect();

$camabaja =( $cone->select("SELECT p_id, p_titulo, p_tipo,a_articulo from pregunta p , articulo a where a.a_id = p.a_id and a.a_id = $id order by p_id asc;"));
$titulo = $cone->select("select a_articulo  from articulo where a_id = $id")->fetch_assoc();
$veTipo = $cone->select("select v_id, v_patente from vehiculo");
$veTipo2 = $cone->select("select s_id, s_patente from semiremolque");
$idFormularo = $cone->select("select CASE WHEN (max(f_id)+1) = 0 THEN 1
    ELSE max(f_id)+1
END
    as id 
from formulario;")->fetch_assoc();



?>

<div class="container-fluid mb-2">
    <form method="post" action="logicaCheckListAdd.php">
        <div class="row my-2">
                 <div class="col-sm-4 mx-auto">
                <div class="row">
                    <div class="input-group mb-3">
                    <span class="input-group-text bg-dark text-white" id="basic-addon1">Supervisor:</span>

                    <div class="col-sm-8">
                        <input class="form-control  " name="" readonly
                               value="<?php echo $usuario->getNombre(); ?>">
                        <input class="form-control d-none " name="supervisor" readonly
                               value="<?php echo $usuario->getRut(); ?>">

                    </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 mx-auto">
                <div class="row">
                    <div class="input-group mb-3">
                    <span class="input-group-text bg-dark text-white" id="basic-addon1">Vehiculo:</span>

                    <div class="col-sm-8">
                        <select class="form-select" name="vehiculo">
                            <?php while (($res = mysqli_fetch_assoc($veTipo)) != null) {
                                ?>

                                <option value="<?php echo $res['v_id'] ?> "><?php echo $res['v_patente'] ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 mx-auto">
                <div class="row">
                    <div class="input-group mb-3">
                        <span class="input-group-text bg-dark text-white " id="basic-addon1">SEMIRREMOLQUE:</span>

                    <div class="col-sm-8">
                        <select class="form-select" name="semirremolque">
                            <?php while (($res1 = mysqli_fetch_assoc($veTipo2)) != null) {
                                ?>

                                <option value="<?php echo $res1['s_id'] ?> "><?php echo $res1['s_patente'] ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    </div>
                </div>
            </div>


        </div>
        <table class=" table table-striped table-bordered
                    " style="text-align:center;">
            <thead>
            <tr>

                <th scope="col" class="table-dark" colspan="5">CHECK
                    LIST <?php echo strtoupper($titulo["a_articulo"]) ?></th>


            </tr>
            <tr>
                <?php  $encaezao = $titulo["a_articulo"];
                if($encaezao== 'BATEA') { ?>
                    <th scope="col" colspan="5">VERIFICACIÓN DE PARTES CRITICAS DE SEMIREMOLQUE BATEA PARA EVITAR LA CAIDA DE CAGA / FATIGA
                        DE MATERIALES / DAÑOS ESTRUCTURALES </th>
                <?php } ?>
                <?php if($encaezao == 'CAMA BAJA') { ?>
                    <th scope="col" colspan="5">VERIFICACIÓN DE PARTES CRITICAS DE SEMIREMOLQUE CAMA BAJA PARA
                        RETENER /
                        EVITAR LA CAIDA DE CARGA O PARTE DE SUS ESTRUCTURAS
                    </th>
                <?php } ?>
                <?php if($encaezao == 'ESTIBA') { ?>
                    <th scope="col" colspan="5">VERIFICACIÓN DE PARTES CRITICAS DE SEMIREMOLQUE CAMA BAJA PARA
                        RETENER /
                        EVITAR LA CAIDA DE CARGA O PARTE DE SUS ESTRUCTURAS
                    </th>
                <?php } ?>
                <?php if($encaezao == 'RAMPLAS') { ?>
                    <th scope="col" colspan="5">VERIFICACIÓN DE PARTES CRITICAS DE SEMIREMOLQUE QUE PERMITEN
                        RETENER /
                        EVITAR LA CAIDA DE CARGA O PARTE DE SUS ESTRUCTURAS
                    </th>
                <?php } ?>
                <?php if($encaezao == 'ELEMENTOS AMARRE') { ?>
                    <th scope="col" colspan="5">VERIFICACIÓN DE ELEMENTOS DE AMARRE DE CARGA Y ACCESORIOS ANEXOS (GANCHOS/TRINQUETES)
                    </th>
                <?php } ?>
            </tr>
            <tr>

                <th scope="col">Deficiencias</th>
                <?php

                if ($titulo['a_articulo'] != 'ESTIBA') { ?>
                    <th scope="col">Operativo</th>
                    <th scope="col">No Operativo</th>

                    <?php
                } else {
                    ?>
                    <th scope="col">Operativo</th>
                    <th scope="col">No Operativo</th>

                    <?php
                } ?>
                <th colspan="2" scope="col">N/A</th>
            </tr>
            </thead>
            <tbody>

            <?php
            $contador = 1;

            while (($res = mysqli_fetch_assoc($camabaja)) != null) {

            ?>
            <tr>
                <td scope="col" class="text-start" type=""><?php echo utf8_decode($res['p_titulo']); ?> <input
                            name="pregunta<?php echo $contador ?>" class="d-none" value="<?php echo $res['p_id'] ?>">
                </td>
                <?php if ($res['p_tipo'] == 'M' && $res['a_articulo'] != 'ESTIBA') { ?>
                    <td><input class="form-check-input" type="checkbox" name="respuesta<?php echo $contador ?>" id=""
                               value="7">
                    </td>
                    <td><input class="form-check-input" type="checkbox" name="respuesta<?php echo $contador ?>" id=""
                               value="8">
                    </td>


                    <td><input class="form-check-input" type="checkbox" checked name="respuesta<?php echo $contador ?>"
                               id=""
                               value="1">
                    </td>
                <?php }

                if ($res['p_tipo'] == 'M' && $res['a_articulo'] == 'ESTIBA') { ?>
                    <td><input class="form-check-input" type="checkbox" name="respuesta<?php echo $contador ?>" id=""
                               value="7">
                    </td>
                    <td><input class="form-check-input" type="checkbox" name="respuesta<?php echo $contador ?>" id=""
                               value="8">
                    </td>

                    <td><input class="form-check-input" type="checkbox" checked name="respuesta<?php echo $contador ?>"
                               id="" value="1">
                    </td>
                    <?php
                }
                ?>


                <?php if ($res['p_tipo'] == 'O') { ?>
                    <td colspan="4"><input type="text" class="form-control" aria-label="Sizing example input"
                                           name="observacion<?php echo $contador ?>"
                                           aria-describedby="inputGroup-sizing-default"></td>
                <?php }
                $contador++;
                } ?>

            </tr>
            </tbody>
        </table>
        <div class="row">
            <div class=" float-end">
                <button type="submit" class="btn btn-primary btn-lg">Enviar</button>
            </div>
        </div>
        <?php
        //}
        ?>
    </form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
        integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
        integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
        crossorigin="anonymous"></script>
<script>
    $("input:checkbox").on('click', function () {

        var $box = $(this);
        if ($box.is(":checked")) {

            var group = "input:checkbox[name='" + $box.attr("name") + "']";

            $(group).prop("checked", false);
            $box.prop("checked", true);
        } else {
            $box.prop("checked", true);
        }
    });
</script>


</body>


</html>