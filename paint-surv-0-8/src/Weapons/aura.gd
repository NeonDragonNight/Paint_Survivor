extends Area2D


var mob_list := []

var damage = 1

var aura_levl = 1


var amount = 1
var might = 1
var cooldown = 1

var atak_range = 1

#var inventory = $"..".inventory


#func _process(delta):
	#pass

var player_node
func _ready():
	player_node = get_node("..")
	var inventory = player_node.inventory
	
	#$"..".aura_node = get_node(".")
	#$"..".weapon_node_list[1] = get_node(".")
	$"..".all_items[1].node = get_node(".")
	
	var id = $"..".all_items[1].id
	for i in range(inventory.size()):
		if id == inventory[i].id:
			$"..".inventory[i].node = get_node(".")
	
	stat_check()
	
	#print()
	#print("aura redy")
	#print()
	
	#$"..".inventory[1].node = get_node(".")


func stat_edit():
	damage *= might
	print("aura dmg" + str(damage))


func _on_area_entered(area):
	if area not in mob_list:
		mob_list.append(area)


func _on_damag_interval_timeout():
	for mob in mob_list:
		if mob.has_method("take_damag"):
			mob.take_damag(damage)


func _on_area_exited(area):
	if area in mob_list:
		mob_list.erase(area)


#func aura_lvl_up(up):
	#print("aura lvl up")
	#
	#aura_levl += up
	#if aura_levl == 1:
		#damage = 10


func lvl_up(up):
	aura_levl += up
	
	#print("aura lvl ", aura_levl)
	#print()
	
	#if aura_levl == 1:
		#$".".show()
		#$damag_interval.start()
	if aura_levl == 2:
		#print("aura lvl 2 +1 dmg")
		damage += 0.5
	elif aura_levl == 3:
		#print("aura lvl 3 range *1.2")
		$".".scale *= 1.2
	elif aura_levl == 4:
		#print("aura lvl 4 +1 dmg")
		damage += 1
	elif aura_levl == 5:
		#print("aura lvl 5 +1 dmg")
		damage += 2
	elif aura_levl == 6:
		#print("aura lvl 6 +1 dmg, range *1.4")
		$".".scale *= 1.2
	#elif aura_levl == 7:
		#print("aura lvl 7 ???")
		
	#print()


func stat_check():
	var pl_amount = player_node.amount
	var pl_might = player_node.might
	var pl_cooldown = player_node.cooldown
	var pl_atak_range = player_node.atak_range
	
	if pl_amount > amount:
		amount = pl_amount
	if pl_might > might:
		might = pl_might
	
	if pl_atak_range > atak_range:
		atak_range = pl_atak_range
		$".".scale += (Vector2(1, 1) * (atak_range -1))
