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


func _on_start_pressed():
	var error = get_tree().change_scene("res://scenes/level1/level1.tscn")
	if (error != OK):
		print('don\'t work');
	


func _on_credit_pressed():
	var error = get_tree().change_scene("res://scenes/menu/credit.tscn")
	if (error != OK):
		print('don\'t work');
	

