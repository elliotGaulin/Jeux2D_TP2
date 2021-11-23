extends Area2D

onready var tilemap = get_parent().get_node("TileMap")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	var tile = tilemap.world_to_map(position)
	tilemap.set_cell(tile.x, tile.y, -1)
	queue_free()
