extends Control

onready var minigame_node = get_node("ViewportContainer/Viewport/Minigame")
onready var heartbar_node = get_node("HeartBar")

onready var animation_player = get_node("AnimationPlayer")

func start():
	start_health()
	pass;

func start_health():
	heartbar_node.start()
	
func start_start():
	animation_player.play("start")
