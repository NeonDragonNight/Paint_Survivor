extends Path2D


#var lvl_node = get_node("/root/level_1")
@onready var lvl_node = get_node("/root/level_1")

var levl_node_part = "/level_1/"
var char_type # = "Player"
var player_node


func spawn_mob():
	#%PathFollow2D.progress_ratio = randf()
	#var new_mob = preload("res://src/Items/exp_1.tscn").instantiate()
	#new_mob.global_position = %PathFollow2D.global_position
	#if lvl_node != null:
		#lvl_node.add_child(new_mob)
		
	
	player_node = "/root" + levl_node_part + char_type
	
	%PathFollow2D.progress_ratio = randf()
	var new_mob = preload("res://src/Enemis/enemi_q_1.tscn").instantiate()
	new_mob.global_position = %PathFollow2D.global_position
	
	#var new_mob = mob.instantiate()
	#var new_mob = preload("res://src/Enemis/shut_enemi_q_1.tscn").instantiate()
	
	new_mob.player_node = player_node # "/root" + levl_node + char_type #"/root/level_1/Player"
	
	#add_child(new_mob)
	if lvl_node != null:
		lvl_node.add_child(new_mob)


func _on_timer_timeout():
	
	var mobs_in_vave = 10#randi_range(1 , 3)
	
	for i in range(mobs_in_vave):
		spawn_mob()
