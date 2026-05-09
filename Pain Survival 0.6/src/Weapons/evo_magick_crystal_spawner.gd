extends Node2D

#@onready var player_node = get_node("..")

#func _ready():
	##var player_node = get_node("..")
	#var inventory = player_node.inventory
	#
	##$"..".aura_node = get_node(".")
	##$"..".weapon_node_list[1] = get_node(".")
	#$"..".all_items[3].node = get_node(".")
	#
	#var id = $"..".all_items[3].name
	#for i in range(inventory.size()):
		#if id == inventory[i].name:
			#$"..".inventory[i].node = get_node(".")
	#
	#
	##$".".scale *= 2
	

var amount = 1
var might = 1
var cooldown = 1

var old_cooldown = 1

var weap_amount = 0


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


var player_node
func _ready():
	player_node = get_node("..")
	var inventory = player_node.inventory
	
	#var ind = 5
#
	#$"..".all_items[ind].node = get_node(".")
	#
	#var id = $"..".all_items[ind].id
	#for i in range(inventory.size()):
		#if id == inventory[i].id:
			#$"..".inventory[i].node = get_node(".")
			
	#Динамичная запись нод в инвентарь #########################
	for i in range(inventory.size()):
		if inventory[i].name == "evo_magick_crystal":
			$"..".inventory[i].node = get_node(".")
	#Динамичная запись нод в инвентарь #########################
	
	
	for i in range((amount + weap_amount)):
		activ()


func lvl_up(up):
	print("magick crystal lvl up")


func _on_timer_timeout():
	for i in range((amount + weap_amount)):
		activ()
	#const arow = preload("res://src/Weapons/magic_turel.tscn")
	#var new = arow.instantiate()
#
	##$".".add_child(new_arow)
	#new.global_position = $"..".global_position
	#$"..".add_sibling(new)


func activ():
	const arow = preload("res://src/Weapons/evo_magick_crystal.tscn")
	var new = arow.instantiate()
	
	var spavn_area = Vector2(randi_range(-200, 200), randi_range(-200, 200))

	#$".".add_child(new_arow)
	new.global_position = $"..".global_position + spavn_area
	new.might = might
	
	new.player_node = player_node
	new.scale += (Vector2(1, 1) * (atak_range -1))
	
	$"..".add_sibling(new)


#func _on_test_timeout():
	#print($".".scale)
