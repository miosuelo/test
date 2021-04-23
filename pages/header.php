<?php

include('../conex/conect.php');


include('../clases/vehiculo.php');
include('../clases/usuario.php');
$usuarioHeader = unserialize($_SESSION["usuario"]);
$conexionVar = new Conect();
$veTipo = $conexionVar->select("select distinct s_patente as v_tipo from semiremolque");
$a_tipo = $conexionVar->select("select a_id,a_articulo from articulo");

$jerarquia = $usuarioHeader->getJerarquia();
?>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid row">
        <div class=" col-sm-2">
            <img src="../imagenes/60x30).ico" class="d-inline-block align-top">
            <a class="navbar-brand" href="../pages/principal.php">Transportes Rojas</a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
        <div class="collapse  navbar-collapse mx-auto col-sm-10 row" id="navbarSupportedContent">
            <ul class="navbar-nav my-2 mx-auto col-sm-4">
                <li class="nav-item dropdown ">
                    <a class="nav-link dropdown-toggle fw-bold" href="#" id="navbarDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        CheckList
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <?php

                        while (($response = mysqli_fetch_assoc($a_tipo)) != null) {
                            ?>
                            <li>
                                <form action="CheckListAdd.php" method="post">
                                    <button type="submit" name="a_id" value="<?php echo $response["a_id"] ?>"
                                            class="dropdown-item"><?php echo $response["a_articulo"] ?></button>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            </form>
                            </li>
                        <?php } ?>
                    </ul>

                </li>
                <?php if ($jerarquia > 2) { ?>
                    <li class="nav-item   dropdown">
                        <a class="nav-link dropdown-toggle fw-bold" data-bs-toggle="dropdown" href="" id="navbarDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Administracion
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li class="dropdown-item">
                                <button type="button" name="usuarios" class="dropdown-item"
                                        onclick="location.href='../pages/agrega_usuario.php'"> Usuarios
                                </button>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li class="dropdown-item">
                                <button type="button" name="vehiculos" class="dropdown-item"
                                        onclick="location.href='../pages/agrega_vehiculo.php'"> Vehiculos
                                </button>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li class="dropdown-item">
                                <button type="button" name="semirremolque" class="dropdown-item"
                                        onclick="location.href='../pages/agrega_semirremolque.php'"> Semirremolque
                                </button>
                            </li>
                        </ul>

                    </li>
                <?php } ?>
            </ul>
            <form class=" mx-auto  col-sm-8" autocomplete="off" action="../pages/searchpage.php" method="post">
                <div class="row d-flex justify-content-end">

                    <div class="col-sm-6 my-3 mx-sm-1 autocomplete">
                        <input id="buscar" type="text" name="patente" placeholder="Ingrese patente semiremolque" class="form-control">

                    </div>

                    <button type="submit" class=" col-sm-2 my-3 mx-sm-1 btn btn-primary bi bi-search ">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                             class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                        </svg>
                    </button>


            </form>
        </div>
    </div>
</nav>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="js/buscar.js"></script>