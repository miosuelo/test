<!DOCTYPE html>
<html>

<head>
    <title> Agregar Vehiculo</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
            crossorigin="anonymous"></script>
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap5.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <link rel="stylesheet" href="css/main.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
<?php
session_start();


require("header.php");
$cone = new Conect();
$u = unserialize($_SESSION['usuario']);
$articulos = $cone->select("select a_articulo  from articulo");
if ($u->getJerarquia() > 2) {


    ?>
    <div class="container-fluid">

        <form action="" method="POST" id="AgregarV">
            <table class="table table-primary table-responsive table-bordered mt-2">
                <thead class="table-dark">
                <tr>

                    <th scope="col">Tipo</th>
                    <th scope="col">Patente</th>
                    <th scope="col"></th>

                </tr>
                </thead>
                <tbody>
                <tr>

                    <td>
                        <select class="form-select" id="Tipo">
                            <?php
                            while (($res = mysqli_fetch_assoc($articulos)) != null) {
                                if ($res["a_articulo"] != "ELEMENTOS AMARRE"){
                                ?>
                                <option value=" <?php echo $res["a_articulo"] ?>">
                                    <?php echo $res["a_articulo"] ?>
                                </option>
                                <?php
                                }
                            }

                            ?>
                        </select>

                    <td><input type="text" class="form-control" id="Patente" required></td>
                    <td class="text-center">
                        <button type="submit" class="btn bg-success text-white " id="agregar">Agregar</button>
                    </td>

                </tr>
                </tbody>
            </table>

        </form>


        <table id="semiTable" class="table table-data table-striped table-responsive table-bordered">
            <thead class="table-dark">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Tipo</th>
                <th scope="col">Patente</th>
                <th scope="col">Editar</th>
                <th scope="col">Estado</th>

            </tr>
            </thead>

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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap5.min.js"></script>


<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script type="text/javascript"
        src="https://cdn.datatables.net/v/bs4-4.1.1/jszip-2.5.0/dt-1.10.24/af-2.3.5/b-1.7.0/b-colvis-1.7.0/b-html5-1.7.0/b-print-1.7.0/cr-1.5.3/date-1.0.3/fc-3.3.2/fh-3.1.8/kt-2.6.1/r-2.2.7/rg-1.1.2/rr-1.2.7/sc-2.0.3/sb-1.0.1/sp-1.2.2/sl-1.3.3/datatables.min.js"></script>

<script src="js/mainSemiremolque.js"></script>
</body>
</html>
