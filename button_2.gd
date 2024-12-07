extends Button

var cnt

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cnt = 0	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "empty"


func _on_button_down() -> void:

	cnt += 1
	text = str(cnt)
