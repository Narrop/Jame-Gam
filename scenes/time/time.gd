extends KinematicBody2D

# Constante
const SPEED = 200

# Variable
var velocity = Vector2.ZERO
var anim = 'standing'

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.playing = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	path_fiding()
	velocity = move_and_slide(velocity)
	
## path_fiding, Va en direction du heros  
func path_fiding():
	var demon = get_node('time1')
	var demon_position_x = 0
	var demon_position_y = 0
	var hero_position_x = 0
	var hero_position_y = 0
	var ecart_x = 0
	var ecar_y = 0
	
	
	
	print("print : " )
	print($".".global_position)
	
	if ecart_x == 0 and ecar_y == 0:
		# you loose
		print("your loose")
		
	# A optimiser
	if demon_position_x > hero_position_x:
		print()
	elif demon_position_x < hero_position_x:
		print()
	
	
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed('ui_right'):
		run(1, 'x')
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed('ui_left'):
		run(-1, 'x')
		$AnimatedSprite.flip_h = true
	if Input.is_action_pressed('ui_down'):
		run(1, 'y')
	if Input.is_action_pressed('ui_up'):
		run(-1, 'y')
		
	$AnimatedSprite.animation = anim
	velocity = velocity.normalized() * SPEED
	

## run, function appellé pour faire bouger le personnage dans un sens
## @param val, integer, valeur à ajouter (peut être négatif)
## @param postion, string, valeur à indiquer si on veut courrir en X ou Y 
## exemple run(-1, 'y')
func run(val, position):
	if position == 'x':
		velocity.x += val
	elif position == 'y':
		velocity.y += val
		
	anim = 'running'

