extends Node2D

@onready var player_node = get_node("..")


var amount = 1
var might = 1
var cooldown = 1

var old_cooldown = 1


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
	#var player_node = get_node("..")
	var inventory = player_node.inventory
	
	#$"..".aura_node = get_node(".")
	#$"..".weapon_node_list[1] = get_node(".")
	#$"..".all_items[3].node = get_node(".")
	#
	#var id = $"..".all_items[3].name
	#for i in range(inventory.size()):
		#if id == inventory[i].name:
			#$"..".inventory[i].node = get_node(".")
			
	#Динамичная запись нод в инвентарь #########################
	for i in range(inventory.size()):
		if inventory[i].name == "evo fire zon":
			$"..".inventory[i].node = get_node(".")
	#Динамичная запись нод в инвентарь #########################
	
	stat_check()
	
	
	#$".".scale *= 2


func _on_timer_timeout():
	const arow = preload("res://src/Weapons/evo_fire_zone.tscn")
	var new = arow.instantiate()

	#$".".add_child(new_arow)
	new.global_position = $"..".global_position
	new.might = might
	new.scale += (Vector2(1, 1) * (atak_range -1))
	$"..".add_sibling(new)


func lvl_up(up):
	print("Fire zone")


#func _on_test_timeout():
	#print($".".scale)
