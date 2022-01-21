extends Node

export (String) var emit
export (bool) var active = true

func _input(event):
	if OS.is_debug_build() && active:
		if event.is_action_pressed("ui_select"):
			Globals.emit_signal(emit)
