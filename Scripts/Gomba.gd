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
	set_collision_layer_bit(2, true)
	set_collision_mask_bit(0, true)
	set_collision_mask_bit(2, true)
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
	if body.name == "Personnage":
		body.hit()
	elif body.name == "Boule_de_feu":
		pass
	else:
		dir *= -1


func _on_Area2DGauche_body_entered(body):
	if body.name == "Personnage":
		body.hit()
	elif body.name == "Boule_de_feu":
		pass
	else:
		dir *= -1


func _on_Area2DDessus_body_entered(body):
	if body.name == "Personnage":
		if !body.invincible:
			self.hit()
