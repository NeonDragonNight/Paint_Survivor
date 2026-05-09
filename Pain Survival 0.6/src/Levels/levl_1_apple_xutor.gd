extends Node2D

var char_path
var char_type

var char_abilitys = []

var pause : PackedScene = load("res://src/Menu/pause_menu.tscn")


func _ready():
	Engine.time_scale = 1
	
	var char : PackedScene = load(char_path)
	var spawner : PackedScene = load("res://src/Enemis/levl1/spawner_lvl_1_v_2.tscn")
	
	var new_char = char.instantiate()
	var new_spawner = spawner.instantiate()
	
	new_char.abilitys = char_abilitys
	
	new_char.add_child(new_spawner)
	
	add_child(new_char)


func _process(delta):
	if Input.is_action_just_pressed("escape"):
		if Engine.time_scale:
			pauuse()

func pauuse():
	var player = get_node(char_type)
	
	var new_pause = pause.instantiate()
	new_pause.global_position = player.global_position
	
	new_pause.gold = player.coins
	new_pause.kils = player.kill
	
	add_child(new_pause)
