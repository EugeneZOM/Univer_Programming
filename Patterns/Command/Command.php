<?php

interface Command {
    public function execute();
}

class SimpleCommand implements Command {
    public function execute() {
        echo 'SimpleCommand: print<br>';
    }
}

class Invoker {
    private $onStart;
    private $onEnd;

    public function setOnStart(Command $cmd) {
        $this->onStart = $cmd;
    }
    public function setOnEnd(Command $cmd) {
        $this->onEnd = $cmd;
    }
    public function doSomething() {
        echo 'On start: ';
        $this->onStart->execute();
        echo 'DO something...<br>';
        echo 'On end: ';
        $this->onEnd->execute();
    }
}

$i = new Invoker;
$i->setOnStart(new SimpleCommand);
$i->setOnEnd(new SimpleCommand);
$i->doSomething();