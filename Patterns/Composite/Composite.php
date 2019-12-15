<?php

abstract class Component {
    protected $parent;

    public function setParent($parent) { $this->parent = $parent; }
    public function getParent() { return $this->parent; }

    abstract public function operation();
}

class Leaf extends Component {
    public function operation() { return 'Leaf'; }
}

class Composite extends Component {
    protected $children = [];

    public function add($component) {
        $this->children[] = $component;
        $component->setParent($this);
    }
    public function remove($component) {
        unset($this->children[array_search($component, $this->children)]);
        $component->setParent(null);
    }
    public function operation() {
        $results = [];
        foreach($this->children as $child) {
            $results[] = $child->operation();
        }
        return 'Branch(' . implode('+', $results) . ')';
    }
}

$tree = new Composite;
$branch1 = new Composite;
$branch1->add(new Leaf);
$branch1->add(new Leaf);
$branch1->add(new Leaf);
$branch2 = new Composite;
$branch2->add(new Leaf);
$tree->add($branch1);
$tree->add($branch2);
echo $tree->operation();
