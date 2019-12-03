<?php

class Prototype {
    public $component;
    public $component2;

    public function __clone() {
        $this->component = clone $this->component;

        $this->component2 = clone $this->component2;
        $this->component2->prototype = $this;
    }
}

class SomeClass {
    public $prototype;

    public function __construct($prototype) {
        $this->prototype = $prototype;
    }
}

$p1 = new Prototype();
$p1->component = new DateTime();
$p1->component2 = new SomeClass($p1);

$p2 = clone $p1;

if($p1->component === $p2->component) {
    echo 'Component has not been cloned<br>';
} else {
    echo 'Component has been cloned<br>';
}
if($p1->component2 === $p2->component2) {
    echo 'Component2 has not been cloned<br>';
} else {
    echo 'Component2 has been cloned<br>';
}
if($p1->component2->prototype === $p2->component2->prototype) {
    echo 'Component with back reference is linked with original object<br>';
} else {
    echo 'Component with back reference is linked to the clone<br>';
}

