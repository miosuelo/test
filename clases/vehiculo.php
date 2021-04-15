<?php

class vehiculo
{
private $vId;
private $vTipo;
private $vPatente;


public function __construct($vId, $vTipo, $vPatente)
    {
        $this->vId = $vId;
        $this->vTipo = $vTipo;
        $this->vPatente = $vPatente;
    }

/**
 * Get the value of vId
 */ 
public function getVId()
{
return $this->vId;
}

/**
 * Set the value of vId
 *
 * @return  self
 */ 
public function setVId($vId)
{
$this->vId = $vId;

return $this;
}

/**
 * Get the value of vTipo
 */ 
public function getVTipo()
{
return $this->vTipo;
}

/**
 * Set the value of vTipo
 *
 * @return  self
 */ 
public function setVTipo($vTipo)
{
$this->vTipo = $vTipo;

return $this;
}

/**
 * Get the value of vPatente
 */ 
public function getVPatente()
{
return $this->vPatente;
}

/**
 * Set the value of vPatente
 *
 * @return  self
 */ 
public function setVPatente($vPatente)
{
$this->vPatente = $vPatente;

return $this;
}
    }

    ?>