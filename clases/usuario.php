<?php

class Usuario 
{
private $rut;
private $nombre;
private $pass;
private $jerarquia;

public function __construct($rut, $pass, $nombre, $jerarquia)
    {
        $this->rut = $rut;
        $this->nombre = $nombre;
        $this->pass = $pass;
        $this->jerarquia = $jerarquia;
    }

    public function getRut()
    {
        return $this->rut;
    }
    public function setRut()
    {
        return $this->rut;
    }
    public function getNombre()
    {
        return $this->nombre;
    }
    public function setNombre()
    {
        return $this->nombre;
    }
    public function getPass()
    {
        return $this->pass;
    }
    public function setPass()
    {
        return $this->pass;
    }
    public function getJerarquia()
    {
        return $this->jerarquia;
    }
    public function setJerarquia()
    {
        return $this->jerarquia;
    }
}

