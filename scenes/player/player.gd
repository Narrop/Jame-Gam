extends KinematicBody2D

# Code du joueur qui lui permet de se mouvoir plus les interactions

#variable globale du script
var speed = 200 
var velocity = Vector2.ZERO
var on_object = null
var got_key = false
var key_num = 0

func get_input():
	
	velocity = Vector2.ZERO
	
	#
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		$AnimatedSprite.flip_h = true
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	
	# on normalisent les mouvement afin qu'il se fassent tous à la meme vitesse
	velocity = velocity.normalized() * speed
	
	if Input.is_action_pressed("ui_select") and on_object != null:
		if (on_object.is_in_group("KEY")):
			got_key = true
			Global.key_num = Global.key_num + 1
			if int(get_tree().current_scene.name) < 10:
				get_tree().change_scene("res://scenes/levels/level" + str(int(get_tree().current_scene.name) + 1) + ".tscn")
			else:
				get_tree().change_scene("res://scenes/menu/win.tscn")
			get_tree().call_group("KEY", "queue_free")
		
func _on_detector_area_entered(area):
	on_object = area


func _on_detector_area_exited(area):
	on_object = null

func _physics_process(delta):
	
	if $AnimatedSprite.animation != "dead":
		get_input()
		
			# change l'animation en fonction du déplacement du joueur
		if velocity == Vector2.ZERO:
			$AnimatedSprite.animation = "standing"
		else:
			$AnimatedSprite.animation = "running"
		
		#fonction qui fait bouger un kinematic body
		velocity = move_and_slide(velocity)


func _on_monster_body_entered(body):
	if $AnimatedSprite.animation != "dead":
		$death_time.start()
		$music_defeat.play()
		$AnimatedSprite.animation = "dead"
		key_num = Global.key_num
		if Global.key_num >= 1:
			Global.key_num = Global.key_num - 1



func _on_death_time_timeout():
	if key_num < 1:
		get_tree().change_scene("res://scenes/menu/game_over.tscn")
	else:
		get_tree().change_scene("res://scenes/levels/level" + str(Global.key_num + 1) + ".tscn")
		
	
