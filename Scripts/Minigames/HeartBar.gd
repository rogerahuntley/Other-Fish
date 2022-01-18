extends Control

onready var tween = get_node("Tween")
onready var left = get_node("Left")
onready var right = get_node("Right")
onready var heart = get_node("Heart")

func _ready():
	Globals.connect("minigame_failed", self, "stop_tween");
	Globals.connect("start_minigame", self, "start");

func start(time = 5):
	tween.interpolate_property(left, "position:x", 68, 668, time)
	tween.interpolate_callback(self, time, "finish")
	tween.start()
	pass

func stop_tween():
	tween.stop_all();
	Globals.emit_signal("bar_finished");
	pass

func finish():
	Globals.emit_signal("bar_finished");
	Globals.emit_signal("minigame_won");
	left.visible = false;
	right.visible = false;
	heart.rot = 0;
	heart.visible = true;
	pass
