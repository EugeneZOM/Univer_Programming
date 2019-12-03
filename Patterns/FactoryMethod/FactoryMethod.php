<?php

// ----------- Interfaces -----------
interface Transport {
    function deliver();
}

// -------- Abstract classes --------
abstract class Logistics {
    protected $transport;

    public function planDelivery() {
        $this->transport = $this->createTransport();
        $this->transport->deliver();
    }

    public abstract function createTransport();
}

// ----------- Transports -----------
class Truck implements Transport {
    public function deliver() {
        echo '<p>Truck in delivering</p>';
    }
}

class Ship implements Transport {
    public function deliver() {
        echo '<p>Ship in delivering</p>';
    }
}

class Airplane implements Transport {
    public function deliver() {
        echo '<p>Airplane is delivering</p>';
    }
}

// ------------ Logistic ------------
class RoadLogistic extends Logistics {
    public function createTransport() {
        return new Truck();
    }
}

class SeaLogistic extends Logistics {
    public function createTransport() {
        return new Ship();
    }
}

class AirLogistic extends Logistics {
    public function createTransport() {
        return new Airplane();
    }
}



$logistic = new RoadLogistic();
//$logistic = new SeaLogistic();
//$logistic = new AirLogistic();
$logistic->planDelivery();