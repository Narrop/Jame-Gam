extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var key  = null


var can_change_key = false
var action_string
enum ACTIONS {UP, LEFT, RIGHT, DOWN, INTERACT}



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_echap_pressed():
	var error = get_tree().change_scene("res://scenes/menu/menu.tscn")
	if (error != OK):
		print('don\'t work');


#func _on_input_interact_pressed():
#
#
#
#func _on_popup_about_to_show():
	
func pop_up():
	if ($popup.visible == true):
		$popup.visible = false 
	else :
		$popup.visible = true 

func _on_input_interact_pressed():
	pop_up()
	#while (42): 
		#_set_keys()
		
		
