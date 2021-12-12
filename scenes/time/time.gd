extends KinematicBody2D

var run_speed = 120
var velocity = Vector2.ZERO
var player = null

func _physics_process(delta):
	velocity = Vector2.ZERO
	if player:
		velocity = position.direction_to(player.position) * run_speed
	if velocity.x < 1:
		$AnimatedSprite.flip_h = true
	elif velocity.x > 1:
		$AnimatedSprite.flip_h = false
	
	if velocity == Vector2.ZERO:
		$AnimatedSprite.animation = "standing"
	else:
		$AnimatedSprite.animation = "running"
	
	velocity = move_and_slide(velocity)


func _on_DetectRadius_body_entered(body):
	player = body
