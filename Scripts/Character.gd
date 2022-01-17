extends Sprite3D

class_name CharacterSprite

var bob_speed = 15;
var bob_amt = 1;
var start_pos = 0;
var pos = 1;

var talking = false;

func _ready():
	start_pos = translation.y

func _process(delta):
	if talking:
		talkingbob(delta);
	pass
	
func talkingbob(delta):
	pos += delta;
	translation.y = start_pos + sin(pos * bob_speed) * bob_amt;
	pass
