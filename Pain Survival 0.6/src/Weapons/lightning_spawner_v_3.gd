extends Area2D


var amount = 1
var might = 1
var cooldown = 1

var old_cooldown = 1

var weapon_amount = 1

var aim = false

func stat_edit():
	if cooldown > old_cooldown:
		$Timer.wait_time /= cooldown
		old_cooldown = cooldown


var bonus_dmg = 0
var item_levl = 1
func lvl_up(up):
	item_levl += up
	
	if item_levl == 2:
		bonus_dmg += 6
	elif item_levl == 3:
		#$Timer.wait_time = base_timer / 1.3
		#Test---------------------------------------------------
		base_timer /= 1.3
		$Timer.wait_time = base_timer * (2-cooldown)
		#Test---------------------------------------------------
	elif item_levl == 4:
		bonus_dmg += 6
	elif item_levl == 5:
		weapon_amount += 1
	elif item_levl == 6:
		aim = true


var enemi_kords = Vector2(0, 0)


func _ready():
	var player_node = get_node("..")
	var inventory = player_node.inventory
	
	var ind = 4

	$"..".all_items[ind].node = get_node(".")
	
	var id = $"..".all_items[ind].id
	for i in range(inventory.size()):
		if id == inventory[i].id:
			$"..".inventory[i].node = get_node(".")
	
	stat_check()


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


func _on_timer_timeout():
	for i in range((amount + weapon_amount)):
		atack()


func atack():
	if aim:
		var enemies_in_range = get_overlapping_bodies()
		if enemies_in_range.size() > 0:
			var target_enemy = enemies_in_range.pick_random()
			enemi_kords = target_enemy.global_position
		
		const arow = preload("res://src/Weapons/lightning.tscn")
		var new = arow.instantiate()

		var paoition = Vector2(enemi_kords)
		
		new.global_position = paoition
		new.might = might
		
		new.bonus_dmg = bonus_dmg
		new.atak_range = atak_range
		
		$"..".add_sibling(new)
	else :
		const arow = preload("res://src/Weapons/lightning.tscn")
		var new = arow.instantiate()
		
		var x = randf_range(-500, 500)
		var y = randf_range(-200, 200)
		
		var paoition = $"..".global_position + Vector2(x, y)
		
		new.global_position = paoition
		new.might = might
		new.bonus_dmg = bonus_dmg
		
		new.atak_range = atak_range
		
		$"..".add_sibling(new)
