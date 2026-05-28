extends Node2D

var amount = 1
var might = 1
var cooldown = 1

var atak_range = 1

var bonus_atak_range = 0
var bonus_rotation_spid = 0


var damag = 4

#var old_cooldown = 1
#func stat_edit():
	#if cooldown > old_cooldown:
		#$Timer.wait_time /= cooldown
		#old_cooldown = cooldown


var player_node
var base_timer
func _ready():
	base_timer = $Timer.wait_time
	player_node = get_node("..")
	var inventory = player_node.inventory
	
	#$"..".aura_node = get_node(".")
	#$"..".weapon_node_list[1] = get_node(".")
	$"..".all_items[2].node = get_node(".")
	
	var id = $"..".all_items[2].id
	for i in range(inventory.size()):
		if id == inventory[i].id:
			$"..".inventory[i].node = get_node(".")
	
	stat_check()
	
	
	#$".".scale *= 2


func _on_timer_timeout():
	const arow = preload("res://src/Weapons/sword_a.tscn")
	var new_arow = arow.instantiate()
	new_arow.might = might
	new_arow.amount = amount
	
	new_arow.damag += damag
	new_arow.rotation_spid += bonus_rotation_spid
	
	new_arow.sound_volume = player_node.sound_volume

	$".".add_child(new_arow)
	#print($Timer.wait_time)
	#print(cooldown)


var item_levl = 1
func lvl_up(up):
	#print("sword lvl up")
	
	item_levl += up
	
	if item_levl == 2:
		damag += 2
		print("sword dmg+2")
	elif item_levl == 3:
		$".".scale += ($".".scale * 0.2)
	elif item_levl == 4:
		bonus_rotation_spid = 3
	elif item_levl == 5:
		damag += 8
	elif item_levl == 6:
		$".".scale += ($".".scale * 0.2)
		bonus_rotation_spid = 6


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
		
	#print("dmg: ", damag)
	
		#print("range: ", $".".scale, " | ", (Vector2(1, 1) * (atak_range -1)))
		#print("3*(2-1.1)", 3*(2-1.1))
		#print("3*(2-1.1)", 3*(2-1.1))


#func _on_test_timeout():
	#print($".".scale)
