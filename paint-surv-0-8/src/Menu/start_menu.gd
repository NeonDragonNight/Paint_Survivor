extends Node2D

var char_type = ""
var char_path_val = ""


var gold = 0
var kils = 0

var all_gold = 0
var all_kils = 0

var all_time_gold = 0

var Complite_levels = {"lvl1": false, "lvl2": false, "lvl3": false}
var characters = {"knight": true, "archer": false, "monk": false, "mage": false}

var char_abilitys = []
var char_abilitys_unlock = {"knight": {"skil2": false, "skil3": false, "ult2": false}, 
	"archer": {"skil2": false, "skil3": false, "ult2": false}, 
	"monk": {"skil2": false, "skil3": false, "ult2": false}, 
	"mage": {"skil2": false, "skil3": false, "ult2": false}}


func progres_updated():
	load_data()
	
	all_gold += gold
	all_kils += kils
	
	$progres/gold/Label_gold.text = str(all_gold)
	$progres/kils/Label_kils.text = str(all_kils)
	
	$progres/Label3/lvl1.hide()
	$progres/Label3/lvl2.hide()
	$progres/Label3/lvl3.hide()
	if Complite_levels["lvl1"]:
		$progres/Label3/lvl1.show()
	if Complite_levels["lvl2"]:
		$progres/Label3/lvl2.show()
	if Complite_levels["lvl3"]:
		$progres/Label3/lvl3.show()
	
	save_data()


func _ready():
	progres_updated()
	
	$"main button".show()
	$char_selector.hide()
	$"levl selector".hide()
	$progres.hide()
	
	$char_menu.hide()
	
	$char_menu/knight.hide()
	$char_menu/archer.hide()
	$char_menu/monk.hide()
	
	if characters["archer"]:
		$char_selector/archer_unlock.hide()
	else :
		$char_selector/archer_unlock.show()
	if characters["monk"]:
		$char_selector/monk_unlock.hide()
	else :
		$char_selector/monk_unlock.show()
	
	fullscreen_tougle()
	$"main button/HSlider".value = sound_volume


func complite_level(level):
	load_data()
	Complite_levels[level] = true
	save_data()


func save_data():
	var data = {
		"all_gold": all_gold,
		"all_time_gold": all_time_gold,
		"all_kils": all_kils,
		
		"lvl1": Complite_levels["lvl1"],
		"lvl2": Complite_levels["lvl2"],
		"lvl3": Complite_levels["lvl3"],
		
		"knight": characters["knight"],
		"archer": characters["archer"],
		"monk": characters["monk"],
		"mage": characters["mage"],
		
		"char_abilitys_unlock": char_abilitys_unlock,
		
		"fullscreen": fullscreen,
		"sound_volume": sound_volume,
	}

	var json_string = JSON.stringify(data)

	var file = FileAccess.open("res://save.json", FileAccess.WRITE)
	file.store_string(json_string)
	file.close()


func load_data():
	if not FileAccess.file_exists("res://save.json"):
		return

	var file = FileAccess.open("res://save.json", FileAccess.READ)
	var json_string = file.get_as_text()
	file.close()

	var json = JSON.new()
	var result = json.parse(json_string)

	if result == OK:
		var data = json.data

		all_gold = data["all_gold"]
		all_time_gold = data["all_time_gold"]
		all_kils = data["all_kils"]
		Complite_levels["lvl1"] = data["lvl1"]
		Complite_levels["lvl2"] = data["lvl2"]
		Complite_levels["lvl3"] = data["lvl3"]
		
		characters["knight"] = data["knight"]
		characters["archer"] = data["archer"]
		characters["monk"] = data["monk"]
		characters["mage"] = data["mage"]
		
		char_abilitys_unlock = data["char_abilitys_unlock"]
		
		fullscreen = data["fullscreen"]
		sound_volume = data["sound_volume"]


func _process(delta):
	if Input.is_action_just_pressed("dev_levl"):
		if $"levl selector/test_lev1".visible == true:
			$"levl selector/test_lev1".hide()
		else :
			$"levl selector/test_lev1".show()


func _on_exit_pressed():
	save_data()
	$sounds/button_able.play()
	$quit_delate.start()
	#get_tree().quit()


func _on_start_pressed():
	$sounds/button_able.play()
	$char_selector.show()
	$"main button".hide()


func _on_back_main_pressed():
	$sounds/button_able.play()
	$"main button".show()
	$char_selector.hide()


#func _on_test_char_pressed():
	#char_type = "Player"
	#char_path_val = "res://src/Player/player.tscn"
	#
	#$"levl selector".show()
	#$char_selector.hide()


func _on_night_char_pressed():
	$sounds/button_able.play()
	char_type = "Knight"
	char_path_val = "res://src/Player/knight.tscn"
	
	#$"levl selector".show()
	
	char_abilitys = ["res://src/Player/knight/knight_skil_1.tscn", "res://src/Player/knight/knight_ult_1.tscn"]
	
	$char_menu/knight/mark1.global_position = $char_menu/knight/skil1.global_position
	$char_menu/knight/mark2.global_position = $char_menu/knight/ult1.global_position
	
	$char_menu.show()
	$char_menu/knight.show()
	
	$char_menu/knight.unlock_check()
	
	$char_selector.hide()


