extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var chemin = get_parent()
var velocity = Vector2()
export var vitesse = 400
var dir = 1
var stopped = false
	
func _physics_process(delta):
	if !stopped:
		velocity.x = dir * vitesse
		move_and_slide(velocity)
		var slide_count = get_slide_count()
		if slide_count:
			var collision = get_slide_collision(slide_count - 1)
			print(collision.collider.name)
			if collision.collider.name == "TileMap":
				stopped = true
			
