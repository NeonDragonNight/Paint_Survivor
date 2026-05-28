extends Path2D



var player_node
var lvl_node

var sec = 0
var minut = 0

#var mob1 = "res://src/Enemis/test1/test_enem_1.tscn"
#var mob2 = "res://src/Enemis/shut_enemi_q_1.tscn"
#var mob3 = "res://src/Enemis/test1/test_enem_2.tscn"

var mob_list = ["res://src/Enemis/levl1/bat_1.tscn", "res://src/Enemis/levl1/wolk_1.tscn", 
	"res://src/Enemis/levl1/skel_1.tscn", "res://src/Enemis/levl1/snak_1.tscn", 
	"res://src/Enemis/levl1/bi_g_bat_1.tscn", "res://src/Enemis/levl1/big_skel_1.tscn",
	"res://src/Enemis/levl1/end.tscn"]


func _ready():
	player_node = get_node("..")
	
	lvl_node = player_node.get_node("..")


var deficolty = 1.0
func vawe():
	deficolty = 1.0 + minut * 0.08
	#print(deficolty)
	
	#if sec < 150:
		#for i in range(1):
			#spawn_mob(mob_list[5])
	
	#if sec == 2:
		#end_portal()
	
	
	match minut:
		0:
			for i in range(randi_range(0 , 1)):
				spawn_mob(mob_list[0])
		1, 2:
			for i in range(1):
				spawn_mob(mob_list[0])
		3:
			var ran = 1
			if randi_range(0 , 2) == 2:
				ran = 2
			for i in range(ran):
				spawn_mob(mob_list[0])
		4:
			if sec == 1: #Boss---------------
				spawn_mob(mob_list[4])
				
			for i in range(2):
				if randi_range(0 , 1) == 1:
					spawn_mob(mob_list[0])
				else : 
					spawn_mob(mob_list[3])
		5:
			for i in range(randi_range(2 , 3)):
				if randi_range(0 , 1) == 1:
					spawn_mob(mob_list[0])
				else : 
					spawn_mob(mob_list[3])
		6:
			for i in range(6):
				spawn_mob(mob_list[0])
		7:
			for i in range(6):
				if randi_range(0 , 1) == 1:
					spawn_mob(mob_list[0])
				else : 
					spawn_mob(mob_list[3])
		8:
			if minut == 8 && sec == 1: #Boss---------------
				spawn_mob(mob_list[5])
			
			for i in range(1):
				spawn_mob(mob_list[2])
		9:
			for i in range(1):
				if randi_range(0 , 1) == 1:
					spawn_mob(mob_list[0])
				else : 
					spawn_mob(mob_list[2])
		10:
			for i in range(randi_range(2 , 3)):
				if randi_range(0 , 1) == 1:
					spawn_mob(mob_list[0])
				else : 
					spawn_mob(mob_list[2])
		11:
			for i in range(6):
				spawn_mob(mob_list[2])
		12:
			for i in range(6):
				if randi_range(0 , 1) == 1:
					spawn_mob(mob_list[2])
				else : 
					spawn_mob(mob_list[1])
		13:
			if minut == 13 && sec == 1: #Boss---------------
				spawn_mob(mob_list[5])
			
			for i in range(1):
				spawn_mob(mob_list[2])
		14:
			if sec == 1: #Boss---------------
				spawn_mob(mob_list[4])
			for i in range(2):
				spawn_mob(mob_list[7])
		15,16,17,18:
			for i in range(8):
				spawn_mob(mob_list[7])
		19:
			for i in range(2):
				spawn_mob(mob_list[7])
		20:
			if sec == 1: #End---------------
				spawn_mob(mob_list[0])
				end_portal()
		_:
			pass
	
	
	#---------------------------------------------------------------------
	#15.04.2026
	#---------------------------------------------------------------------
	#if minut == 0:
		#for i in range(randi_range(0 , 1)):
			#spawn_mob(mob_list[0])
	#elif minut == 1 || minut == 2:
		#for i in range(1):
			#spawn_mob(mob_list[0])
	#
	#elif minut == 3:
		#var ran = 1
		#if randi_range(0 , 2) == 2:
			#ran = 2
		#for i in range(ran):
			#spawn_mob(mob_list[0])
	#
	#elif minut == 4 && sec == 1: #Boss---------------
		#spawn_mob(mob_list[4])
	#
	#elif minut == 4:
		#for i in range(2):
			#if randi_range(0 , 1) == 1:
				#spawn_mob(mob_list[0])
			#else : 
				#spawn_mob(mob_list[3])
	#elif minut == 5:
		#for i in range(randi_range(2 , 3)):
			#if randi_range(0 , 1) == 1:
				#spawn_mob(mob_list[0])
			#else : 
				#spawn_mob(mob_list[3])
	#
	#elif minut == 6:
		#for i in range(6):
			#spawn_mob(mob_list[0])
	#elif minut == 7:
		#for i in range(6):
			#if randi_range(0 , 1) == 1:
				#spawn_mob(mob_list[0])
			#else : 
				#spawn_mob(mob_list[3])
	#
	#elif minut == 8 && sec == 1: #Boss---------------
		#spawn_mob(mob_list[5])
	#elif minut == 8:
		#for i in range(1):
			#spawn_mob(mob_list[2])
	#
	#elif minut == 9:
		#for i in range(1):
			#if randi_range(0 , 1) == 1:
				#spawn_mob(mob_list[0])
			#else : 
				#spawn_mob(mob_list[2])
	#elif minut == 10:
		#for i in range(randi_range(2 , 3)):
			#if randi_range(0 , 1) == 1:
				#spawn_mob(mob_list[0])
			#else : 
				#spawn_mob(mob_list[2])
	#
	#elif minut == 11:
		#for i in range(6):
			#spawn_mob(mob_list[2])
	#elif minut == 12:
		#for i in range(6):
			#if randi_range(0 , 1) == 1:
				#spawn_mob(mob_list[2])
			#else : 
				#spawn_mob(mob_list[1])
	#
	#elif minut == 13 && sec == 1: #Boss---------------
		#spawn_mob(mob_list[5])
	#elif minut == 13:
		#for i in range(1):
			#spawn_mob(mob_list[2])
	#
	#elif minut == 14:
		#for i in range(2):
			#spawn_mob(mob_list[1])
	#
	#elif minut == 15:
		#spawn_mob(mob_list[7])
		#end_portal()
	#---------------------------------------------------------------------
	#15.04.2026
	#---------------------------------------------------------------------
	
	
	#if sec < 5:
		#for i in range(randi_range(1 , 2)):
			#spawn_mob(mob_list[0])
	#elif sec < 10:
		#for i in range(randi_range(2 , 5)):
			#spawn_mob(mob_list[3])
	#elif sec == 11:
		#spawn_mob(mob_list[4])
	
	
	#elif sec < 25:
		#for i in range(5):
			#spawn_mob(mob1)
	#elif sec == 25:
		#for i in range(2):
			#spawn_mob(mob1)
	#elif sec > 30:
		#for i in range(3):
			#spawn_mob(mob1)
	
	
	#var mobs_in_vave = 10#randi_range(1 , 3)
	#
	#for i in range(mobs_in_vave):
		#spawn_mob()
		
	


func spawn_mob(m_path):
	var mob_path = m_path
	
	%PathFollow2D.progress_ratio = randf()
	var mob : PackedScene = load(mob_path)
	var new_mob = mob.instantiate()
	new_mob.global_position = %PathFollow2D.global_position
	
	new_mob.player_node = player_node
	new_mob.healt *= deficolty
	new_mob.dmg *= deficolty
	
	if lvl_node != null:
		lvl_node.add_child(new_mob)
	else :
		print("lvl null eror")


func end_portal():
	var te : PackedScene = load("res://src/Outher/end_portal_1.tscn")
	var new_te = te.instantiate()
		
	var rand_x = -1
	if randi_range(0, 1) == 1:
		rand_x = 1
	var x = 150 * rand_x
		
	var rand_y = -1
	if randi_range(0, 1) == 1:
		rand_y = 1
	var y = 150 * rand_y
		
	var tp_area = Vector2(x, y)
		
	new_te.global_position = player_node.global_position + tp_area
	lvl_node.add_child(new_te)


func _on_timer_timeout():
	sec += 1
	if sec == 60:
		sec = 0
		minut += 1
	vawe()
