extends Minigame

var pos = 1

onready var move = get_node("Move")
onready var bandaid = get_node("Move/Bandaid")
onready var positions = [get_node("Pos1"), get_node("Pos2"), get_node("Pos3"), get_node("Pos4")]
onready var tween = get_node("Tween")

const BANDAIDTIME = .3

func _init():
	timer_out_signal = "minigame_failed"

func _start():
	move_to(pos);

func _input(event):
	if active:
		if event.is_action_pressed("ui_accept"):
			if pos == 2:
				drop_bandaid(true)
			else:
				drop_bandaid(false)
		if event.is_action_pressed("ui_left"):
			move_left()
		if event.is_action_pressed("ui_right"):
			move_right()

func drop_bandaid(win):
	Globals.emit_signal("bar_stop");
	tween.interpolate_property(bandaid, "position:y", 0, 300, BANDAIDTIME)
	if win:
		tween.interpolate_callback(self, BANDAIDTIME, "win")
	else:
		tween.interpolate_callback(self, BANDAIDTIME, "fail")
	tween.start()

func move_left():
	move_to(pos - 1)

func move_right():
	move_to(pos + 1)

func move_to(newPos):
	pos = clamp(newPos, 0, 3)
	move.position = positions[pos].position
	pass
