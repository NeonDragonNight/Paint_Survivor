extends Node2D

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





func _ready():
	var player_node = get_node("..")
	var inventory = player_node.inventory
	
	var ind = 4

	$"..".all_items[ind].node = get_node(".")
	
	var id = $"..".all_items[ind].id
	for i in range(inventory.size()):
		if id == inventory[i].id:
			$"..".inventory[i].node = get_node(".")


func lvl_up(up):
	print("lightning lvl up")


func _on_timer_timeout():
	for i in range((amount + weapon_amount)):
		atack()


#func lvl_up(up):
	#print("ligh")
	

func atack():
	const arow = preload("res://src/Weapons/lightning.tscn")
	var new = arow.instantiate()
	
	var x = randf_range(-500, 500)
	var y = randf_range(-200, 200)
	
	var paoition = $"..".global_position + Vector2(x, y)

	#$".".add_child(new_arow)
	#Vector2(x, y)
	
	new.global_position = paoition
	new.might = might
	$"..".add_sibling(new)


#func _on_test_timeout():
	#print($".".scale)
