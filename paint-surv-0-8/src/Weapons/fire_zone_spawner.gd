extends Node2D

@onready var player_node = get_node("..")


var amount = 1
var might = 1
var cooldown = 1

var live_time = 5

var old_cooldown = 1

var damage = 0

var sound_volume = 0

func stat_edit():
	if cooldown > old_cooldown:
		$Timer.wait_time /= cooldown
		old_cooldown = cooldown


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


func _ready():
	sound_volume = player_node.sound_volume
	#var player_node = get_node("..")
	var inventory = player_node.inventory
	
	#$"..".aura_node = get_node(".")
	#$"..".weapon_node_list[1] = get_node(".")
	$"..".all_items[3].node = get_node(".")
	
	var id = $"..".all_items[3].name
	for i in range(inventory.size()):
		if id == inventory[i].name:
			$"..".inventory[i].node = get_node(".")
	
	
	#$".".scale *= 2

var bonus_atak_range = Vector2(0, 0)
func _on_timer_timeout():
	#print("fire scail: ", $".".scale)
	
	const arow = preload("res://src/Weapons/danger_zone.tscn")
	var new = arow.instantiate()

	#$".".add_child(new_arow)
	new.global_position = $"..".global_position
	new.might = might
	
	new.live_time = live_time
	new.damage += damage
	
	new.atak_range = atak_range
	new.bonus_atak_range = bonus_atak_range
	
	new.sound_volume = sound_volume
	
	$"..".add_sibling(new)


var item_levl = 1
func lvl_up(up):
	item_levl += up
	
	if item_levl == 2:
		bonus_atak_range += (Vector2(1, 1) * 0.2)
	elif item_levl == 3:
		live_time += 3
	elif item_levl == 4:
		damage = 2
	elif item_levl == 5:
		live_time += 6
	elif item_levl == 6:
		bonus_atak_range += (Vector2(1, 1) * 0.2)


#func _on_test_timeout():
	#print($".".scale)
