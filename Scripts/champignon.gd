extends "res://Scripts/power_up.gd"

export var vitesse = 100

var dir

func _ready():
	name = "champignon"
	
func start(posx, posy, dirMario):
	position.x = posx
	position.y = posy
	dir = dirMario
	if dir == 0:
		dir = 1
	
func _physics_process(delta):
	if global_position.x > 1950:
		queue_free()
	if !is_on_wall():
		vitesse = 135
		gravity = 310
	else:
		vitesse = 400
		gravity = 100
	velocity.x = dir * vitesse
	velocity.y = gravity
	move_and_slide(velocity)
