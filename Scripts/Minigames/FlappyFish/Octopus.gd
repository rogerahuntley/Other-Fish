extends KinematicBody2D

onready var area = get_node("Area2D")
var active = false

const UP = Vector2(0, -1)
const FLAP = 300
const MAXFALLSPEED = 200
const GRAVITY = 10

var motion = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.connect("start_minigame", self, "set_active")
	area.connect("area_entered", self, "entered")
	pass # Replace with function body.

func entered(_o):
	if Globals.bar_running:
		Globals.emit_signal("minigame_failed")

func set_active():
	active = true

func _physics_process(delta):
	if active:
		motion.y += GRAVITY
		if motion.y > MAXFALLSPEED:
			motion.y = MAXFALLSPEED

		if Input.is_action_just_pressed("ui_accept") && Globals.bar_running:
			motion.y = -FLAP
		
		motion = move_and_slide(motion, UP)
