extends Camera2D

onready var Mario = get_parent().get_node("Personnage")
onready var Backgrd1 = get_parent().get_node("BackGrd1")
onready var Backgrd2 = get_parent().get_node("BackGrd2")
onready var Backgrd3 = get_parent().get_node("BackGrd3")

var last_position_x
var background1_initial
var background2_initial
var background3_initial
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Mario == null:
		Mario = get_parent().get_node("Mario")
	position.x = 0
	last_position_x = position.x


func _process(delta):
	if is_instance_valid(Mario):
		if Mario.position.x >= 149:
			position.x = Mario.position.x - 150
			last_position_x = position.x
