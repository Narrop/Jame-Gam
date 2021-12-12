extends KinematicBody2D

# Code du joueur qui lui permet de se mouvoir plus les interactions

var speed = 200 

var velocity = Vector2.ZERO

func get_input():
	velocity = Vector2.ZERO
	var zero = Vector2.ZERO
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
	
	# change l'animation en fonction du déplacement du joueur
	if velocity == zero:
		$AnimatedSprite.animation = "standing"
	else:
		$AnimatedSprite.animation = "running"
	
	# on normalisent les mouvement afin qu'il se fassent tous à la meme vitesse
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
