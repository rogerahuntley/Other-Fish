extends Node

export (Dictionary) var characters

export (Resource) var first_dialog
var next_dialog
var dialog_data

var current_char

var line_num = 0

func _ready():
	open_dialog(first_dialog)
	Globals.connect("minigame_finished", self, "next");
	next()

func _input(event):
	if event.is_action_pressed("ui_accept") && !Globals.in_minigame:
		next()

func open_dialog(dialog):
	dialog_data = dialog.dialog.split("\n")
	next_dialog = first_dialog.next_bit
	line_num = 0

func get_next_line():
	var line = ""
	
	#loop until line is real
	while line == "":
		# check if valid index
		if dialog_data.size() == line_num:
			var dialog = get_next_dialog();
			if dialog == -1:
				return "%END"
			else:
				open_dialog(dialog)
		# get line
		line = dialog_data[line_num]
		line_num += 1
		
	return line

func get_next_dialog():
	#swap out dialogs else
	if next_dialog != null:
		return next_dialog
	else:
		return -1;

func end_game():
	print("game done!!!!! ran out of script!!!!")
	get_tree().quit();

func next():
	var line = get_next_line()
	if line.begins_with("!"):
		#new char
		line.erase(0,1)
		current_char = characters[line]
		next()
	elif line.begins_with("$"):
		Globals.emit_signal("launch_minigame");
	elif line.begins_with("%"):
		get_tree().quit();
	
	# not a new signal, so send dialog
	else:
		Globals.emit_signal("character_talking", current_char, line)
	pass
