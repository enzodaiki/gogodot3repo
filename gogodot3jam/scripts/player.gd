extends KinematicBody2D

const ACCELERATION = 1300
const MAX_SPEED = 170
const FRICTION = 10000

var velocity = Vector2()

var fire_ball = preload("res://Scene/fire_ball.tscn")
var water_jet = preload("res://Scene/water_jet.tscn")
var earth_wall = preload("res://Scene/earth_wall.tscn")

var recarregado1 = true
var recarregado2 = true
var recarregado3 = true

func _physics_process(delta: float) -> void:
	var input_vector1 = Vector2()
	var input_vector2 = Vector2()
	input_vector1.x = int(Input.get_action_strength("right")) - int(Input.get_action_strength("left"))
	input_vector1.y = int(Input.get_action_strength("down")) - int(Input.get_action_strength("up"))
	input_vector2 = input_vector1.normalized()
	
	if input_vector2 != Vector2():
		velocity = velocity.move_toward(input_vector2 * MAX_SPEED, ACCELERATION * delta)
		$AnimationPlayer.play("running")
	else:
		velocity = velocity.move_toward(Vector2(), FRICTION * delta)
		$AnimationPlayer.play("idle")
	
	var mouse_location = get_local_mouse_position()
	if mouse_location < Vector2(0, 0):
		$Sprite.flip_h = false
	elif mouse_location > Vector2(0, 0):
		$Sprite.flip_h = true
	if $Sprite.flip_h:
		if input_vector1.x != 0:
			$Sprite.flip_h = true
	else:
		if input_vector1.x != 0:
			$Sprite.flip_h = false
	
	velocity = move_and_slide(velocity)
	
func _process(delta: float) -> void:
	if Global.fire == true:
		if Input.is_action_just_pressed("attack2") && Global.criacao_no_pai != null && recarregado1 && Global.mana >= 1:
			Global.instance_node(fire_ball, global_position, Global.criacao_no_pai)
			recarregado1 = false
			$tempo_recarga_fogo.start()
			Global.mana -= 1
	elif Global.water == true:
		if Input.is_action_just_pressed("attack2") && Global.criacao_no_pai != null && recarregado2 && Global.mana >= 2:
			Global.instance_node(water_jet, global_position, Global.criacao_no_pai)
			recarregado2 = false
			$tempo_recarga_agua.start()
			Global.mana -= 2
	elif Global.earth == true:
		if Input.is_action_just_pressed("attack2") && Global.criacao_no_pai != null && recarregado3 && Global.mana >= 4:
			Global.instance_node(earth_wall, global_position, Global.criacao_no_pai)
			recarregado3 = false
			$tempo_recarga_terra.start()
			Global.mana -= 4

	if Input.is_action_just_pressed("attack1"):
			Global.fire = false
			Global.water = false
			Global.earth = false

func _on_tempo_recarga_fogo_timeout() -> void:
	recarregado1 = true


func _on_tempo_recarga_agua_timeout():
	recarregado2 = true


func _on_tempo_recarga_terra_timeout():
	recarregado3 = true
