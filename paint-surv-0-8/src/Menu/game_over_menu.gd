extends Node2D


var gold = 0
var kils = 0
var surv_time = "0"
var sound_volume = 0


func _ready():
	$Label.text = str(int(gold * 0.5)) + "-50%"
	$Label2.text = str(kils)
	$"surv time".text = "Прожито часу - " + surv_time
	$main_menu_ost.volume_db = sound_volume
	$button_able.volume_db = sound_volume


func _on_button_pressed():
	$button_able.play()
	$queue_fr.start()


func _on_queue_fr_timeout():
	var menu = load("res://src/Menu/start_menu.tscn").instantiate()
	menu.gold = int(gold * 0.5)
	menu.kils = kils
	
	get_tree().root.add_child(menu)
	get_tree().current_scene.queue_free()
	get_tree().current_scene = menu
