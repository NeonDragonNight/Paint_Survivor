extends Node2D

var player_node


var selecteble_item = [99, 99, 99, 99]

var active_buttons = 0

var item1_name


var all_items
var inventory
var inventory_artifacts

var selected_items

var inventory_siz = 6
var artifact_invent_size = 6


func _ready():
	$AudioStreamPlayer.volume_db = player_node.sound_volume - 8
	$button_able.volume_db = player_node.sound_volume
	get_tree().paused = true
	
	selected_items = get_random_items(2)
	
	active_buttons = selected_items.size()
	if active_buttons == 0:
		$Button5.show()
	
	if active_buttons >= 1:
		var lvl = selected_items[0].level
		var text = selected_items[0].title + ": " + selected_items[0].txt[lvl]
		
		$Button.show()
		#$Button.text = selected_items[0].name
		$Button.text = text
		
		var texture_path = selected_items[0].ico
		var texture = load(texture_path)
		$Button/Sprite2D.texture = texture
		
	if active_buttons >= 2:
		
		$Button2.show()
		#$Button2.text = selected_items[1].name
		
		var lvl = selected_items[1].level
		var text = selected_items[1].title + ": " + selected_items[1].txt[lvl]
		$Button2.text = text
		
		var texture_path = selected_items[1].ico
		var texture = load(texture_path)
		$Button2/Sprite2D.texture = texture

	if active_buttons >= 3:
		var lvl = selected_items[2].level
		var text = selected_items[2].title + ": " + selected_items[2].txt[lvl]
		$Button3.text = text
		
		var texture_path = selected_items[2].ico
		var texture = load(texture_path)
		$Button3/Sprite2D.texture = texture
		
		$Button3.show()
	if active_buttons == 4:
		var lvl = selected_items[3].level
		var text = selected_items[3].title + ": " + selected_items[3].txt[lvl]
		$Button4.text = text
		
		var texture_path = selected_items[3].ico
		var texture = load(texture_path)
		$Button4/Sprite2D.texture = texture
		
		$Button4.show()


func _on_button_pressed():
	var item_id = 0
	$button_able.play()
	add_or_up(item_id)


func _on_button_2_pressed():
	var item_id = 1
	$button_able.play()
	add_or_up(item_id)


func _on_button_3_pressed():
	var item_id = 2
	$button_able.play()
	add_or_up(item_id)


func _on_button_4_pressed():
	var item_id = 3
	$button_able.play()
	add_or_up(item_id)


func add_or_up(item_idex):
	
	
	var choiset_item = selected_items[item_idex]
	
	#Weapon lvl up
	if choiset_item.weapon:
		#Add to inventory
		if choiset_item.level == 0:
			choiset_item.level += 1
			inventory.append(choiset_item)
			
			player_node.inventori_weapon_gui_edit(choiset_item)
			
			var item1 = choiset_item.path
			var item : PackedScene = load(item1)
			var new_item = item.instantiate()
			player_node.add_child(new_item)
			
			var id = choiset_item.id
			all_items[id] = choiset_item
			player_node.all_items = all_items
			
		#Item lvl up
		else :
			for i in range(inventory.size()):
				if choiset_item.id == inventory[i].id:
					var node = choiset_item.node
					node.lvl_up(1)
					
					choiset_item.level += 1
					inventory[i] = choiset_item
					var id = choiset_item.id
					all_items[id] = choiset_item
					
					player_node.all_items = all_items
					player_node.inventory = inventory
	
	#Pasyvs lvl up
	else :
		if choiset_item.level == 0:
			if choiset_item.name == "Amount bonus":
				choiset_item.level += 2
			
			choiset_item.level += 1
			inventory_artifacts.append(choiset_item)
			
			player_node.inventori_artifact_gui_edit(choiset_item)
			
			var id = choiset_item.id
			all_items[id] = choiset_item
			player_node.all_items = all_items
		else :
			for i in range(inventory_artifacts.size()):
				if choiset_item.id == inventory_artifacts[i].id:
					if choiset_item.name == "Amount bonus":
						choiset_item.level += 2
					
					choiset_item.level += 1
					inventory_artifacts[i] = choiset_item
					
					var id = choiset_item.id
					all_items[id] = choiset_item
					
					player_node.all_items = all_items
					player_node.inventory_artifacts = inventory_artifacts
			
		if choiset_item.name == "Hp up":
			player_node.healt += 10
			player_node.max_healt += 10
		if choiset_item.name == "Range up":
			player_node.atak_range += 0.1
		if choiset_item.name == "Speed up":
			player_node.bonus_speed += 0.15
		if choiset_item.name == "Colect range up":
			player_node.colect_range += 0.1
		
		if choiset_item.name == "Expe bonus":
			player_node.exp_bonus += 0.15
		if choiset_item.name == "Amount bonus":
			player_node.amount += 1
		if choiset_item.name == "Cooldown up":
			player_node.cooldown += 0.15
		if choiset_item.name == "Armor up":
			player_node.armor_bonus += 0.5
		
		if choiset_item.name == "Duration up":
			player_node.duration += 0.15
		if choiset_item.name == "Might up":
			player_node.bonus_might += 0.20
		
		player_node.pasyv_stat_up()
	
	get_tree().paused = false
	player_node.lvl_up_menu_activ = false
	player_node.player_level_up()
	
	$queue_fr.start()
	
	
func get_random_items(count: int) -> Array:
	var available_items = []
	
	if inventory.size() < inventory_siz:
		for item in all_items:
			if item.weapon:
				if item.level < 6:
					available_items.append(item)
	else :
		for item2 in inventory:
			if item2.level < 6:
				available_items.append(item2)
			
	if inventory_artifacts.size() < artifact_invent_size:
		for item in all_items:
			if ! item.weapon:
				if item.level < 6:
					available_items.append(item)
	else:
		for item3 in inventory_artifacts:
			if item3.level < 6:
				available_items.append(item3)
	
	
	available_items.shuffle()
	
	return available_items.slice(0, min(count, available_items.size()))


func _on_button_5_pressed():
	get_tree().paused = false
	
	$button_able.play()
	
	player_node.coin_edit(200)
	player_node.lvl_up_menu_activ = false
	$queue_fr.start()


func _on_queue_fr_timeout():
	queue_free()
