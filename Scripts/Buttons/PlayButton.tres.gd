extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func start_game():
	get_tree().change_scene("res://Scenes/Gameshow.tscn")

func _input(event):
	if event.is_action_pressed("ui_accept"):
		start_game();

func _on_Button_pressed():
	start_game();
