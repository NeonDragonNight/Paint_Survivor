extends Path2D

#var speed = 0.005

var projectiles


var amount = 1
var weap_amount = 1

var might = 1
var cooldown = 1

var old_cooldown = 1


@onready var base_timer = $Timer.wait_time
var player_node
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
		$Timer.wait_time = base_timer / cooldown
	
	if pl_atak_range > atak_range:
		atak_range = pl_atak_range
		$".".scale += (Vector2(1, 1) * (atak_range -1))


func _ready():
	projectiles = amount + weap_amount
	
	player_node = get_node("..")
	var inventory = player_node.inventory
	
	$"..".all_items[6].node = get_node(".")
	
	var id = $"..".all_items[6].id
	for i in range(inventory.size()):
		if id == inventory[i].id:
			$"..".inventory[i].node = get_node(".")
	
	#
	#var player_node = get_node("..")
	#var inventory = player_node.inventory
	#
	#var ind = 6
#
	#$"..".all_items[ind].node = get_node(".")
	#
	#var id = $"..".all_items[ind].id
	#for i in range(inventory.size()):
		#if id == inventory[i].id:
			#$"..".inventory[i].node = get_node(".")

var damag = 0
var spen_speed = 0

var item_levl = 1
func lvl_up(up):
	item_levl += up
	
	if item_levl == 2:
		weap_amount += 1
		print("weap_amount += 1")
	elif item_levl == 3:
		damag += 4
		print("damag += 4")
	elif item_levl == 4:
		damag += 8
		print("damag += 8")
	elif item_levl == 5:
		spen_speed += 0.003
		print("spen_speed += 0.003")
	elif item_levl == 6:
		weap_amount += 2
		print("weap_amount += 2")


func _on_timer_timeout():
	start()
	
	
func start():
	projectiles = amount + weap_amount
	
	var otstup_part = (1.0 / projectiles)
	var otstup = 0
	
	for i in range(projectiles):
		var new = preload("res://src/Weapons/spiner_v_2.tscn").instantiate()
		new.otstup = otstup
		new.might = might
		
		new.bonus_dmg = damag
		new.speed += spen_speed
		
		$".".add_child(new)
		
		otstup += otstup_part
