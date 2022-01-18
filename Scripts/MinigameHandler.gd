extends Control

onready var tween = get_node("Tween");

export (String, FILE) var minigame_frame_path;
var minigame_node;

var hearts = 3;
var time = 5;

func _ready():
	Globals.connect("launch_minigame", self, "launch_minigame");
	Globals.connect("bar_finished", self, "finish_minigame");
	# make harder every time you win
	Globals.connect("minigame_won", self, "shorten_time");
	# lose a heart when you take an L
	Globals.connect("minigame_failed", self, "shorten_hearts");

func shorten_time():
	time -= 1;

func shorten_hearts():
	hearts -= 1;

func launch_minigame():
	#lower curtain
	minigame_node = select_minigame().instance();
	add_child(minigame_node);
	minigame_node.configure(hearts, time)
	minigame_node.start()
	#tween.interpolate_callback(self, 2, "fail");
	tween.start()
	pass

func fail():
	Globals.emit_signal("minigame_failed");

func finish_minigame():
	minigame_node.finish();
	tween.interpolate_callback(self, 5, "remove_minigame", minigame_node);
	tween.start();

func remove_minigame(node):
	remove_child(node)

func select_minigame():
	return load(minigame_frame_path);
