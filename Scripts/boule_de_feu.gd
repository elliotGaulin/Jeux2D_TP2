extends KinematicBody2D

export var speed = 1000
export var gravity = 5000
export var max_collision = 4
var nombre_collision = 0

var velocity = Vector2()

#démarre le mouvement de la balle
func start(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)
#Gere la physique de la balle
func _physics_process(delta):
	velocity.y += gravity * delta
	move_and_slide(velocity)
	#var collision = move_and_collide(velocity * delta)
	var slide_count = get_slide_count()
	if slide_count:
		nombre_collision += 1
		if nombre_collision > max_collision:
			queue_free()
			return
		var collision = get_slide_collision(slide_count - 1)
		_collision(collision)
#Action effectuée lors d'une collision
func _collision(collision):
	if collision.collider.has_method("hit"):
		collision.collider.hit()
		queue_free()
	else:
		velocity = velocity.bounce(collision.normal)
