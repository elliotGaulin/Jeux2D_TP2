extends Camera2D

onready var Mario = get_parent().get_node("Mario")
onready var Backgrd1 = get_parent().get_node("BackGrd1")
onready var Backgrd2 = get_parent().get_node("BackGrd2")
onready var Backgrd3 = get_parent().get_node("BackGrd3")


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 0


func _process(delta):
	if position.x >= 0:
		position.x = Mario.position.x - 600
		Backgrd1.position.x = Backgrd1.position.x + 0.33333
		Backgrd2.position.x = Backgrd2.position.x + 0.33333
		Backgrd3.position.x = Backgrd3.position.x + 0.33333
		if position.x < 0:
			position.x = 0
