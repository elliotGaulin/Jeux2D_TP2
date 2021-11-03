extends KinematicBody2D

export (int) var gravity

var velocity = Vector2.ZERO

func _ready():
	name = "fleur_feu"

func _physics_process(delta):
	velocity.y += gravity * delta
	move_and_collide(velocity * delta)

func hit():
	queue_free()
