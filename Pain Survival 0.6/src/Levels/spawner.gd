extends Node2D
#
##var mob : PackedScene = load("res://src/Enemis/enemi_q_1.tscn")
#var mob : PackedScene = load("res://src/Enemis/shut_enemi_q_1.tscn")
#
#var levl_node = "/level_1/" #"/level_1/player_spawner/"#/level_1/
#var char_type # = "Player"
#var player_node
#
#
#var sykl = 0
#
#func start():
	#
	#player_node = "/root" + levl_node + char_type
	#
	#var new_mob = mob.instantiate()
	#
	#new_mob.player_node = player_node # "/root" + levl_node + char_type #"/root/level_1/Player"
	#
	#add_child(new_mob)
	#
	##$wait_start.stop()
	#sykl += 1
	#if sykl == 3:
		#$wait_start.stop()
#
#func _ready():
	##player_node = "/root" + levl_node + char_type
	#
	##start()
	#
	#$wait_start.start()
#
#
#func _on_wait_start_timeout():
	#start()

#var test = 0
#func _on_wait_start_timeout():
	#print("a ", test)
	#test += 1
