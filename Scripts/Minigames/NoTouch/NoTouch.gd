extends Minigame

onready var w = get_node("Controls/W")
onready var a = get_node("Controls/A")
onready var s = get_node("Controls/S")
onready var d = get_node("Controls/D")
onready var z = get_node("Action/Z")

func _input(event):
	if active:
		if event.is_action_pressed("ui_accept"):
			z.visible = true
			fail()
		if event.is_action_pressed("ui_up"):
			w.visible = true
			fail()
		if event.is_action_pressed("ui_left"):
			a.visible = true
			fail()
		if event.is_action_pressed("ui_down"):
			s.visible = true
			fail()
		if event.is_action_pressed("ui_right"):
			d.visible = true
			fail()
