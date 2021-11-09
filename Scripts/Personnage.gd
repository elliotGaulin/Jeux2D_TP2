extends KinematicBody2D

export (int) var speed = 1200
export (int) var jump_speed = -1800
export (int) var gravity = 4000

export (float, 0, 1.0) var friction = 0.1
export (float, 0, 1.0) var acceleration = 0.25

var etat = ""
var velocity = Vector2.ZERO

var frames_petit = preload("res://Ressources/Animation_personnage_petit.tres")
var frames_grand = preload("res://Ressources/Animation_personnage_grand.tres")
var frames_feu = preload("res://Ressources/Animation_personnage_feu.tres")

var collision_shape_petit = preload("res://Ressources/collisionShape_personnage_petit.tres")
var collision_shape_grand = preload("res://Ressources/collisionShape_personnage_grand.tres")

var boule_de_feu = preload('res://Scenes/boule_de_feu.tscn')

func _ready():
	changer_etat("petit")

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
	
	var slide_count = get_slide_count()
	if slide_count:
		var collision = get_slide_collision(slide_count - 1)
		_collision(collision)

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
	if $Timer_tirer.is_stopped():
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
		
	if Input.is_action_just_pressed("tirer"):
		if etat == "feu":
			tirer()
		
func changer_etat(nouvel_etat):
	if nouvel_etat == "petit":
		etat = "petit"
		$AnimatedSprite.frames = frames_petit
		$CollisionShape2D.shape = collision_shape_petit
		$CollisionShape2D.transform.origin = Vector2(0,0)
	elif nouvel_etat == "grand":
		etat = "grand"
		$AnimatedSprite.frames = frames_grand
		$CollisionShape2D.shape = collision_shape_grand
		$CollisionShape2D.transform.origin = Vector2(0,-7.5)
	elif nouvel_etat == "feu":
		etat = "feu"
		$AnimatedSprite.frames = frames_feu
		$CollisionShape2D.shape = collision_shape_grand
		$CollisionShape2D.transform.origin = Vector2(0,-7.5)
		
	else:
		print(nouvel_etat + " n'est pas un état valide")		

func get_etat():
	return etat
	
func _collision(collision):
	var collider = collision.collider
	if collider.name == "champignon":
		if etat == "petit":
			changer_etat("grand")
			collider.queue_free()
	if collider.name == "fleur_feu":
		if etat != "feu":
			changer_etat("feu")
			collider.queue_free()
			
func tirer():
	var b = boule_de_feu.instance()
	if $AnimatedSprite.flip_h == true:
		b.start($emplacement_tir_gauche.global_position, rotation  + 3.14159 - 0.7)		
	else:
		b.start($emplacement_tir_droit.global_position, rotation + 0.7)
	get_parent().add_child(b)
	$AnimatedSprite.animation = "tirer"
	$AnimatedSprite.play()
	$Timer_tirer.start()
