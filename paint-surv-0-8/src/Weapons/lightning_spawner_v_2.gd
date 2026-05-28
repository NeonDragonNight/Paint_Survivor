extends Area2D

#@onready var player_node = get_node("..")
#
#func _ready():
	##var player_node = get_node("..")
	#var inventory = player_node.inventory
	#
	##$"..".aura_node = get_node(".")
	##$"..".weapon_node_list[1] = get_node(".")
	#$"..".all_items[4].node = get_node(".")
	#
	#var id = $"..".all_items[4].name
	#for i in range(inventory.size()):
		#if id == inventory[i].name:
			#$"..".inventory[i].node = get_node(".")
	
	
	#$".".scale *= 2
	

var amount = 1
var might = 1
var cooldown = 1

var old_cooldown = 1

var weapon_amount = 1

func stat_edit():
	if cooldown > old_cooldown:
		$Timer.wait_time /= cooldown
		old_cooldown = cooldown


var enemi_kords = Vector2(0, 0)
#func _process(_delta):
	#var enemies_in_range = get_overlapping_bodies()
	#if enemies_in_range.size() > 0:
		#var target_enemy = enemies_in_range.pick_random()
		#enemi_kords = target_enemy.global_position


#func shoot():
	##var enemies_in_range = get_overlapping_bodies()
	##if enemies_in_range.size() > 0:
		##var target_enemy = enemies_in_range.pick_random()
		##enemi_kords = target_enemy.global_position
	#
	#const arow = preload("res://src/Weapons/evo_rikoshet.tscn")
	#var new_arow = arow.instantiate()
	#new_arow.global_transform = global_transform
	#new_arow.kords = enemi_kords
	#
	#new_arow.might = might
	#
	##add_child(new_arow)
	#$"..".add_sibling(new_arow)


func _ready():
	var player_node = get_node("..")
	var inventory = player_node.inventory
	
	var ind = 4

	$"..".all_items[ind].node = get_node(".")
	
	var id = $"..".all_items[ind].id
	for i in range(inventory.size()):
		if id == inventory[i].id:
			$"..".inventory[i].node = get_node(".")


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
		$Timer.wait_time = base_timer / cooldown
	if pl_atak_range > atak_range:
		atak_range = pl_atak_range
		$".".scale += (Vector2(1, 1) * (atak_range -1))


func lvl_up(up):
	print("lightning lvl up")


func _on_timer_timeout():
	for i in range((amount + weapon_amount)):
		atack()


#func lvl_up(up):
	#print("ligh")
	

func atack():
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.pick_random()
		enemi_kords = target_enemy.global_position
	
	
	const arow = preload("res://src/Weapons/lightning.tscn")
	var new = arow.instantiate()
	
	#var x = randf_range(-500, 500)
	#var y = randf_range(-200, 200)
	
	#var paoition = $"..".global_position + Vector2(x, y)
	#enemi_kords
	var paoition = Vector2(enemi_kords)

	#$".".add_child(new_arow)
	#Vector2(x, y)
	
	new.global_position = paoition
	new.might = might
	$"..".add_sibling(new)


#func _on_test_timeout():
	#print($".".scale)
