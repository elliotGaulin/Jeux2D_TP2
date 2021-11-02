extends KinematicBody2D

export (int) var speed = 1200
export (int) var jump_speed = -1800
export (int) var gravity = 4000

export (float, 0, 1.0) var friction = 0.1
export (float, 0, 1.0) var acceleration = 0.25

var velocity = Vector2.ZERO

var frames_petit = preload("res://Ressources/Animation_personnage_petit.tres")
var frames_grand = preload("res://Ressources/Animation_personnage_grand.tres")
var frames_feu = preload("res://Ressources/Animation_personnage_feu.tres")

func get_input():
	var dir = 0
	if Input.is_action_pressed("walk_right"):
		dir += 1
	if Input.is_action_pressed("walk_left"):
		dir -= 1
		
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_speed

func _process(delta):
	if Input.is_action_just_pressed("1"):
		changer_etat("petit")
	if Input.is_action_just_pressed("2"):
		changer_etat("grand")
	if Input.is_action_just_pressed("3"):
		changer_etat("feu")
	
	var dir = 0
	if Input.is_action_pressed("walk_right"):
		dir += 1
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("walk_left"):
		dir -= 1
		$AnimatedSprite.flip_h = true
	if is_on_floor():
		if dir == 0:
			$AnimatedSprite.animation = "default"
			$AnimatedSprite.play()
		else:
			$AnimatedSprite.animation = "courrir"
			$AnimatedSprite.play()
	else:
		$AnimatedSprite.animation = "sauter"
		$AnimatedSprite.play()
		
func changer_etat(etat):
	if etat == "petit":
		$AnimatedSprite.frames = frames_petit
	elif etat == "grand":
		$AnimatedSprite.frames = frames_grand
	elif etat == "feu":
		$AnimatedSprite.frames = frames_feu
