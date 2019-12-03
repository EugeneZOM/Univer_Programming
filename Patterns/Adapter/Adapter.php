<?php

class Hole {
    private $radius;

    public function __construct($radius) {
        $this->radius = $radius;
    }

    public function fits(Round $round) {
        return (($this->radius >= $round->getRadius()) ? 'FIT' : 'NO');
    }
}

class Round {
    private $radius;

    public function __construct($radius) {
        $this->radius = $radius;
    }

    public function getRadius() {
        return $this->radius;
    }
}

class Square {
    private $width;

    public function __construct($width) {
        $this->width = $width;
    }

    public function getWidth() {
        return $this->width;
    }
}

class SquareAdapter extends Round {
    private $square;

    public function __construct(Square $sq) {
        $this->square = $sq;
    }
    public function getRadius() {
        return $this->square->getWidth() * sqrt(2) / 2;
    }
}

$h = new Hole(10);
$r = new Round(10);
echo $h->fits($r).'<br>';

$s = new Square(14);
$a = new SquareAdapter($s);
// echo $h->fits($s).'<br>'; // ERROR: Type conflict
echo $h->fits($a).'<br>';
