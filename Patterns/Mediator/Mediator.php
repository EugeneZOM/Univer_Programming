<?php

interface IMediator {
    public function notify($sender, $event);
}

class Mediator implements IMediator {
    private $c1;
    private $c2;

    public function __construct(Component1 $c1, Component2 $c2 ) {
        $this->c1 = $c1;
        $this->c1->setMediator($this);
        $this->c2 = $c2;
        $this->c2->setMediator($this);
    }
    public function notify($sender, $event) {
        if($event == 'A') {
            echo 'Mediator reacts on A:<br>';
            echo ' - ';
            $this->c2->doC();
        }
        if($event == 'D') {
            echo 'Mediator reacts on D:<br>';
            echo ' - ';
            $this->c1->doB();
            echo ' - ';
            $this->c2->doC();
        }
    }
}

class Component {
    protected $mediator;
    public function __construct(Mediator $m = null) {
        $this->mediator = $m;
    }
    public function setMediator(Mediator $m) {
        $this->mediator = $m;
    }
}

class Component1 extends Component {
    public function doA() {
        echo 'Component1 does A<br>';
        $this->mediator->notify($this, 'A');
    }
    public function doB() {
        echo 'Component1 does B<br>';
        $this->mediator->notify($this, 'B');
    }
}
class Component2 extends Component {
    public function doC() {
        echo 'Component2 does C<br>';
        $this->mediator->notify($this, 'C');
    }
    public function doD() {
        echo 'Component2 does D<br>';
        $this->mediator->notify($this, 'D');
    }
}

$c1 = new Component1;
$c2 = new Component2;
$mediator = new Mediator($c1, $c2);
$c1->doA();
echo '<br>';
$c2->doD();