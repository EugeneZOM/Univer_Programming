<?php

// ----------- Interfaces -----------
interface IHouseBuilder {
    function buildRooms($amount = 1);
    function buildDoors($amount = 1);
    function buildWindows($amount = 1);
    function buildRoof();
    function buildGarage();
    function getResult();
    function reset();
}

interface Director {
    function changeBuilder($builder);
    function make();
}

// -------- Abstract classes --------
abstract class HouseBuilder implements IHouseBuilder {
    protected $result = '';

    public function getResult() {
        echo "<p>Built:</p>";
        echo $this->result;
    }
    public function reset() {
        $this->result = '';
    }
}

abstract class HouseDirector implements Director {
    protected $builder;

    public function __construct($builder) {
        $this->builder = $builder;
    }
    public function changeBuilder($builder) {
        $this->builder = $builder;
    }

    abstract public function make();
}

// ------------ Builders ------------
class WoodenHouseBuilder extends HouseBuilder {
    public function buildRooms($amount = 1) {
        $this->result .= "<p>- {$amount} wooden wall".(($amount > 1)?'s':'')."</p>";
    }
    public function buildDoors($amount = 1) {
        $this->result .= "<p>- {$amount} wooden door".(($amount > 1)?'s':'')."</p>";
    }
    public function buildWindows($amount = 1) {
        $this->result .= "<p>- {$amount} wooden window".(($amount > 1)?'s':'')."</p>";
    }
    public function buildRoof() {
        $this->result .= "<p>- Wooden roof</p>";
    }
    public function buildGarage() {
        $this->result .= "<p>- Wooden garade</p>";
    }
}

class BeautifulHouseBuilder extends HouseBuilder {
    public function buildRooms($amount = 1) {
        $this->result .= "<p>- {$amount} beautiful wall".(($amount > 1)?'s':'')."</p>";
    }
    public function buildDoors($amount = 1) {
        $this->result .= "<p>- {$amount} beautiful door".(($amount > 1)?'s':'')."</p>";
    }
    public function buildWindows($amount = 1) {
        $this->result .= "<p>- {$amount} beautiful window".(($amount > 1)?'s':'')."</p>";
    }
    public function buildRoof() {
        $this->result .= "<p>- Beautiful roof</p>";
    }
    public function buildGarage() {
        $this->result .= "<p>- Beautiful garade</p>";
    }
}

// ----------- Directors -----------
class SimpleHouseDirector extends HouseDirector {
    public function make() {
        $builder = $this->builder;
        $builder->buildRooms(4);
        $builder->buildRoof();
        $builder->buildWindows(4);
        $builder->buildDoors(4);
    }
}

class BestHouseDirector extends HouseDirector {
    public function make() {
        $builder = $this->builder;
        $builder->buildRooms(8);
        $builder->buildRoof();
        $builder->buildWindows(9);
        $builder->buildDoors(8);
        $builder->buildGarage();
    }
}

class StrangeHouseDirector extends HouseDirector {
    public function make() {
        $builder = $this->builder;
        $builder->buildRooms(16);
        $builder->buildDoors(20);
        $builder->buildGarage();
    }
}



$builder = new WoodenHouseBuilder();
//$builder = new BeautifulHouseBuilder();

$director = new SimpleHouseDirector($builder);
//$director = new BestHouseDirector($builder);
//$director = new StrangeHouseDirector($builder);

$director->make();
$builder->getResult();