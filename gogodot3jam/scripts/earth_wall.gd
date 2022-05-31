extends RigidBody2D

var move = Vector2(1, 0)
var velocidade = 0
var direcao_unica = true
var pos_wall = get_local_mouse_position()
var timer_ready = false


func _process(delta: float) -> void:
	if timer_ready == false:
		timer_ready = true
		$Timer.start()
	if direcao_unica:
		$Sprite.position = Vector2(0, 0)
		$collision.position = Vector2(0, 0)
		$AnimationPlayer.play("up")
		print(pos_wall)
		direcao_unica = false
		wall_pos_on_spawn()
		
		
func wall_pos_on_spawn():
	global_position = get_global_mouse_position()
	
func _on_Timer_timeout():
	$collision.disabled = true
	$AnimationPlayer.play("down")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "down":
		queue_free()
