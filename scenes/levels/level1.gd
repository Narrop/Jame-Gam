extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$player/Text.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("ui_accept")):
		if $player/Text.visible == true:
			$player/Text2.visible = true
			$player/Text.visible = false
		elif$player/Text2.visible == true:
			$player/Text3.visible = true
			$player/Text2.visible = false
		else:
			$player/Text3.visible = false
			$StaticBody2D/CollisionPolygon2D.disabled = true


func _on_echap_pressed():
	var error = get_tree().change_scene("res://scenes/menu/menu.tscn")
	if (error != OK):
		print('don\'t work');
