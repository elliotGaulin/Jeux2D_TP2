extends Node2D

var done = false
var courir = false

onready var mario = get_node("Mario")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var first = true
var debut = 0
var tour = 0
var switch = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$goomba.vitesse = 0
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_instance_valid($champignon) and done == false:
		$champignon.scale.x += 3
		$champignon.scale.y += 3
		$champignon.vitesse = 525
		$champignon.vraiVitesse = 525
		done = true
	if mario.position.x < 928 and debut == 0:
		mario.mouvement = 1
	else:
		if first == true:
			debut = 1
			mario.position.x = 928
			mario.mouvement = 0
			first = false
	if mario.global_position.x >= 3435:
		print("respawn")
		if switch == true: 
			mario.global_position.x = $champignon.global_position.x + 200
			switch = false
		else:
			mario.global_position.x = $champignon.global_position.x - 200
		tour += 1
	if done == true:
		if $champignon.global_position.x >= 3500:
			if switch == true:
				$champignon.global_position.x = -1600
			else:
				$champignon.global_position.x = -1000
	if tour % 5 == 0 and tour != 0:
		tour += 1
		$goomba.vitesse = 525
		$goomba.global_position.x = mario.global_position.x - 200
		switch = true
	if $goomba.global_position.x >= 3500:
		$goomba.vitesse = 0
		$goomba.global_position.x = -2200
