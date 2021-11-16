extends Camera2D

onready var Backgrd1 = get_parent().get_node("BackGrd1")
onready var Backgrd2 = get_parent().get_node("BackGrd2")
onready var Backgrd3 = get_parent().get_node("BackGrd3")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 6000


func _process(delta):
	pass
	#position.x = position.x + 1
	#Backgrd1.position.x = Backgrd1.position.x + 0.33333
	#Backgrd2.position.x = Backgrd2.position.x + 0.33333
	#Backgrd3.position.x = Backgrd3.position.x + 0.33333
