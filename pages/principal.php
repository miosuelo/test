<!DOCTYPE html>
<html>
<head>
    <title>principal </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="css/main.css">

    <link rel="stylesheet" href="css/all.css">
</head>
<body>
<?php


require('../sesion/sesiones.php');


require('header.php');


if (isset($_SESSION["success"])) {
    if ($_SESSION["success"] == 1) {
        ?>
        <div class="alert alert-success" role="alert">
            Formulario Creado con exito!!
        </div>
        <?php

        $_SESSION["success"] = 0;

    }
} ?>

<div class="container-fluid">
    <a href="logout.php" type="button" class="float-end icon-container btn text-center  btn-danger icon btn-circle btn-lg"> <i class="fas fa-align-center fa-sign-out-alt"></i> </a>
    <img class="rounded mx-auto d-block mt-4 red" src="../imagenes/logo rojas definitivo.bmp" width="70%"></div>
<div class="d-grid gap-3 col-6 mx-auto mt-5">


</div>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
        integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
        integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
        crossorigin="anonymous"></script>

</body>
</html>