<?php

class Game {
    private $particles = [];
    public $movingParticles = [];   

    public function addParticle(array $coords, array $vector, float $speed, string $color, string $sprite) {
        $key = $color.$sprite;

        if(!array_key_exists($key, $this->particles)) {
            echo "no";
            $this->particles[$key] = new Particle($color, $sprite);
        }

        $particle = $this->particles[$key];
        array_push($this->movingParticles, new MovingParticle($particle, $coords, $vector, $speed));
    }
    public function draw($canvas) {}
}

class Particle {
    private $color;
    private $sprite;

    public function __construct($color, $sprite) {
        $this->color = $color;
        $this->sprite = $sprite;
    }
    public function move($coords, $vector, $speed) {}
    public function draw($coords, $canvas) {}
}

class MovingParticle {
    private $particle;  // Particle's static data
    private $coords;
    private $vector;
    private $speed;

    public function __construct($particle, $coords, $vector, $speed) {
        $this->particle = $particle;
        $this->coords = $coords;
        $this->vector = $vector;
        $this->speed = $speed;
    }
    public function move() {}
    public function draw($canvas) {}
}


$game = new Game();
$game->addParticle([0, 0], [1, 0], 5, 'red', 'none');
$game->addParticle([0, 0], [1, 0], 5, 'red', 'none');