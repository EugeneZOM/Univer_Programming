<?php

// ----------- Interfaces -----------
interface IButton {
    function draw();
}

interface IText {
    function draw();
}

interface IFactory {
    function getButton();
    function getText();
}

// ----------- Abstract classes -----------
abstract class AButton implements IButton {
    protected $text = 'Button';
    public function setText($text) {
        $this->text = $text;
    }
}

abstract class AText implements IText {
    protected $text = 'Text';
    public function setText($text) {
        $this->text = $text;
    }
}

abstract class AFactory implements IFactory {}

// ----------- Buttons -----------
class Button extends AButton {
    // Simple button
    public function draw() {
        echo "<button>{$this->text}</button>";
    }
}

class BeautifulButton extends AButton {
    // Just added some styles and events
    public function draw() {
        echo "<button style=\"padding:10px;border-radius:20px;border:0;font-weight:bold;box-shadow:0 0 10px black;cursor:pointer;outline:none;\" onmouseover=\"this.style.boxShadow='none'\" onmouseout=\"this.style.boxShadow='0 0 10px black'\" onmouseup=\"this.style.boxShadow='none'\" onmousedown=\"this.style.boxShadow='inset 0 0 10px black'\">{$this->text}</button>";
    }
}

// ----------- Texts -----------
class Text extends AText {
    public function draw() {
        echo "<p>{$this->text}</p>";
    }
}

class BeautifulText extends AText {
    public function draw() {
        echo "<p style=\"font-family:'Comic Sans MS', cursive, sans-serif\">{$this->text}</p>";
    }
}

// ----------- Factories -----------
class SimpleTheme extends AFactory {
    public function getButton() {
        return new Button();
    }
    public function getText() {
        return new Text();
    }
}

class BetterTheme extends AFactory {
    public function getButton() {
        return new BeautifulButton();
    }
    public function getText() {
        return new BeautifulText();
    }
}




$style = new SimpleTheme();
//$style = new BetterTheme();

$btn = $style->getButton();
$btn->setText('Click me, please');
$btn->draw();

$txt = $style->getText();
$txt->setText('Text example');
$txt->draw();