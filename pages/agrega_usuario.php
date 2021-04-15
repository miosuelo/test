<!DOCTYPE html>
<html>
<head>
    <title> Agregar Usuario</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="css/main.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
<?php
session_start();

require("../clases/usuario.php");

require("headeradmin.php");

$u = unserialize($_SESSION['usuario']);

if ($u->getJerarquia() > 2) {


    ?>
    <div class="container-fluid">

        <form action="" method="POST" id="AgregarU">
            <table class="table table-primary table-responsive table-bordered mt-2">
                <thead class="table-dark">
                <tr>
                    <th scope="col">Rut</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Contraseña</th>
                    <th scope="col">Jerarquia</th>

                </tr>
                </thead>
                <tbody>
                <tr>

                    <td><input type="text" class="form-control" id="Rut"  maxlength="11" required></td>
                    <td><input type="text" pattern="[a-zA-Z ]{2,25}" class="form-control" id="Nombre" required></td>
                    <td><input type="text" class="form-control" id="Contrasena" required></td>
                    <td><select class="form-select mx-auto col "   name="patente" id="Jerarquia">
                            <option value="1">Usuario</option>
                            <option value="3">Administrador</option>



                        </select>
                    </td>

                </tr>
                </tbody>
            </table>
            <button type="submit" class="btn bg-success text-white mb-4 mt-0  " id="agregar">Agregar</button>
        </form>


        <table class="table table-striped table-responsive table-bordered">
            <thead class="table-dark">
            <tr>
                <th scope="col">Rut</th>
                <th scope="col">Nombre</th>
                <th scope="col">Contraseña</th>
                <th scope="col">Jerarquia</th>
                <th scope="col">Editar</th>

            </tr>
            </thead>
            <tbody id="cuerpin">


            </tbody>
        </table>

    </div>
<?php } else {

    ?> <H1 class="text text-center mt-5">NO PUEDES ESTAR ACA</H1>
    <div align="center" class="mt-4 mb-4">
        <img src="../imagenes/problemas_tecnicos.jpg" alt="">
    </div>
    <h2 class="text text-center">Habla con un administrador para conseguir permisos</h2>
    <?php


} ?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
        integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
        integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
        crossorigin="anonymous"></script>
<script src="js/main.js"></script>
</body>
</html>


