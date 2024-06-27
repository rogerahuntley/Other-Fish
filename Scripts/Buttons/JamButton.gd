extends Button

onready var jam = get_node("../JamTheme")

func _pressed():
	jam.visible = !jam.visible
