extends KinematicBody2D

export var speed = 800
export var gravity = 5000
export var max_collision = 4
var nombre_collision = 0
var invincible = true

var velocity = Vector2()

func _ready():
	name = "KoopaSpin"
	set_collision_layer_bit(6, false)
	set_collision_layer_bit(7, true)
	

#démarre le mouvement de la balle
func start(pos, dir):
	rotation = dir
	position = pos
	randomize()
	var direction_depart = round(rand_range(0,1))
	if direction_depart == 1:
		velocity.x *= -1
	velocity = Vector2(speed, 0).rotated(rotation)
#Gere la physique de la balle
func _physics_process(delta):
	velocity.y += gravity * delta
	move_and_slide(velocity)
	#var collision = move_and_collide(velocity * delta)
	var slide_count = get_slide_count()
	if slide_count:
		var collision = get_slide_collision(slide_count - 1)
		_collision(collision)
#Action effectuée lors d'une collision
func _collision(collision):
	if collision.collider.has_method("hit") && !invincible:
		collision.collider.hit()
		
func hit():
	queue_free()

func _on_Area2DDessus_body_entered(body):
	if body.name == "Personnage":
		if !body.invincible && !self.invincible:
			self.hit()


func _on_Area2DCote_body_entered(body):
	if body.name == "Personnage" && !self.invincible:
		body.hit()
	elif body.name == "Boule_de_feu":
		pass
	else:
		velocity.x *= -1


func _on_Timer_Start_timeout():
	set_collision_layer_bit(6, false)
	set_collision_layer_bit(7, true)
	invincible = false

