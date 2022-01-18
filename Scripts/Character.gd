extends Sprite3D

class_name CharacterSprite

export var chara: Resource

var bob_speed = 10;
var bob_amt = 1;
var start_pos = 0;
var pos = 1;

var talking = false;

func _ready():
	Globals.connect("character_talking", self, "talking_check");
	start_pos = translation.y

func _process(delta):
	if talking:
		talking_bob(delta);
	pass
	
func talking_bob(delta):
	pos += delta;
	translation.y = start_pos + sin(pos * bob_speed) * bob_amt;
	pass

func talking_check(character, _t):
	print(character)
	if character == chara:
		talking = true
	else:
		talking = false
		pos = start_pos
