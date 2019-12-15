<?php

abstract class Observer {
    abstract public function update(Subject $subject);
}

class Subject {
    public $state;
    private $observers = [];

    public function add(Observer $obs) {
        $this->observers[] = $obs;
        echo 'Subject: Someone subscribed<br>';
    }
    public function remove(Observer $obs) {
        unset($this->observers[array_search($obs, $this->observers)]);
        echo 'Subject: Someone unsubscribed<br>';
    }
    public function notify() {
        echo 'Subject: notifying...<br>';
        foreach($this->observers as $observer) {
            $observer->update($this);
        }
    }
    public function doSomething() {
        echo 'Subject: Do something...<br>';
        $this->state = rand(0, 5);
        echo 'Subject: State changed to ' . $this->state . '<br>';
        $this->notify();
    }
}

class Observer1 extends Observer {
    public function update($subject) {
        if($subject->state == 3) {
            echo 'Observer1 reacts on 3<br>';
        }
    }
}

class Observer2 extends Observer {
    public function update($subject) {
        if($subject->state == 0 || $subject->state >= 3) {
            echo 'Observer2 reacts on 0, 3 or greater than 3<br>';
        }
    }
}

$subject = new Subject;

$o1 = new Observer1;
$subject->add($o1);
$o2 = new Observer2;
$subject->add($o2);

$subject->doSomething();
$subject->doSomething();

$subject->remove($o2);
$subject->doSomething();