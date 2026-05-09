extends Path2D


#var lvl_node = get_node("/root/level_1")
#@onready var lvl_node = get_node("/root/level_1") #tut menal<------------

#var levl_node_part = "/level_1/"
#var char_type # = "Player"
var player_node
var lvl_node


var sec = 0
var minut = 0


var mob1 = "res://src/Enemis/test1/test_enem_1.tscn"
var mob2 = "res://src/Enemis/shut_enemi_q_1.tscn"
var mob3 = "res://src/Enemis/test1/test_enem_2.tscn"


func _ready():
	player_node = get_node("..")
	
	lvl_node = player_node.get_node("..")
	#print(lvl_node)
	
	#print("spawner start")
	#print(player_node)
	#print(get_node(".."))


func vawe():
	#print("Vawe spawn")
	#var mob1 = "res://src/Enemis/enemi_q_1.tscn"
	
	if sec < 150:
		for i in range(1):
			#print("vave 1 start")
			spawn_mob(mob1)
	elif sec < 25:
		for i in range(5):
			spawn_mob(mob1)
	elif sec == 25:
		for i in range(2):
			spawn_mob(mob1)
	elif sec > 30:
		for i in range(3):
			spawn_mob(mob1)
	
	#var mobs_in_vave = 10#randi_range(1 , 3)
	#
	#for i in range(mobs_in_vave):
		#spawn_mob()
		
	


func spawn_mob(m_path):
	#player_node = "/root" + levl_node_part + char_type #tut menal<------------
	var mob_path = m_path
	
	%PathFollow2D.progress_ratio = randf()
	var mob : PackedScene = load(mob_path)
	var new_mob = mob.instantiate()
	new_mob.global_position = %PathFollow2D.global_position
	
	#var new_mob = mob.instantiate()
	#var new_mob = preload("res://src/Enemis/shut_enemi_q_1.tscn").instantiate()
	
	new_mob.player_node = player_node # "/root" + levl_node + char_type #"/root/level_1/Player"
	
	#add_child(new_mob)
	if lvl_node != null:
		lvl_node.add_child(new_mob)
	else :
		print("lvl null eror")


func _on_timer_timeout():
	sec += 5
	if sec == 60:
		sec = 0
		minut += 1
	
	vawe()
