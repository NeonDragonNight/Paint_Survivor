extends Path2D

var player_node
var lvl_node

var sec = 0
var minut = 0


var mob_list = ["res://src/Enemis/levl1/end.tscn", "res://src/Enemis/levl2/ghost_1.tscn", 
	"res://src/Enemis/levl2/big_ghost_1.tscn", "res://src/Enemis/levl2/sp_skel_1.tscn", 
	"res://src/Enemis/levl2/skel_wolk_1.tscn", "res://src/Enemis/levl2/big_skel_wolk_1.tscn",
	"res://src/Enemis/levl2/dead_ent_1.tscn"]


func _ready():
	player_node = get_node("..")
	
	lvl_node = player_node.get_node("..")


var deficolty = 1.0
func vawe():
	deficolty = 1.0 + minut * 0.08
	
	
	match minut:
		0:
			for i in range(randi_range(1 , 2)):
				spawn_mob(mob_list[1])
		1, 2:
			for i in range(2):
				spawn_mob(mob_list[1])
		3:
			for i in range(3):
				spawn_mob(mob_list[1])
		4:
			if sec == 1: #Boss---------------
				spawn_mob(mob_list[2])
				
			for i in range(2):
				if randi_range(0 , 1) == 1:
					spawn_mob(mob_list[1])
				else : 
					spawn_mob(mob_list[3])
		5:
			for i in range(randi_range(2 , 3)):
				if randi_range(0 , 1) == 1:
					spawn_mob(mob_list[1])
				else : 
					spawn_mob(mob_list[3])
		6:
			for i in range(6):
				spawn_mob(mob_list[1])
		7:
			for i in range(6):
				if randi_range(0 , 1) == 1:
					spawn_mob(mob_list[1])
				else : 
					spawn_mob(mob_list[3])
		8:
			if minut == 8 && sec == 1: #Boss---------------
				spawn_mob(mob_list[5])
			
			for i in range(1):
				spawn_mob(mob_list[4])
		9:
			for i in range(1):
				if randi_range(0 , 1) == 1:
					spawn_mob(mob_list[1])
				else : 
					spawn_mob(mob_list[4])
		10:
			for i in range(randi_range(2 , 3)):
				if randi_range(0 , 1) == 1:
					spawn_mob(mob_list[1])
				else : 
					spawn_mob(mob_list[3])
		11:
			for i in range(6):
				spawn_mob(mob_list[3])
		12:
			for i in range(6):
				if randi_range(0 , 1) == 1:
					spawn_mob(mob_list[2])
				else : 
					spawn_mob(mob_list[1])
		13:
			if sec == 1: #Boss---------------
				spawn_mob(mob_list[6])
			
			for i in range(1):
				spawn_mob(mob_list[4])
		14:
			for i in range(2):
				spawn_mob(mob_list[1])
		15:
			if sec == 1: #End---------------
				spawn_mob(mob_list[0])
				end_portal()
		_:
			pass


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
