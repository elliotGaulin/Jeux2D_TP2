extends KinematicBody2D

export var speed = 500
export var gravity = 1000

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
		var collision = get_slide_collision(slide_count - 1)
		if collision.collider.has_method("hit"):
			collision.collider.hit()
		else:
			velocity = velocity.bounce(collision.normal)

#Action effectuée lors d'une collision
func _collision(collision):
	if collision.collider.has_method("hit"):
		collision.collider.hit()
	queue_free()	
