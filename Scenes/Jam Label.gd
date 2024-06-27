extends Label

var float_speed = 2;
var float_amt = 2;
var pos = 0;

onready var y = rect_position.y

func _process(delta):
	pos += delta
	rect_position.y = y + sin(pos * float_speed) * float_amt;
	pass
