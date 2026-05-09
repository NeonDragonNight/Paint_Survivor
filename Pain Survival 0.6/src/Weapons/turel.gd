extends Area2D

var amount = 1
var might = 1

var cooldown = 1

var bonus_damag = 0
var bonus_amount = 0



#func _ready():
	#$"..".ttest(get_node("."))

#var inventory = $"..".inventory

var player_node
var base_timer
var first_base_timer

func _ready():
	base_timer = $Timer.wait_time
	first_base_timer = base_timer
	
	#$Timer.wait_time /= 5
	
	player_node = get_node("..")
	var inventory = player_node.inventory
	#$"..".aura_node = get_node(".")
	#$"..".weapon_node_list[1] = get_node(".")
	$"..".all_items[0].node = get_node(".")
	
	var id = $"..".all_items[0].id
	for i in range(inventory.size()):
		if id == inventory[i].id:
			$"..".inventory[i].node = get_node(".")


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
	
	const arow = preload("res://src/Weapons/turel_arow_v_2.tscn")#("res://src/xlam/bullet_2d.tscn")#("res://src/Weapons/turel_arow.tscn")#
	var new_arow = arow.instantiate()
	new_arow.global_transform = global_transform
	
	new_arow.might = might
	new_arow.dmg += bonus_damag
	
	#new_arow.global_rotation = global_rotation
	
	add_child(new_arow)
	#add_sibling(new_arow)


func _on_timer_timeout() -> void:
	#shoot()
	for i in range(amount + bonus_amount):
		shoot()
	

var bonus_culd = 0
var item_levl = 1
func lvl_up(up):
	item_levl += up
	
	if item_levl == 2:
		#$Timer.wait_time = base_timer / 1.2
		base_timer = first_base_timer * 0.9
		stat_check()
	elif item_levl == 3:
		bonus_damag = 2
	elif item_levl == 4:
		#$Timer.wait_time = base_timer / 1.2
		base_timer = first_base_timer * 0.8
		stat_check()
	elif item_levl == 5:
		bonus_damag = 6
	elif item_levl == 6:
		bonus_amount += 1
	
var old_cooldown = 1
func stat_edit():
	if cooldown > old_cooldown:
		$Timer.wait_time /= cooldown
		old_cooldown = cooldown


var atak_range = 1
func stat_check():
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
		#$Timer.wait_time = base_timer / cooldown
		$Timer.wait_time = base_timer * (2-cooldown)
	
	if pl_atak_range > atak_range:
		atak_range = pl_atak_range
		$".".scale += (Vector2(1, 1) * (atak_range -1))
