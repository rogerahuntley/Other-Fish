extends Control

onready var tween = get_node("Tween");

export (Array, String, FILE) var minigames;

onready var minigame_node
onready var heartbar_node = get_node("HeartBar")
onready var heartcount_node = get_node("HeartCounter/Label")

onready var animation_player = get_node("AnimationPlayer")
onready var shake_player = get_node("Shake")

onready var viewport_node = get_node("ViewportContainer/Viewport")

var intro_time = .5;
var start_buffer = 1;

var hearts = 3;
var time = 5;

var minigame

func _ready():
	Globals.connect("minigame_failed", self, "fail");
	Globals.connect("minigame_won", self, "won");
	Globals.connect("bar_finished", self, "finish");
	add_mini_game()

func add_mini_game():
	var game = select_mini_game()
	minigame_node = game.instance()
	viewport_node.add_child(minigame_node);

func configure(H, T):
	hearts = H
	time = T
	updateHearts()
	updateTime()

func updateHearts():
	heartcount_node.text = str(hearts)

func updateTime():
	heartbar_node.time = time

func start():
	tween.interpolate_property(self, "rect_position:y", -600, 0, intro_time)
	tween.interpolate_callback(self, intro_time, "start_start")
	tween.interpolate_callback(self, intro_time + start_buffer, "start_game")
	tween.start();
	pass;

func fail():
	shake_player.play("shake");
	hearts -= 1
	updateHearts()
	tween.interpolate_callback(self, intro_time, "start_fail")
	tween.start()

func won():
	tween.interpolate_callback(self, intro_time, "start_won")
	tween.start()
	
func select_mini_game():
	# returns a random scene object from minigames array
	randomize()
	var num = round(rand_range(0, minigames.size()-1))
	return load(minigames[num]);

func close():
	#raise curtain
	tween.interpolate_property(self, "rect_position:y", 0, -600, intro_time)
	tween.interpolate_callback(self, intro_time, "exit")
	tween.start()

func exit():
	Globals.emit_signal("exit_minigame");
	minigame_node.queue_free()

func finish():
	tween.interpolate_callback(self, 2, "close")
	tween.start()

func start_game():
	Globals.emit_signal("start_minigame")

func start_start():
	animation_player.play("start")

func start_fail():
	animation_player.play("fail")
	
func start_won():
	animation_player.play("won")
	
