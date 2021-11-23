extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var sprite_anime = get_node("AnimatedSprite")
onready var koopaSpin = preload('res://Scenes/KoopaSpin.tscn')
onready var chemin = get_parent()
export var dir_initiale = -1
var velocity = Vector2()
export var vitesse = 100
export (int) var gravity = 4000
var dir
var gauche = 0

var tourner = 1

func _ready():
	dir = dir_initiale
	sprite_anime.playing = true
	
func _physics_process(delta):
	if dir == 1:
		$AnimatedSprite.flip_h = true
		if $Area2DTete/CollisionShape2_Tete.rotation < 0:
			$Area2DTete/CollisionShape2_Tete.rotation = $Area2DTete/CollisionShape2_Tete.rotation * -1
			print($Area2DTete/CollisionShape2_Tete.rotation)
	if dir == -1:
		$AnimatedSprite.flip_h = false
		if $Area2DTete/CollisionShape2_Tete.rotation > 0:
			$Area2DTete/CollisionShape2_Tete.rotation = $Area2DTete/CollisionShape2_Tete.rotation * -1
			print($Area2DTete/CollisionShape2_Tete.rotation)
			
	if position.y > 2000:
		queue_free()
	velocity.x = dir * vitesse
	velocity.y = gravity
	move_and_slide(velocity)

func hit():
	var k = koopaSpin.instance()
	k.start(position, rotation)		
	get_parent().add_child(k)
	queue_free()


func TimeoutTourner():
	tourner = 0
	yield(get_tree().create_timer(1), "timeout")
	tourner = 1

func _on_Area2D_Gauche_body_entered(body):
	print_debug(body.name)
	if tourner == 1:
		if body.name != "Personnage":
			if (gauche == 0):
				dir *= -1
				$Area2DTete/CollisionShape2_Tete.position.x = $Area2DTete/CollisionShape2_Tete.position.x + 3.4
				$Area2D_solG.position.x = $Area2D_solG.position.x + 19
				$Area2D_Gauche.position.x = $Area2D_Gauche.position.x + 4
				$CollisionShape2D.position.x = $CollisionShape2D.position.x + 3.2
				gauche = 1
				TimeoutTourner()
			else:
				dir *= -1
				$Area2DTete/CollisionShape2_Tete.position.x = $Area2DTete/CollisionShape2_Tete.position.x - 3.4
				gauche = 0
				$Area2D_solG.position.x = $Area2D_solG.position.x - 19
				$Area2D_Gauche.position.x = $Area2D_Gauche.position.x - 4
				$CollisionShape2D.position.x = $CollisionShape2D.position.x - 3.2
				TimeoutTourner()
		else:
			body.hit()


func _on_Area2D_solG_body_exited(body):
	if tourner == 1:
		if (gauche == 0):
			dir *= -1
			$Area2DTete/CollisionShape2_Tete.position.x = $Area2DTete/CollisionShape2_Tete.position.x + 3.4
			$Area2D_solG.position.x = $Area2D_solG.position.x + 19
			$Area2D_Gauche.position.x = $Area2D_Gauche.position.x + 4
			$CollisionShape2D.position.x = $CollisionShape2D.position.x + 3.2
			gauche = 1
			TimeoutTourner()
		else:
			dir *= -1
			$Area2DTete/CollisionShape2_Tete.position.x = $Area2DTete/CollisionShape2_Tete.position.x - 3.4
			gauche = 0
			$Area2D_solG.position.x = $Area2D_solG.position.x - 19
			$Area2D_Gauche.position.x = $Area2D_Gauche.position.x - 4
			$CollisionShape2D.position.x = $CollisionShape2D.position.x - 3.2
			TimeoutTourner()


func _on_Area2DTete_body_entered(body):
	if body.name == "Personnage":
		if !body.invincible:
			self.hit()
