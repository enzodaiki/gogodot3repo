extends Sprite

var move = Vector2(1, 0)
var velocidade = 250
var direcao_unica = true

func _process(delta: float) -> void:
	if direcao_unica:
		look_at(get_global_mouse_position())
		direcao_unica = false
	global_position += move.rotated(rotation) * velocidade * delta
	
	if move >= Vector2(1, 0):
		

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
