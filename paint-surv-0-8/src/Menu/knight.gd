extends Node2D


#var all_gold = 0
var char_abilitys_unlock = {}


func _ready():
	#all_gold = $"../..".all_gold
	char_abilitys_unlock = $"../..".char_abilitys_unlock


func _on_close_char_menu_pressed():
	$"../../sounds/button_able".play()
	$"..".hide()
	$".".hide()
	
	$"../../char_selector".show()


func _on_next_pressed():
	$"../../sounds/button_able".play()
	$"..".hide()
	$".".hide()
	
	var lvl_compl = $"../..".Complite_levels
	if lvl_compl["lvl1"]:
		$"../../levl selector/lock_lvl2".hide()
	if lvl_compl["lvl2"]:
		$"../../levl selector/lock_lvl3".hide()
	
	$"../../levl selector".show()


func _on_buttonskil_1_pressed():
	$"../../sounds/button_able".play()
	$mark1.global_position = $skil1.global_position
	$"../..".char_abilitys[0] = "res://src/Player/knight/knight_skil_1.tscn"


func _on_buttonskil_2_pressed():
	$"../../sounds/button_able".play()
	$mark1.global_position = $skil2.global_position
	$"../..".char_abilitys[0] = "res://src/Player/knight/knight_skil_2.tscn"


func _on_buttonskil_3_pressed():
	$"../../sounds/button_able".play()
	$mark1.global_position = $skil3.global_position
	$"../..".char_abilitys[0] = "res://src/Player/knight/knight_skil_3.tscn"


func _on_buttonult_1_pressed():
	$"../../sounds/button_able".play()
	$mark2.global_position = $ult1.global_position
	$"../..".char_abilitys[1] = "res://src/Player/knight/knight_ult_1.tscn"


func _on_buttonult_2_pressed():
	$"../../sounds/button_able".play()
	$mark2.global_position = $ult2.global_position
	$"../..".char_abilitys[1] = "res://src/Player/knight/knight_ult_2.tscn"


#func _on_test_pressed():
	#$".".scale *= 2


func unlock_check():
	if char_abilitys_unlock["knight"]["skil2"]:
		$skil2_unlock.hide()
	if char_abilitys_unlock["knight"]["skil3"]:
		$skil3_unlock.hide()
	if char_abilitys_unlock["knight"]["ult2"]:
		$ult2_unlock.hide()


func _on_skil_2_unlock_pressed():
	if $"../..".all_gold > 10000:
		$"../../sounds/button_able".play()
		$"../..".all_gold -= 10000
		
		char_abilitys_unlock["knight"]["skil2"] = true
		$skil2_unlock.hide()
		$"../..".save_data()
	else :
		$"../../sounds/button_disable".play()
		$Timer.start()
		$skil2_unlock.modulate = Color(0.6, 0, 0)


func _on_skil_3_unlock_pressed():
	if $"../..".all_gold > 15000:
		$"../../sounds/button_able".play()
		$"../..".all_gold -= 15000
		
		char_abilitys_unlock["knight"]["skil3"] = true
		$skil3_unlock.hide()
		$"../..".save_data()
	else :
		$"../../sounds/button_disable".play()
		$Timer.start()
		$skil3_unlock.modulate = Color(0.6, 0, 0)


func _on_ult_2_unlock_pressed():
	if $"../..".all_gold > 25000:
		$"../../sounds/button_able".play()
		$"../..".all_gold -= 25000
		
		char_abilitys_unlock["knight"]["ult2"] = true
		$ult2_unlock.hide()
		$"../..".save_data()
	else :
		$"../../sounds/button_disable".play()
		$Timer.start()
		$ult2_unlock.modulate = Color(0.6, 0, 0)


func _on_timer_timeout():
	$skil2_unlock.modulate = Color(1, 1, 1)
	$skil3_unlock.modulate = Color(1, 1, 1)
	$ult2_unlock.modulate = Color(1, 1, 1)


func _on_test_resrt_pressed():
	char_abilitys_unlock["knight"]["skil2"] = false
	char_abilitys_unlock["knight"]["skil3"] = false
	char_abilitys_unlock["knight"]["ult2"] = false
	$"../..".save_data()
