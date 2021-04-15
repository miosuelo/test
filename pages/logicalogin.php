<?php
  
  include('../conex/conect.php');
  include('../clases/usuario.php');
session_start();
  $con = new Conect();
  $usu = $_POST["login"];
  $passw = $_POST["password"];
  $result = $con->query("select u_id, u_contrasena, u_nombre, u_jerarquia from usuario where u_id='$usu' and u_contrasena='$passw'" /*"select * from usuario"*/);

if(!empty($result)){


  $usuario = new Usuario($result['u_id'],$result['u_contrasena'],$result['u_nombre'],$result['u_jerarquia']);
  $_SESSION["usuario"]= serialize($usuario);
  header("location: principal.php");
}else{
  //tratar el error [variables de session ¬¬]

  ?>
    
   <?php 

  $_SESSION["error"] = "Usuario y/o Contraseña incorrecta";
   header("location: login.php");

}
  ?>