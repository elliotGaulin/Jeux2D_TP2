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
	velocity.x = dir * vitesse
	velocity.y = gravity
	if !is_on_floor():
		move_and_slide(velocity)
