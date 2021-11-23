extends KinematicBody2D

export (int) var speed = 525
export (int) var jump_speed = -1200
export (int) var gravity = 75000

export (float, 0, 1.0) var friction = 0.1
export (float, 0, 1.0) var acceleration = 0.25
var velocity = Vector2.ZERO
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mouvement = 0
var sauter = false
var unefois = 0
var changer = 0
var surpris = 0
var sauterV2 = true
var unefoisV2 = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if mouvement == 0:
		$AnimatedSprite.animation = "default"
		$AnimatedSprite.play()
		$AnimatedSpriteGauche.visible = false
		yield(get_tree().create_timer(0.3), "timeout")
		sauter = true
		if sauter == true and unefois == 0:
			$AnimatedSprite.animation = "sauter"
			$AnimatedSprite.play()
			velocity.x = 0
			velocity.y = jump_speed
			move_and_slide(velocity, Vector2.UP)
			yield(get_tree().create_timer(0.4), "timeout")
			sauter = false
			unefois = 1
		elif unefois == 1 and !is_on_floor():
			$AnimatedSprite.animation = "sauter"
			$AnimatedSprite.play()
			velocity.y = 0
			velocity.x = 0
			velocity.y += gravity * delta
			move_and_slide(velocity, Vector2.UP)
		else:
			$AnimatedSprite.animation = "default"
			$AnimatedSprite.play()
			yield(get_tree().create_timer(0.2), "timeout")
			mouvement = 3
	if mouvement == 1:
		velocity.x = 1 * 550
		velocity.y = 100
		move_and_slide(velocity)
		if (changer == 0):
			$AnimatedSprite.animation = "courrir"
			$AnimatedSprite.play()
			$AnimatedSpriteGauche.visible = true
			changer = 1
	if mouvement == 3:
		if surpris == 0:
			print("bruh")
			if sauterV2 == true and unefoisV2 == 0:
				$AnimatedSprite.animation = "sauter"
				$AnimatedSprite.play()
				velocity.x = 0
				velocity.y = jump_speed + 300
				move_and_slide(velocity, Vector2.UP)
				yield(get_tree().create_timer(0.04), "timeout")
				sauterV2 = false
				unefoisV2 = 1
				print("a sauter")
			elif unefoisV2 == 1 and !is_on_floor():
				$AnimatedSprite.animation = "sauter"
				$AnimatedSprite.play()
				velocity.y = 0
				velocity.x = 0
				velocity.y += (gravity - 60000) * delta
				move_and_slide(velocity, Vector2.UP)
				print("redescend")
			else:
				$AnimatedSprite.animation = "default"
				$AnimatedSprite.play()
				print("fin")
				surpris = 1
		elif surpris == 1:
			changer = 0
			mouvement = 1
