extends Node2D

var amount = 1
var might = 1
var cooldown = 1

var old_cooldown = 1

var bonus_dmg = 16


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


func stat_edit():
	if cooldown > old_cooldown:
		$Timer.wait_time /= cooldown
		old_cooldown = cooldown


func _ready():
	var player_node = get_node("..")
	var inventory = player_node.inventory
	player_node.max_shild_hp = 20
	
	#$"..".aura_node = get_node(".")
	#$"..".weapon_node_list[1] = get_node(".")
	#$"..".all_items[2].node = get_node(".")
	
	#var id = $"..".all_items[2].id
	
	#Динамичная запись нод в инвентарь #########################
	
	#var player_node = get_node("..")
	#var inventory = player_node.inventory
	for i in range(inventory.size()):
		if inventory[i].name == "evo_sword_a_spawner":
			$"..".inventory[i].node = get_node(".")
	
	#Динамичная запись нод в инвентарь #########################
	
	stat_check()
	
	
	#$".".scale *= 2


func _on_timer_timeout():
	const arow = preload("res://src/Weapons/sword_a.tscn")
	var new_arow = arow.instantiate()
	new_arow.damag += bonus_dmg
	new_arow.might = might

	$".".add_child(new_arow)


func lvl_up(up):
	print("sword lvl up")


#func _on_test_timeout():
	#print($".".scale)
