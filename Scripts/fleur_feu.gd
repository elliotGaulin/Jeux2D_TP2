extends "res://Scripts/power_up.gd"

export var vitesse = 100

var derniere_y

func _ready():
	name = "fleur_feu"
	
func start(posx, posy):
	position.x = posx
	position.y = posy
	derniere_y = posy

func _physics_process(delta):
	if position.y > derniere_y - 12:
		position.y -= 1
