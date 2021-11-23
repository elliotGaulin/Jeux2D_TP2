extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var mario = get_parent().get_node("Personnage")

onready var chateau = get_parent().get_node("Castle")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_instance_valid(mario) && is_instance_valid(chateau):
		if mario.position.x > chateau.position.x:
			$Popup.show()
			get_tree().paused = true


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Niveau1.tscn")
	get_tree().paused = false
