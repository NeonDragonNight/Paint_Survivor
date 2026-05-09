extends Node2D

var char_type = ""
var char_path_val = ""


var gold = 0
var kils = 0

var all_gold = 0
var all_kils = 0

var Complite_levels = {"lvl1": false, "lvl2": false, "lvl3": false}
var characters = {"knight": true, "archer": false, "monk": false, "mage": false}

var char_abilitys = []


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
	#DisplayServer.window_set_size(Vector2i(1152, 648))
	#progres_updated()
	progres_updated()
	
	$"main button".show()
	$char_selector.hide()
	$"levl selector".hide()
	$progres.hide()
	
	$char_menu.hide()
	
	$char_menu/knight.hide()
	
	#var test = {"t1": 1, "t2": 3, "t3": true}
	#print(test["t2"])
	#test["t2"] = 9
	#print(test["t2"])
	#if test["t3"]:
		#print(test["t1"])
	#print(11 * 0.25)
	
func complite_level(level):
	load_data()
	
	var data = {
		"all_gold": all_gold,
		"all_kils": all_kils,
		
		"lvl1": Complite_levels["lvl1"],
		"lvl2": Complite_levels["lvl2"],
		"lvl3": Complite_levels["lvl3"],
		
		"knight": characters["knight"],
		"archer": characters["archer"],
		"monk": characters["monk"],
		"mage": characters["mage"]
	}
	
	data[level] = true

	var json_string = JSON.stringify(data)

	var file = FileAccess.open("res://save.json", FileAccess.WRITE)
	file.store_string(json_string)
	file.close()


func save_data():
	var data = {
		"all_gold": all_gold,
		"all_kils": all_kils,
		"lvl1": Complite_levels["lvl1"],
		"lvl2": Complite_levels["lvl2"],
		"lvl3": Complite_levels["lvl3"],
		
		"knight": characters["knight"],
		"archer": characters["archer"],
		"monk": characters["monk"],
		"mage": characters["mage"]
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
		all_kils = data["all_kils"]
		Complite_levels["lvl1"] = data["lvl1"]
		Complite_levels["lvl2"] = data["lvl2"]
		Complite_levels["lvl3"] = data["lvl3"]
		
		characters["knight"] = data["knight"]
		characters["archer"] = data["archer"]
		characters["monk"] = data["monk"]
		characters["mage"] = data["mage"]
		
		#if ! Complite_levels["lvl1"]:
			#print("lvl 1 not")
		
		#print("load")
		#print(data["all_gold"]," | ", data["all_kils"])


func _process(delta):
	if Input.is_action_just_pressed("dev_levl"):
		if $"levl selector/test_lev1".visible == true:
			$"levl selector/test_lev1".hide()
		else :
			$"levl selector/test_lev1".show()


func _on_exit_pressed():
	get_tree().quit()


func _on_start_pressed():
	$char_selector.show()
	$"main button".hide()


func _on_back_main_pressed():
	$"main button".show()
	$char_selector.hide()


#func _on_test_char_pressed():
	#char_type = "Player"
	#char_path_val = "res://src/Player/player.tscn"
	#
	#$"levl selector".show()
	#$char_selector.hide()


func _on_night_char_pressed():
	char_type = "Knight"
	char_path_val = "res://src/Player/knight.tscn"
	
	#$"levl selector".show()
	
	char_abilitys = ["res://src/Player/knight/knight_skil_1.tscn", "res://src/Player/knight/knight_ult_1.tscn"]
	
	$char_menu/knight/mark1.global_position = $char_menu/knight/skil1.global_position
	$char_menu/knight/mark2.global_position = $char_menu/knight/ult1.global_position
	
	$char_menu.show()
	$char_menu/knight.show()
	
	$char_selector.hide()


func _on_back_player_select_pressed():
	$"levl selector".hide()
	$char_selector.show()

var level_scene
func _on_levl_1_pressed():
	level_scene = load("res://src/Levels/levl_1_apple_xutor.tscn").instantiate()
	load_lvl()


func _on_levl_2_pressed():
	level_scene = load("res://src/Levels/lvl_2_dead_lend.tscn").instantiate()
	load_lvl()


func _on_levl_3_pressed():
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
	$"main button".hide()
	$progres.show()


func _on_back_main_from_progres_pressed():
	$"main button".show()
	$progres.hide()


func _on_night_char_2_pressed():
	char_type = "Knight_test"
	char_path_val = "res://src/xlam/knight_test.tscn"
	
	$"levl selector".show()
	$char_selector.hide()



func _on_close_char_menu_pressed():
	$char_menu.hide()
	$char_menu/knight.hide()
	
	$char_selector.show()


func _on_next_pressed():
	$char_menu.hide()
	$char_menu/knight.hide()
	
	$"levl selector".show()


func _on_buttonskil_1_pressed():
	$char_menu/knight/mark1.global_position = $char_menu/knight/skil1.global_position
	char_abilitys[0] = "res://src/Player/knight/knight_skil_1.tscn"


func _on_buttonskil_2_pressed():
	$char_menu/knight/mark1.global_position = $char_menu/knight/skil2.global_position
	char_abilitys[0] = "res://src/Player/knight/knight_skil_2.tscn"
