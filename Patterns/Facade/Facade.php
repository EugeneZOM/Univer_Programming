<?php

class Facade {

    private Subsystem1 $subsystem1;
    private Subsystem2 $subsystem2;
    
    public function __construct(Subsystem1 $ss1 = null, Subsystem2 $ss2 = null) {
        $this->subsystem1 = $ss1?:new Subsystem1();
        $this->subsystem2 = $ss2?:new Subsystem2();
    }

    public function operation() {
        $result = 'Operations 1: <br>';
        $result .= $this->subsystem1->operation1() . '<br>';
        $result .= $this->subsystem2->operation1() . '<br>';
        $result .= 'Operations 2: <br>';
        $result .= $this->subsystem1->operation2() . '<br>';
        $result .= $this->subsystem2->operation2() . '<br>';
        return $result;
    }

}

class Subsystem1 {
    public function operation1() {
        return 'SS1: Operation 1';
    }
    public function operation2() {
        return 'SS1: Operation 2';
    }
}

class Subsystem2 {
    public function operation1() {
        return 'SS2: Operation 1';
    }
    public function operation2() {
        return 'SS2: Operation 2';
    }
}

$f = new Facade();
echo $f->operation();