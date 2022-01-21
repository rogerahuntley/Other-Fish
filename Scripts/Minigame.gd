extends Control
class_name Minigame

onready var color = get_node("ColorRect")

export var timer = 6

# make sure to only emit once
# should be finished, kept to failed for back compat
var failed = false;
# checks whether game is running
var active = false;

var timer_out_signal = "minigame_won"

func _ready():
	Globals.connect("start_minigame", self, "start")
	Globals.connect("bar_finished", self, "end")
	color.visible = false
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

func win():
	Globals.emit_signal("minigame_won")
	end()

func fail():
	#if haven't failed yet
	if active:
		failed = true
		Globals.emit_signal("minigame_failed")
		end()
