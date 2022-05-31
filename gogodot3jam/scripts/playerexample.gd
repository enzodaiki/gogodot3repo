extends KinematicBody2D

var Gravity = 5
var Speed = 80
var JumpPower = 145
var Facing_Right = true
var IsJumping = false
var HP = 3

var Bullet = preload("res://bullet.tscn")

var is_dead = false

var Motion = Vector2.ZERO
	
func _physics_process(_delta):
	
	if is_dead == false:
		if IsJumping == true:
			$AnimationPlayer.play("jumping")
			
		if is_on_floor():
			if Input.is_action_just_pressed("up"):
				Motion.y = -JumpPower
				$AnimationPlayer.play("jumping")
				var IsJumping = true
				
		if Input.is_action_just_pressed("fly"):
			Motion.y = -JumpPower
			$AnimationPlayer.play("jumping")
			var IsJumping = true
				
		if Input.is_action_pressed("right"):
			Motion.x = Speed
			if is_on_floor():
				$AnimationPlayer.play("running")
				var Facing_Right = true
				$Sprite.flip_h = false
				if sign ($Position2D.position.x) == -1:
					$Position2D.position.x *= -1
				
		elif Input.is_action_pressed("left"):
			Motion.x = -Speed
			if is_on_floor():
				$AnimationPlayer.play("running")
				var Facing_Right = false
				$Sprite.flip_h = true
				if sign ($Position2D.position.x) == 1:
					$Position2D.position.x *= -1
					
		else:
			Motion.x = 0 
			$AnimationPlayer.play("idle")
		
		if Input.is_action_pressed("right") and Input.is_action_just_pressed("up"):
			$AnimationPlayer.play("jumping")
			var Facing_Right = true
			var IsJumping = true
			$Sprite.flip_h = false
			
		if Input.is_action_pressed("left") and Input.is_action_just_pressed("up"):
			$AnimationPlayer.play("jumping")
			var IsJumping = true
			var Facing_Right = false
			$Sprite.flip_h = true
			
		if Input.is_action_just_pressed("shoot"):
			var bullet = Bullet.instance()
			if sign ($Position2D.position.x) == 1:
				bullet._set_bullet_direction(1)
			else:
				bullet._set_bullet_direction(-1)
			get_parent().add_child(bullet)
			bullet.position = $Position2D.global_position
			$AnimationPlayer.play("shooting")
			
		if IsJumping:
			$AnimationPlayer.play("jumping")
			
		
		Motion.y += Gravity
		Motion = move_and_slide(Motion, Vector2.UP)


func _on_Area2D_body_entered(body):
	if "player" in body.name:
		get_tree().change_scene("res://world.tscn")

func dead():
	Globalvars.health -=1
	if Globalvars.health == 0:
		is_dead = true
		Speed = Vector2(0,0)
		$Sprite.rotate(90)
		$AnimationPlayer.play("idle")
		$CollisionShape2D.free()
		$CollisionShape2D2.free()
		$Timer.start()

func _on_Timer_timeout():
	get_tree().change_scene("res://menu.tscn")
