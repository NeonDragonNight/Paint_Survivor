extends Node2D

var char_path
var char_type

var char_abilitys = []

var pause : PackedScene = load("res://src/Menu/pause_menu.tscn")

var sound_volume = 0


func _ready():
	Engine.time_scale = 1
	
	var char : PackedScene = load(char_path)
	var spawner : PackedScene = load("res://src/Outher/spawner_lvl_2_v_1.tscn")
	
	var new_char = char.instantiate()
	var new_spawner = spawner.instantiate()
	
	new_char.abilitys = char_abilitys
	
	new_char.add_child(new_spawner)
	
	add_child(new_char)
	
	$AudioStreamPlayer.volume_db = sound_volume - 12


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
	new_pause.sound_volume = sound_volume
	
	add_child(new_pause)


func win(coins, kill, minuts, secund):
	var menu = load("res://src/Menu/lvl win/lvl2_win_menu.tscn").instantiate()
	menu.gold = coins
	menu.kils = kill
	menu.surv_time = str(minuts) + ":" + str(secund)
	menu.sound_volume = sound_volume
	get_tree().root.add_child(menu)
	get_tree().current_scene.queue_free()
	get_tree().current_scene = menu
