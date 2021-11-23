extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Jouer_button_down():
	pass


func _on_Instru_button_down():
	$Node2D.visible = true
	disablebutton()


func _on_Controles_button_down():
	$Node2DControle.visible = true
	disablebutton()


func _on_Quitter_button_down():
	get_tree().quit()


func _on_ButtonInstru_button_down():
	$Node2D.visible = false
	enablebutton()


func _on_ButtonControle_button_down():
	$Node2DControle.visible = false
	enablebutton()	

func disablebutton():
	$HBoxContainer/VBoxContainer/Jouer.disabled = true
	$HBoxContainer/VBoxContainer/Instru.disabled = true
	$HBoxContainer/VBoxContainer/Controles.disabled = true
	$HBoxContainer/VBoxContainer/Quitter.disabled = true
func enablebutton():
	$HBoxContainer/VBoxContainer/Jouer.disabled = false
	$HBoxContainer/VBoxContainer/Instru.disabled = false
	$HBoxContainer/VBoxContainer/Controles.disabled = false
	$HBoxContainer/VBoxContainer/Quitter.disabled = false
