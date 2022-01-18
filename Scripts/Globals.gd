extends Node

signal launch_minigame()
signal start_minigame()
signal minigame_failed()
signal minigame_won()
signal exit_minigame()
signal bar_finished()
signal character_talking(character, sentence)

var in_minigame = false;

func _ready():
	self.connect("launch_minigame", self, "in_mini");
	self.connect("exit_minigame", self, "out_mini");

func in_mini():
	in_minigame = true;

func out_mini():
	in_minigame = false;
