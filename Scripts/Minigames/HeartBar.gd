extends Control

onready var tween = get_node("Tween")
onready var left = get_node("Left")
onready var right = get_node("Right")
onready var heart = get_node("Heart")

var finished = false

var time = 5

func _ready():
	Globals.connect("minigame_failed", self, "minigame_over");
	Globals.connect("minigame_won", self, "minigame_over");
	Globals.connect("start_minigame", self, "start");
	Globals.connect("bar_stop", self, "stop_tween");

func start():
	tween.interpolate_property(left, "position:x", 68, 668, time)
	tween.interpolate_callback(self, time, "finish")
	tween.start()
	pass

func minigame_over():
	stop_tween()
	Globals.emit_signal("bar_finished");
	

func stop_tween():
	tween.stop_all();

func finish():
	if !finished:
		var minigame_node = get_node("../ViewportContainer/Viewport").get_child(0)
		Globals.emit_signal(minigame_node.timer_out_signal)
		left.visible = false;
		right.visible = false;
		heart.rot = 0;
		heart.visible = true;
