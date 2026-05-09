extends Node2D


var gold = 0
var kils = 0
var surv_time = "0"


func _ready():
	$Label.text = str(int(gold * 0.5)) + "-50%"
	$Label2.text = str(kils)
	$"surv time".text = "Прожито часу - " + surv_time


func _on_button_pressed():
	var menu = load("res://src/Menu/start_menu.tscn").instantiate()
	menu.gold = int(gold * 0.5)
	menu.kils = kils
	
	get_tree().root.add_child(menu)
	get_tree().current_scene.queue_free()
	get_tree().current_scene = menu
	
#func _ready():
	#DisplayServer.window_set_size(Vector2i(496, 352))
