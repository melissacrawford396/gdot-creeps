extends Sprite2D

@onready var parent = $".."
@onready var joystickButton = $"../JoystickButton"

var pressing = false
var center_of_joystick


@export var maxLength = 50 
@export var deadZone = 5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	maxLength *= parent.scale.x
	center_of_joystick = joystickButton.position + (joystickButton.size * 0.5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if pressing:
		if get_global_mouse_position().distance_to(center_of_joystick) <= maxLength:
			global_position = get_global_mouse_position()
		else:
			var angle = center_of_joystick.angle_to_point(get_global_mouse_position())
			global_position.x = center_of_joystick.x + cos(angle) * maxLength
			global_position.y = center_of_joystick.y + sin(angle) * maxLength
		calculateVector()
	else:
		global_position = lerp(global_position, center_of_joystick, delta * 10)
		parent.posVector = Vector2(0, 0)
	print(parent.posVector)

func calculateVector():
	if(abs(global_position.x - center_of_joystick.x) >= deadZone):
		parent.posVector.x = (global_position.x - center_of_joystick.x) / maxLength
	if(abs(global_position.y - center_of_joystick.y) >= deadZone):
		parent.posVector.y = (global_position.y - center_of_joystick.y) / maxLength

func get_center_of_joystick():
	center_of_joystick = joystickButton.position + (joystickButton.size * 0.5)

func _on_button_button_down() -> void:
	pressing = true


func _on_button_button_up() -> void:
	pressing = false
