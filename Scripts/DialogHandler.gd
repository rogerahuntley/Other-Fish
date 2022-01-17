extends Node

var gator
export (NodePath) var _gator
var octopus
export (NodePath) var _octopus
var fish
export (NodePath) var _fish
var seahorse
export (NodePath) var _seahorse

func _ready():
	gator = get_node_or_null(_gator);
	octopus = get_node_or_null(_octopus);
	fish = get_node_or_null(_fish);
	seahorse = get_node_or_null(_seahorse);

