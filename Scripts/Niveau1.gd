extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().paused = true
		$Camera2D/Popup.popup()
