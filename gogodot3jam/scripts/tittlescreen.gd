extends Node2D


func _on_world_button_pressed():
	get_tree().change_scene("res://Scene/world.tscn")


func _on_training_room_button_pressed():
	get_tree().change_scene("res://Scene/training room.tscn")
