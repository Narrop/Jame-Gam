extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$music_advent.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_echap_pressed():
	var error = get_tree().change_scene("res://scenes/menu/menu.tscn")
	if (error != OK):
		print('don\'t work');
