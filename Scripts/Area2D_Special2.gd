extends Area2D

onready var fleur = preload("res://Scenes/fleur_feu.tscn")
onready var mario = get_parent().get_node("Mario")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var premierefois = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Area2D_Special2_body_entered(body):
	if (premierefois == true):
		var b = fleur.instance()
		get_parent().add_child(b)
		b.start(position.x, position.y)
		queue_free()
