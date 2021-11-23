extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$fleur_feu.derniere_y = $fleur_feu.position.y +12

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
