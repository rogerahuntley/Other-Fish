extends Node

var gator

func _ready():
	gator = get_node_or_null("Spatial/Characters/Spatial/Gator");
	gator.talking = true;
