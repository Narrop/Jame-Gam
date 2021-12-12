extends Control


# Declare member variables here. Examples:


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	$Label.set("font_color",Color(0.447,0.839,0.807))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	$Label.set("custom_colors/font_color",Color(0.854,0.305,0.219))
	$mouahaha.play()



func _on_echap_pressed():
	var error = get_tree().change_scene("res://scenes/menu/menu.tscn")
	if (error != OK):
		print('don\'t work');
