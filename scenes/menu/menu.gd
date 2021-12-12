extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$music_menu_tuto.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_start_mouse_entered():
	$button_pressed.play()

func _on_start_pressed():
	var error = get_tree().change_scene("res://scenes/levels/level1.tscn")
	if (error != OK):
		print('don\'t work');
	


func _on_credit_pressed():
	var error = get_tree().change_scene("res://scenes/menu/credit.tscn")
	if (error != OK):
		print('don\'t work');
	



func _on_controls_pressed():
	var error = get_tree().change_scene("res://scenes/menu/controls.tscn")
	if (error != OK):
		print('don\'t work');
