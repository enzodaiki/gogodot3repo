extends Area2D

var move = Vector2(1, 0)
var velocidade = 250
var direcao_unica = true

func _process(delta: float) -> void:
	var mouse_location = Vector2(1 ,0).rotated(rotation)
	if mouse_location < Vector2(0, 0):
		$projetil.flip_v = true
	if direcao_unica:
		look_at(get_global_mouse_position())
		direcao_unica = false
	global_position += move.rotated(rotation) * velocidade * delta
	if move >= Vector2(1, 0):
		$projetil.scale.x += 0.03
		$projetil.scale.y += 0.03
		velocidade -= 0.75
		if velocidade <= 300:
			velocidade = 300
		if $projetil.scale.x >= 1.5:
			$projetil.scale.x = 1.5
		if $projetil.scale.y >= 1.25:
			$projetil.scale.y = 1.25
		
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
