<?php

interface Service {
    public function request();
}

class RealService implements Service {
    public function request() {
        echo 'RealService: request<br>';
    }
}

class ProxyService implements Service {
    private $realService;

    public function __construct($realService) {
        $this->realService = $realService;
    }

    public function request() {
        if($this->checkAccess()) {
            $this->realService->request();
            $this->log();
        }
    }

    public function checkAccess() {
        echo 'Proxy: checking access before real request<br>';
        return true;
    }

    public function log() {
        echo 'Proxy: logged<br>';
    }
}

$service = new RealService();
echo '<b>Client:</b> work with real service<br>';
$service->request();

echo '<br>';
echo '<b>Client:</b> with with proxy<br>';
$proxy = new ProxyService($service);
$proxy->request();
