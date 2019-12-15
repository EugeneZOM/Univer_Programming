<?php
// Chain of Responsibility

interface IHandler {
    public function setNext(Handler $handler);
    public function handle($request);
}

class Handler implements IHandler {
    private $nextHandler;

    public function setNext(Handler $handler) {
        $this->nextHandler = $handler;
        return $handler;
    }
    public function handle($request) {
        if($this->nextHandler) {
            return $this->nextHandler->handle($request);
        }
        return null;
    }
}

class MonkeyHandler extends Handler {
    public function handle($request) {
        if(strtolower($request) == 'banana') return "Monkey: I'll eat the " . $request . '<br>';
        else return parent::handle($request);
    }
}
class DogHandler extends Handler {
    public function handle($request) {
        if(strtolower($request) == 'meat') return "Dog: I'll eat the " . $request . '<br>';
        else return parent::handle($request);    
    }
}

$monkey = new MonkeyHandler();
$dog = new DogHandler();

$monkey->setNext($dog);


$handler = $monkey;
foreach (["Nut", "Banana", "Cup of coffee", "Meat"] as $food) {
    $result = $handler->handle($food);
    if ($result) {
        echo "  " . $result;
    } else {
        echo "  " . $food . " was left untouched.<br>";
    }
}