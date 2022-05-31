extends Node

var criacao_no_pai = null

func instance_node(node, location, parent):
	var node_instance = node.instance()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance

var earth_wall_timer = false

var fire = false
var water = false
var earth = false

var fire_unlocked = true
var water_unlocked = true
var earth_unlocked = true

var mana = 13


