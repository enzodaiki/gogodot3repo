extends KinematicBody2D

const ACCELERATION = 1300
const MAX_SPEED = 170
const FRICTION = 10000

var velocity = Vector2.ZERO

func _physics_process(delta):
	var input_vector1 = Vector2.ZERO
	var input_vector2 = Vector2.ZERO
	input_vector1.x = int(Input.get_action_strength("right")) - int(Input.get_action_strength("left"))
	input_vector1.y = int(Input.get_action_strength("down")) - int(Input.get_action_strength("up"))
	input_vector2 = input_vector1.normalized()
	
	if input_vector2 != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector2 * MAX_SPEED, ACCELERATION * delta)
		$AnimationPlayer.play("running")
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		$AnimationPlayer.play("idle")
		
	if input_vector1.x != 0:
		$Sprite.scale.x = input_vector1.x *-1
	
	velocity = move_and_slide(velocity)


