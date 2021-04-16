<!DOCTYPE html>
<html>
<head>
    <title>Buscar</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="css/main.css">

</head>
<body background="">
<?php
session_start();

//include("../conex/conect.php");


include('../pages/header.php');
$cone = new Conect();
date_default_timezone_set('UTC');

$pat = $_POST["patente"];

$busqueda = $cone->select("select a_articulo, f_id,u_nombre,f_date,s_patente,s_tipo,v_tipo,v_patente
from formulario f, semiremolque s, usuario u, pregunta p, formulario_has_pregunta fp, articulo a, vehiculo V, s_has_v shv
where f.f_id = shv.formulario_f_id and s_patente='$pat' and shv.semiremolque_s_id = s.s_id and shv.vehiculo_v_id = v.v_id
  and fp.preguntas_p_id = p.p_id and fp.formulario_f_id = f.f_id and p.a_id = a.a_id
  and u.u_id=f.u_id  GROUP BY f_id");
?>

<div class="container-fluid">

    <div class="alert alert-danger d-none" id="errorDate" role="alert">

    </div>
    <div class="row">
        <div class="col-sm input-group   my-3 mx-sm-1">
            <span class="input-group-text" id="basic-addon1">Desde</span>
            <input class="form-control mx-auto desdeHasta " VALUE="" type="date"
                   name="fecha1" id="inpDesde">

        </div>
        <div class="col-sm input-group  my-3 mx-sm-1">
            <span class="input-group-text" id="basic-addon1">Hasta</span>
            <input class="form-control mx-auto col desdeHasta"   VALUE="" type="date"
                   name="fecha" id="inpHasta">
        </div>
    </div>
    <div id="content" class="align-items-center my-2 justify-content-center row">
        <?php
        $contador = 0;
        while (($res = mysqli_fetch_assoc($busqueda)) != null) {
           $preguntas = $cone->select("select u_nombre,p_titulo, r_respuesta from formulario f, formulario_has_pregunta fp, pregunta p , respuesta r, usuario u 
            where u.u_id=f.u_id and f.f_id = fp.formulario_f_id and  p.p_id = fp.preguntas_p_id and r.r_id = fp.respuesta_r_id and f_id=" . $res["f_id"] . ";");
            ?>
            <div class="card shadow  text-dark bg-light col-sm-4  mx-3 my-2">
                <div class="card-header m-0">
                    <h5 class="card-title"><?php echo "Check List de " . $res['a_articulo'] ?></h5>
                    <input type="hidden" id="tipoEnca" value="<?php echo $res['a_articulo'] ?>">
                </div>
                <div class="card-body">
                    <p class="card-text">REALIZADO POR: <?php echo $res['u_nombre'] ?>.</p>
                    <p class="card-text">El DÍA <a class="fecha"> <?php echo $res['f_date']?></a>.</p>
                    <p class="card-text">PATENTE: <?php echo $res["s_patente"] ?> </p>
                    <p class="card-text">TIPO: <?php echo $res["s_tipo"] ?></p>
                    <p class="card-text">CON EL VEHICULO
                        PATENTE: <?php echo " " . $res["v_patente"] . " DE TIPO: " . $res["v_tipo"] ?></p>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#exampleModal<?php echo $contador ?>">
                        Mostrar
                    </button>
                    <!-- Modal -->
                    <div class="modal  fade" id="exampleModal<?php echo $contador ?>" tabindex="-1"
                         data-bs-backdrop="static" data-bs-keyboard="false"
                         aria-labelledby="exampleModalLabel<?php echo $contador ?>" aria-hidden="true">
                        <div class=" modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
                            <div class="modal-content">
                                <div class="modal-header bg-dark">
                                    <h5 class="modal-title fw-bold text-white "
                                        id="exampleModalLabel"><?php echo "Check List de " . $res['a_articulo'] ?></h5>
                                    <button class="btn btn-info ms-auto"
                                            onclick="gene('exampleBodyModal<?php echo $contador ?>','<?php echo $res['u_nombre'] ?>','<?php echo $res['f_date'] ?>','<?php echo $res["s_patente"] ?>' , ' <?php echo $res["v_patente"] ?>' ,'<?php echo $res['a_articulo'] ?>')"
                                            id="cmd">Generar PDF
                                    </button>
                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body" id="exampleBodyModal<?php echo $contador ?>">
                                    <div class="container-fluid ">
                                        <?php

                                        while (($pregunta = mysqli_fetch_assoc($preguntas)) != null) { ?>


                                            <div class="row border text-center align-items-center justify-content-center rounded py-2  my-2">

                                                <label for="staticEmail"
                                                       class="col-sm-4 mx-auto col-form-label pregunta">     <?php echo $pregunta["p_titulo"] ?> </label>

                                                <div class="col-sm-8 mx-auto">
                                                    <input type="text" class="pregunta form-control" disabled
                                                           value="<?php echo $pregunta["r_respuesta"] ?>">

                                                </div>

                                            </div>

                                            <?php

                                        }
                                        ?>
                                        <div id="especial"></div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <?php
            $contador++;
        } ?>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
        integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
        integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
        crossorigin="anonymous"></script>
<script src="../js/pdfgen.js"></script>
<script src="../pages/js/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.6/jspdf.plugin.autotable.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.5.0-beta4/html2canvas.min.js"></script>


</body>
</html>
