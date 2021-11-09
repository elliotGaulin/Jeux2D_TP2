extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var chemin = get_parent()
export var dir_initiale = -1
var velocity = Vector2()
export var vitesse = 400
export (int) var gravity = 4000
var dir

func _ready():
	dir = dir_initiale
	
func _physics_process(delta):
	if position.y > 2000:
		queue_free()
	velocity.x = dir * vitesse
	velocity.y = gravity
	move_and_slide(velocity)

func hit():
	queue_free()


func _on_Area2DDroite_body_entered(body):
	print(body.name)
	if body.name != "Personnage":
		dir *= -1
	else:
		body.hit()


func _on_Area2DGauche_body_entered(body):
	print(body.name)
	if body.name != "Personnage":
		dir *= -1
	else:
		body.hit()
