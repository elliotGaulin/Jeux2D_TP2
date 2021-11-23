extends Camera2D

onready var Mario = get_parent().get_node("Mario")
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
	#position.x = 0
	last_position_x = position.x
	background1_initial = Backgrd1.position.x    
	background2_initial = Backgrd2.position.x    
	background3_initial = Backgrd3.position.x    

func _process(delta):
	if is_instance_valid(Mario):
		if Mario.position.x >= 149:
			position.x = Mario.position.x - 150
			if position.x != last_position_x:
				Backgrd1.position.x = position.x - last_position_x * 0.33333 + background1_initial
				Backgrd2.position.x = position.x - last_position_x * 0.33333 + background2_initial
				Backgrd3.position.x = position.x - last_position_x * 0.33333 + background3_initial
			last_position_x = position.x
