extends Node2D

var char_path
var char_type

var pause : PackedScene = load("res://src/Menu/pause_menu.tscn")

#var pause_presed = false

func _ready():
	Engine.time_scale = 1
	
	var char : PackedScene = load(char_path)
	#var spawner : PackedScene = load("res://src/Outher/spawner1.tscn")
	var spawner : PackedScene = load("res://src/Outher/spawner_lvl_1_v_1.tscn")
	
	var new_char = char.instantiate()
	var new_spawner = spawner.instantiate()
	
	#new_spawner.char_type = char_type
	
	new_char.add_child(new_spawner)
	
	add_child(new_char)
	
	#new_char.add_aura()
	
	#print(get_node("/root/level_1"))

func _process(delta):
	if Input.is_action_just_pressed("escape"):
		#if ! pause_presed:
		if Engine.time_scale:
			pauuse()

func pauuse():
	
	var player = get_node("/root/level_1/" + char_type)
	
	#pause_presed = true
	
	var new_pause = pause.instantiate()
	#new_pause.levl_node = "/root/level_1"
	new_pause.global_position = player.global_position
	add_child(new_pause)
