extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	#$Label.font_color = Color(1,1,1,1)
	$Label.set("font_color",Color(0.447,0.839,0.807))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	$Label.set("custom_colors/font_color",Color(0.854,0.305,0.219))
	#$Label.set("custom_colors/font_color", Color(1,0,0))
	#	$Label.font_color = Color(218,78,56,207)


func _on_echap_pressed():
	var error = get_tree().change_scene("res://scenes/menu/menu.tscn")
	if (error != OK):
		print('don\'t work');
