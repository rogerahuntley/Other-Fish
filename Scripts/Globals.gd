extends Node

signal launch_minigame()
signal start_minigame()
signal minigame_failed()
signal minigame_won()
signal exit_minigame()
signal bar_finished()
signal minigame_closed()
signal character_talking(character, sentence)

var in_minigame = false;

func _ready():
	self.connect("launch_minigame", self, "in_mini");
	self.connect("exit_minigame", self, "out_mini");
	self.connect("start_minigame", self, "print_start");
	self.connect("minigame_won", self, "print_won");
	self.connect("minigame_failed", self, "print_failed");

func in_mini():
	in_minigame = true;

func out_mini():
	in_minigame = false;

func print_start():
	print("minigame started")

func print_won():
	print("minigame won")

func print_failed():
	print("minigame failed")
