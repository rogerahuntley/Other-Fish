extends Control
class_name Minigame

export var timer = 6

var failed = false
var active = false;

func _ready():
	Globals.connect("start_minigame", self, "start")
	pass

func start():
	active = true

func end():
	active = false

func _update(delta):
	pass

#func _input(event):
#	if active:
#		if event.is_action_pressed("ui_accept"):
#			fail()

func fail():
	#if haven't failed yet
	if active:
		failed = true
		Globals.emit_signal("minigame_failed")
		end()
