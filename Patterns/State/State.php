<<?php

class Context {
    private $state;
    public function __construct(State $state) {
        $this->set($state);
    }
    public function set(State $state) {
        echo 'Context: Change state to ' . get_class($state) . '<br>';
        $this->state = $state;
        $this->state->setContext($this);
    }
    public function request1() {
        $this->state->handle1();
    }
    public function request2() {
        $this->state->handle2();
    }
}

abstract class State {
    protected $context;
    public function setContext(Context $ctx) {
        $this->context = $ctx;
    }
    abstract public function handle1();
    abstract public function handle2();
}

class State1 extends State {
    public function handle1(): void
    {
        echo "State1 handles request1.<br>";
        echo "State1 wants to change the state of the context.<br>";
        $this->context->set(new State2);
    }

    public function handle2(): void
    {
        echo "State1 handles request2.<br>";
    }
}

class State2 extends State
{
    public function handle1(): void
    {
        echo "State2 handles request1.<br>";
    }

    public function handle2(): void
    {
        echo "State2 handles request2.<br>";
        echo "State2 wants to change the state of the context.<br>";
        $this->context->set(new State1);
    }
}

$context = new Context(new State1);
$context->request1();
$context->request1();
$context->request2();
$context->request2();