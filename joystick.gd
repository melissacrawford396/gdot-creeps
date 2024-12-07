extends Control

var posVector: Vector2


func _ready() -> void:
	# start off with joystick hidden
	# show when the game "starts"
	hide()
	
func hide_joystick():
	hide()
