<!DOCTYPE html>
<html>

<head>
    <title>Login </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="css/main.css">

    <style>
        .container {
            margin-top: 40px
        }
    </style>
</head>
<body>

<div class="container" >
    <img class="rounded mx-auto d-block" src="../imagenes/logo rojas definitivo.bmp" width="60%">
</div>
<div class="container">
    <div class="row">
        <?php /*session_start();
        if (isset($_SESSION["error"])) {

            ?>
            <div class="alert alert-danger fw-bold text-center col" role="alert">
                <?php echo $_SESSION["error"] ?>
            </div>
            <?php

            unset($_SESSION["error"]);


        } */?>
        <form class="form-horizontal" action="logicalogin.php" method="post">
            <div class="form-group">
                <label for="userid" class="col-sm-2 control-label mt-1"><b>Usuario</b></label>
                <div class="col-sm-10">
                    <input type="int" class="form-control" name="login" id="inputID" placeholder="Usuario" >

                </div>



            </div>
            <div class="form-group">
                <label for="inputpass" class="col-sm-2 control-label mt-1"><b>Contraseña</b></label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" name="password" id="inputPass" placeholder="Contraseña"
                           required>
                </div>
            </div>
            <div class="form-group">
                <div class="text-center col-sm-10 mt-4">
                    <button type="submit" class="btn btn-primary btn-lg" id="btnLogin">Entrar</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
        integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
        integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
        crossorigin="anonymous"></script>
<script src="js/loginvalidatepapu.js"></script>
</body>

</html>