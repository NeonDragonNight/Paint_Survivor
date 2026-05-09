extends Node2D

#var levl_node


var gold = 0
var kils = 0


func _ready():
	Engine.time_scale = 0
	
	$progres/gold/Label_gold.text = str(gold) + " -50%(" + str(int(gold * 0.5)) + ")"
	$progres/kils/Label_kils.text = str(kils)


func _process(delta):
	if Input.is_action_just_pressed("escape"):
		_on_returne_pressed()


func _on_main_menu_pressed():
	Engine.time_scale = 1
	#Ranshe------------------------------------------------------------------------
	#get_tree().change_scene_to_file("res://src/Menu/start_menu.tscn")
	#Ranshe------------------------------------------------------------------------
	
	#novae--------------------------------------------------------------------------
	var menu = load("res://src/Menu/start_menu.tscn").instantiate()
	menu.gold = int(gold * 0.5)
	menu.kils = kils
	
	get_tree().root.add_child(menu)
	get_tree().current_scene.queue_free()
	get_tree().current_scene = menu
	#novae--------------------------------------------------------------------------



func _on_returne_pressed():
	#var level = get_node(levl_node)
	#level.pause_presed = false
	
	Engine.time_scale = 1
	queue_free()
