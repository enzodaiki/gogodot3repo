extends Area2D

var move = Vector2(1, 0)
var velocidade = 250
var direcao_unica = true
var timer_ready = false

func _process(delta: float) -> void:
	if timer_ready == false:
		timer_ready = true
		$Timer.start()
	var mouse_location = Vector2(1 ,0).rotated(rotation)
	if mouse_location < Vector2(0, 0):
		$projetil.flip_v = true
		$projetil.position.x = -250
		$projetil.position.y = 0
	else:
		$projetil.position.x = -250
		$projetil.position.y = 0
	if direcao_unica:
		look_at(get_global_mouse_position())
		direcao_unica = false
	global_position += move.rotated(rotation) * velocidade * delta
	if move >= Vector2(1, 0):
		$projetil.scale.y += 0.03
		$projetil.scale.x += 0.03
		if velocidade <= 210:
			velocidade = 210
		if $projetil.scale.y >= 2:
			$projetil.scale.y = 2
		if $projetil.scale.x >= 2:
			$projetil.scale.x = 2
		
func _on_Timer_timeout():
	queue_free()
