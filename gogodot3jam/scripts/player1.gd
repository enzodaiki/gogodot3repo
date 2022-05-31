extends KinematicBody2D

var speed = 120
var gravity = 15
var jumppower = 400
var isleft = false
var isright = false

var motion = Vector2.ZERO

func _physics_process(delta):
	
		
	if is_on_floor():
		if Input.is_action_just_pressed("p1 jump"):
			motion.y += -jumppower
	
	if Input.is_action_pressed("p1 right"):
		motion.x = speed
		isright == true
		isleft == false
		$Sprite.flip_h = false
		$AnimationPlayer.play("running")
	elif Input.is_action_pressed("p1 left"):
		motion.x = -speed
		isleft == true
		isright == false
		$Sprite.flip_h = true
		$AnimationPlayer.play("running")
	else:
		motion.x = 0
		$AnimationPlayer.play("iddle")
		
	if motion.y < 0:
		$AnimationPlayer.play("jumping")
		
	motion.y += gravity
	motion = move_and_slide(motion, Vector2.UP)
