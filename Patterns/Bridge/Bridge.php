<?php

interface Device {
    public function isEnabled();
    public function enable();
    public function disable();
    public function getVolume();
    public function setVolume($volume);
    public function getChannel();
    public function setChannel($channel);
}

class Remote {
    protected $device;

    public function __construct(Device $device) {
        $this->device = $device;
    }

    public function togglePower() {
        if($this->device->isEnabled()) {
            $this->device->disable();
            echo 'Remote: Power OFF<br>';
        } else {
            $this->device->enable();
            echo 'Remote: Power ON<br>';
        }
    }
    public function volumeDown() {
        $this->device->setVolume($this->device->getVolume() - 10);
    }
    public function volumeUp() {
        $this->device->setVolume($this->device->getVolume() + 10);
    }
    public function channelDown() {
        $this->device->setChannel($this->device->getChannel() - 1);
    }
    public function channelUp() {
        $this->device->setChannel($this->device->getChannel() + 1);
    }
}

class AdvancedRemote extends Remote {
    protected $lastVolume;
    protected $muted = false;

    public function mute() {
        if($this->muted) {
            $this->device->setVolume($this->lastVolume);
            $this->muted = false;
        } else {
            $this->lastVolume = $this->device->getVolume();
            $this->device->setVolume(0);
            $this->muted = true;
        }
    }
    public function volumeUp() {
        if($this->muted) $this->mute();
        parent::volumeUp();
    }
    public function volumeDown() {
        if($this->muted) $this->mute();
        parent::volumeDown();
    }
}

class TV implements Device {
    protected $enabled = false;
    protected $volume = 50;
    protected $channel = 1;

    public function enable() { $this->enabled = true; }
    public function disable() { $this->enabled = false; }
    public function isEnabled() { return $this->enabled; }
    public function getChannel() { return $this->channel; }
    public function setChannel($ch) {
        $this->channel = max($ch, 1);
    }
    public function getVolume() { return $this->volume; }
    public function setVolume($v) {
        $this->volume = max(min($v, 100), 0);
        echo $this->volume . ' ' . $v . '<br>';
    }
    public function info() {
        echo '-------------------<br>';
        echo 'Power: '.(($this->enabled)?'ON':'OFF').'<br>';
        echo 'Channel: '.$this->channel.'<br>';
        echo 'Volume: '.$this->volume.'<br>';
        echo '-------------------<br>';
    }
}

$tv = new TV();
$remote = new Remote($tv);
$remote->togglePower();
$remote->channelDown();
$remote->volumeUp();
$tv->info();

$tv2 = new TV();
$advancedRemote = new AdvancedRemote($tv);
$advancedRemote->mute();
$tv2->info();
