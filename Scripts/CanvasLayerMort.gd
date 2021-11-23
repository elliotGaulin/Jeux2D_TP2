extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var mario = get_parent().get_node("Personnage")
onready var chateau = get_parent().get_node("Castle")

# Called when the node enters the scene tree for the first time.
func _ready():
	name = "CanvasLayerMort"


# Called every frame. 'delta' is the elapsed time since the previous frame
func _process(delta):
	if !is_instance_valid(mario):
		$Popup.show()

	
func _on_ButtonRecommencer_pressed():
	get_tree().reload_current_scene()

