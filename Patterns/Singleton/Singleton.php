<?php

class Singleton {

    public $data = "Text data";
    private static $instance = NULL;

    private function __construct() {}

    public static function getInstance() {
        if( self::$instance === NULL )
            self::$instance = new self();

        return self::$instance;
    }

    public function dump() {
        var_dump($this);
    }

}

$obj = Singleton::getInstance();
$obj->dump();