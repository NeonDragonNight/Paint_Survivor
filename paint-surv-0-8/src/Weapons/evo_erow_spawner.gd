extends Area2D

var amount = 1
var might = 1

var cooldown = 1

var sound_volume = 0


@onready var base_timer = $Timer.wait_time
var atak_range = 1
func stat_check():
	var player_node = get_node("..")
	
	var pl_amount = player_node.amount
	var pl_might = player_node.might
	var pl_cooldown = player_node.cooldown
	var pl_atak_range = player_node.atak_range
	
	if pl_amount > amount:
		amount = pl_amount
	if pl_might > might:
		might = pl_might
	
	if pl_cooldown > cooldown:
		cooldown = pl_cooldown
		$Timer.wait_time = base_timer * (2-cooldown)
	if pl_atak_range > atak_range:
		atak_range = pl_atak_range
		$".".scale += (Vector2(1, 1) * (atak_range -1))


#func _ready():
	#$"..".ttest(get_node("."))

#var inventory = $"..".inventory
func _ready():
	
	#$Timer.wait_time /= 5
	
	var player_node = get_node("..")
	var inventory = player_node.inventory
	#$"..".aura_node = get_node(".")
	#$"..".weapon_node_list[1] = get_node(".")
	#$"..".all_items[0].node = get_node(".")
	#
	#var id = $"..".all_items[0].id
	#for i in range(inventory.size()):
		#if id == inventory[i].id:
			#$"..".inventory[i].node = get_node(".")
	
	#Динамичная запись нод в инвентарь #########################
	for i in range(inventory.size()):
		if inventory[i].name == "evo errov":
			$"..".inventory[i].node = get_node(".")
	#Динамичная запись нод в инвентарь #########################
	
	sound_volume = player_node.sound_volume
	stat_check()


#func _process(_delta):
	#var enemies_in_range = get_overlapping_bodies()
	#if enemies_in_range.size() > 0:
		#var target_enemy = enemies_in_range.front()
		#look_at(target_enemy.global_position)


func shoot():
	
	var enemies_in_range = get_overlapping_bodies()
	
	if enemies_in_range.size() > 0:
		#var target_enemy = enemies_in_range.front()
		var target_enemy = enemies_in_range.pick_random()
		look_at(target_enemy.global_position)
	
	const arow = preload("res://src/Weapons/evo_erow.tscn")#("res://src/xlam/bullet_2d.tscn")#("res://src/Weapons/turel_arow.tscn")#
	var new_arow = arow.instantiate()
	new_arow.global_transform = global_transform
	
	new_arow.might = might
	new_arow.sound_volume = sound_volume
	
	#new_arow.global_rotation = global_rotation
	
	add_child(new_arow)
	#add_sibling(new_arow)


func _on_timer_timeout() -> void:
	#shoot()
	for i in range(amount):
		shoot()
	

func lvl_up(up):
	print("turel lvl up")
	
var old_cooldown = 1
func stat_edit():
	if cooldown > old_cooldown:
		$Timer.wait_time /= cooldown
		old_cooldown = cooldown
