extends Button

onready var credits = get_node("../Credits")

func _pressed():
	credits.visible = !credits.visible
