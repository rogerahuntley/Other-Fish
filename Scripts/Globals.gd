extends Node

signal launch_minigame()
signal start_minigame()
signal minigame_failed()
signal minigame_won()
signal exit_minigame()
signal bar_finished()
signal minigame_closed()
signal no_hearts()
signal bar_stop()
signal character_talking(character, sentence)

var in_minigame = false;
var bar_running = false;

func _ready():
	self.connect("launch_minigame", self, "in_mini");
	self.connect("exit_minigame", self, "exit");
	self.connect("start_minigame", self, "start");
	self.connect("minigame_won", self, "won");
	self.connect("minigame_failed", self, "failed");
	self.connect("start_minigame", self, "start");
	self.connect("bar_finished", self, "bar_end");

func in_mini():
	in_minigame = true;

func out_mini():
	in_minigame = false;

func bar_start():
	bar_running = true;

func bar_end():
	print("bar ended")
	bar_running = false;

func start():
	bar_start()
	print("minigame started")

func exit():
	out_mini()
	print("minigame exited")

func won():
	print("minigame won")

func failed():
	print("minigame failed")
