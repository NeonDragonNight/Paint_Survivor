extends Path2D

#var speed = 0.005

var projectiles


var amount = 1
var weap_amount = 7

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
	projectiles = amount + weap_amount
	
	var player_node = get_node("..")
	var inventory = player_node.inventory
	
	#$"..".all_items[6].node = get_node(".")
	#s
	#var id = $"..".all_items[6].id
	#for i in range(inventory.size()):
		#if id == inventory[i].id:
			#$"..".inventory[i].node = get_node(".")
	
	#Динамичная запись нод в инвентарь #########################
	for i in range(inventory.size()):
		if inventory[i].name == "evo_spiner":
			$"..".inventory[i].node = get_node(".")
	#Динамичная запись нод в инвентарь #########################
	
	start()
	stat_check()
	
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


func lvl_up(up):
	print("spiner lvl up")


func _on_timer_timeout():
	start()
	
	
func start():
	var otstup_part = (1.0 / projectiles)
	var otstup = 0
	
	for i in range(projectiles):
		var new = preload("res://src/Weapons/evo_spiner.tscn").instantiate()
		new.otstup = otstup
		new.might = might
		$".".add_child(new)
		
		otstup += otstup_part
