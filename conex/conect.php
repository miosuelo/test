<?php


class Conect
{

    private $usuario = "trojas";
    private $contrasena = "trojas";
    private $servidor = "localhost";
    private $basededatos = "trans151_itrojas";
    private $mysqli;

    public function __construct()
    {
        $this->mysqli = new mysqli($this->servidor, $this->usuario, $this->contrasena, $this->basededatos);
    }

    public function query($query)
    {
        $var = $this->mysqli->query($query);
        return $var->fetch_assoc();
    }

    public function select($query)
    {

        if (strpos($query, 'insert') === 1) {
            if ($this->mysqli->query($query) === TRUE) {

            } else {
                die( "Error: " . $query . "<br>" . $this->mysqli->error);
            }
        }else{

            $retorno = $this->mysqli->query($query) or die($this->mysqli->error);

        }

        return $retorno;
    }
    public function conchet(){
        $conex =mysqli_connect($this->servidor,$this->usuario,$this->contrasena,$this->basededatos);
        return $conex;
    }

}