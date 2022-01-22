extends Spatial

class_name CharacterSprite

export var chara: Resource

onready var character = get_node("Sprite")
onready var light = get_node("Light")
onready var shadow = get_node("Shadow")

export (Texture) var texture
export (bool) var flip = false

var bob_speed = 15;
var bob_amt = 1;
var start_pos = 0;
var pos = 1;

var up = 3

var talking = false;

func _ready():
	Globals.connect("character_talking", self, "talking_check");
	start_pos = character.translation.y
	# character.texture = texture
	# was causing characters to turn white, import settings? couldn't figure out why
	if flip:
		character.flip_h = false

func _physics_process(delta):
	if talking:
		talking_bob(delta, true)
	else:
		talking_bob(delta / 10, false)
	pass
	
func talking_bob(delta, is_up):
	pos += delta;
	var to_move = start_pos + sin(pos * bob_speed) * bob_amt;
	if is_up:
		to_move += up
	character.translation.y = to_move
	pass

func talking_check(character, _t):
	if character == chara:
		talking = true
		pos = start_pos
	else:
		talking = false
