<?php

interface Service {
    public function operation();
}

class SomeService implements Service {
    public function operation() {
        return 'Operation';
    }
}

class Decorator implements Service {
    protected $service;

    public function __construct(Service $service) {
        $this->service = $service;
    }

    public function operation() {
        return $this->service->operation();
    }
}

class DecoratorA extends Decorator {
    public function operation() {
        return 'DecoratorA > ' . parent::operation();
    }
}

class DecoratorB extends Decorator {
    public function operation() {
        return 'DecoratorB > ' . parent::operation();
    }
}


$s = new SomeService();
echo $s->operation() . '<br>';
$s = new DecoratorA($s);
echo $s->operation() . '<br>';
$s = new DecoratorB($s);
echo $s->operation() . '<br>';
$s = new DecoratorB($s);
echo $s->operation();