func _on_archer_char_pressed():
	$sounds/button_able.play()
	char_type = "Archer"
	char_path_val = "res://src/Player/archer.tscn"
	
	char_abilitys = ["res://src/Player/archer/archer_skil_1.tscn", "res://src/Player/archer/archer_ult_1.tscn"]
	
	$char_menu/archer/mark1.global_position = $char_menu/archer/skil1.global_position
	$char_menu/archer/mark2.global_position = $char_menu/archer/ult1.global_position
	
	$char_menu.show()
	$char_menu/archer.show()
	
	$char_menu/archer.unlock_check()
	
	$char_selector.hide()


func _on_monk_char_pressed():
	$sounds/button_able.play()
	char_type = "Monk"
	char_path_val = "res://src/Player/monk/monk.tscn"
	
	char_abilitys = ["res://src/Player/monk/monk_skil_1.tscn", "res://src/Player/monk/monk_ult_1.tscn"]
	
	$char_menu/monk/mark1.global_position = $char_menu/monk/skil1.global_position
	$char_menu/monk/mark2.global_position = $char_menu/monk/ult1.global_position
	
	$char_menu.show()
	$char_menu/monk.show()
	
	$char_menu/monk.unlock_check()
	
	$char_selector.hide()


func _on_back_player_select_pressed():
	$sounds/button_able.play()
	$"levl selector".hide()
	$char_selector.show()

var level_scene
func _on_levl_1_pressed():
	save_data()
	$sounds/button_able.play()
	level_scene = load("res://src/Levels/levl_1_apple_xutor.tscn").instantiate()
	load_lvl()


func _on_levl_2_pressed():
	if not $"levl selector/lock_lvl2".visible:
		save_data()
		$sounds/button_able.play()
		level_scene = load("res://src/Levels/lvl_2_dead_lend.tscn").instantiate()
		load_lvl()


func _on_levl_3_pressed():
	if not $"levl selector/lock_lvl3".visible:
		save_data()
		$sounds/button_able.play()
		level_scene = load("res://src/Levels/lvl_3_terr_peaks.tscn").instantiate()
		load_lvl()


func load_lvl():
	# Передача значения в узел spawner
	#var spawner = level_scene.get_node("spawner")
	#spawner.char_type = char_type
	var player_spawner = level_scene.get_node(".")#"/root/level_1"
	player_spawner.char_path = char_path_val
	player_spawner.char_type = char_type
	player_spawner.char_abilitys = char_abilitys
	
	player_spawner.sound_volume = sound_volume
	
	
	#if spawner:
		#spawner.char_type = char_type  # если переменная
		# или, если метод
		# spawner.set_char_type(char_type)
	
	get_tree().root.add_child(level_scene)
	get_tree().current_scene.queue_free()
	get_tree().current_scene = level_scene


func _on_test_lev_1_pressed():
	level_scene = load("res://src/xlam/test_level_2.tscn").instantiate()
	load_lvl()


func _on_progres_pressed():
	$sounds/button_able.play()
	$"main button".hide()
	$progres.show()


func _on_back_main_from_progres_pressed():
	$sounds/button_able.play()
	$"main button".show()
	$progres.hide()


func _on_archer_unlock_pressed():
	if $".".all_gold > 5000:
		$sounds/button_able.play()
		$".".all_gold -= 5000
		
		characters["archer"] = true
		$char_selector/archer_unlock.hide()
		$".".save_data()
	else :
		$sounds/button_disable.play()
		$char_selector/button_anim.start()
		$char_selector/archer_unlock.modulate = Color(0.6, 0, 0)


func _on_monk_unlock_pressed():
	if $".".all_gold > 10000:
		$sounds/button_able.play()
		$".".all_gold -= 10000
		
		characters["monk"] = true
		$char_selector/monk_unlock.hide()
		$".".save_data()
	else :
		$sounds/button_disable.play()
		$char_selector/button_anim.start()
		$char_selector/monk_unlock.modulate = Color(0.6, 0, 0)


func _on_button_anim_timeout():
	$char_selector/archer_unlock.modulate = Color(1, 1, 1)
	$char_selector/monk_unlock.modulate = Color(1, 1, 1)


func _on_test_pressed():
	all_gold += 10000
	save_data()
	progres_updated()
	#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	pass


var full_scr_img = preload("res://graphic/Buttons textures/main menu/scren mode/foolscr.png")
var norm_scr_img = preload("res://graphic/Buttons textures/main menu/scren mode/normalscr.png")

var fullscreen = false


func fullscreen_tougle():
	if not fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		$"main button/screen_mode".texture_normal = full_scr_img
	else :
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		$"main button/screen_mode".texture_normal = norm_scr_img


func _on_screen_mode_pressed():
	$sounds/button_able.play()
	var mode = DisplayServer.window_get_mode()
	if mode == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		$"main button/screen_mode".texture_normal = full_scr_img
		fullscreen = false
	else :
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		$"main button/screen_mode".texture_normal = norm_scr_img
		fullscreen = true
	save_data()


func _on_quit_delate_timeout():
	get_tree().quit()

var sound_volume = 0
func _on_h_slider_value_changed(value):
	sound_volume = value
	$sounds/button_able.volume_db = sound_volume
	$sounds/button_disable.volume_db = sound_volume -12
	$sounds/main_menu_ost.volume_db = sound_volume


func _on_sound_resrt_pressed():
	$sounds/button_able.play()
	$"main button/HSlider".value = 0
