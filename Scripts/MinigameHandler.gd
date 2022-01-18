extends Control

onready var tween = get_node("Tween");

export (String, FILE) var minigame_frame_path;
var minigame_node;

var intro_time = .5;
var start_buffer = 1;

func _ready():
	Globals.connect("launch_minigame", self, "launch_minigame");
	Globals.connect("start_minigame", self, "start_minigame");
	Globals.connect("bar_finished", self, "finish_minigame");
	
	Globals.emit_signal("launch_minigame");

func launch_minigame():
	#lower curtain
	print("launched minigame")
	minigame_node = select_minigame().instance();
	add_child(minigame_node);
	tween.interpolate_property(minigame_node, "rect_position:y", -600, 0, intro_time);
	tween.interpolate_callback(minigame_node, intro_time, "start_start");
	tween.interpolate_callback(minigame_node, intro_time + start_buffer, "start");
	tween.start();
	pass

func start_minigame():
	pass

func select_minigame():
	return load(minigame_frame_path);

func finish_minigame():
	print("finished minigame")
	tween.interpolate_callback(self, 1, "close_minigame")
	tween.start()

func close_minigame():
	#raise curtain
	tween.interpolate_property(minigame_node, "rect_position:y", 0, -600, intro_time);
	tween.interpolate_callback(self, intro_time, "win")
	tween.start();

func win():
	print("won minigame")
	Globals.emit_signal("minigame_won");
