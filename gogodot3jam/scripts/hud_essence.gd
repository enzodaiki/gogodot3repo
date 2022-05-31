extends CanvasLayer

var times_pressed = 0

func _physics_process(delta: float) -> void:
	if Global.fire_unlocked:
		$hud_sprite1.set_frame(1)
	if Global.water_unlocked:
		$hud_sprite2.set_frame(2)
	if Global.earth_unlocked:
		$hud_sprite3.set_frame(3)
	
	if Global.fire == false:
		$hud_sprite1.modulate.a = 0.5
	
	if Global.water == false:
		$hud_sprite2.modulate.a = 0.5
	
	if Global.earth == false:
		$hud_sprite3.modulate.a = 0.5
		
		
	if Input.is_action_just_pressed("fire_key"):
		if Global.fire_unlocked:
			Global.fire = true
			Global.water = false
			Global.earth = false
			$hud_sprite1.modulate.a = 1
	elif Input.is_action_just_pressed("water_key"):
		if Global.water_unlocked:
			Global.fire = false
			Global.water = true
			Global.earth = false
			$hud_sprite2.modulate.a = 1
	elif Input.is_action_just_pressed("earth_key"):
		if Global.earth_unlocked:
			Global.fire = false
			Global.water = false
			Global.earth = true
			$hud_sprite3.modulate.a = 1
	
	if Global.mana == 13:      #parte do script q ve os bagui da mana kkkkkkkk fodase
		$manabar.set_frame(0)
	elif Global.mana == 12:
		$manabar.set_frame(1)
	elif Global.mana == 11:
		$manabar.set_frame(2)
	elif Global.mana == 10:
		$manabar.set_frame(3)
	elif Global.mana == 9:
		$manabar.set_frame(4)
	elif Global.mana == 8:
		$manabar.set_frame(5)
	elif Global.mana == 7:
		$manabar.set_frame(6)
	elif Global.mana == 6:
		$manabar.set_frame(7)
	elif Global.mana == 5:
		$manabar.set_frame(8)
	elif Global.mana == 4:
		$manabar.set_frame(9)
	elif Global.mana == 3:
		$manabar.set_frame(10)
	elif Global.mana == 2:
		$manabar.set_frame(11)
	elif Global.mana == 1:
		$manabar.set_frame(12)
	elif Global.mana == 0:
		$manabar.set_frame(13)
