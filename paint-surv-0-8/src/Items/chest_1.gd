extends Area2D


var evo_list = [
	{"name": "evo_rikoshet", "level": 10, "id": 0, "path": "res://src/Weapons/evo_rikoshet_spawner.tscn", "node": null, "title": "Вибуховий бумеранг", "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": true, "ico": "res://graphic/evo_weapon_ico/evo_bumerang.png"},
	{"name": "evo_spiner", "level": 10, "id": 1, "path": "res://src/Weapons/evo_spiner_spawner.tscn", "node": null, "title": "Диск", "txt": ["lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": true, "ico": "res://graphic/evo_weapon_ico/evo_spin_ico.png"},
	{"name": "evo_aura", "level": 10, "id": 2, "path": "res://src/Weapons/evo_aura.tscn", "node": null, "title": "Вампіризм", "txt": ["lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": true, "ico": "res://graphic/evo_weapon_ico/evo_aura_ico.png"},
	{"name": "evo_sword_a_spawner", "level": 10, "id": 3, "path": "res://src/evo_weapon/evo_sword_a_spawner.tscn", "title": "Меч і шіт", "node": null, "txt": ["lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": true, "ico": "res://graphic/evo_weapon_ico/evo_sword_a_ico.png"},

	{"name": "evo errov", "level": 10, "id": 4, "path": "res://src/Weapons/evo_erow_spawner.tscn", "node": null, "title": "Заморожуюча стріла", "txt": ["lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": true, "ico": "res://graphic/evo_weapon_ico/evo_erow_ico.png"},
	{"name": "evo fire zon", "level": 10, "id": 5, "path": "res://src/Weapons/evo_fire_zone_spawner.tscn", "node": null, "title": "Ростуча руна вогню", "txt": ["lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": true, "ico": "res://graphic/evo_weapon_ico/evo_fire_zone_ico.png"},
	{"name": "evo_lightning", "level": 10, "id": 6, "path": "res://src/Weapons/evo_lightning_spawner_v_2.tscn", "node": null, "title": "Шторм", "txt": ["lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": true, "ico": "res://graphic/evo_weapon_ico/evo_lightning_ico.png"},
	{"name": "evo_magick_crystal", "level": 10, "id": 7, "path": "res://src/Weapons/evo_magick_crystal_spawner.tscn", "node": null, "title": "Літаючий магічний кристал", "txt": ["lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": true, "ico": "res://graphic/evo_weapon_ico/evo_magic_crystal_ico.png"},

]


var player_node

var all_items
var inventory
var inventory_artifacts

var selected_items

var inventory_siz = 6
var artifact_invent_size = 6

var ico_list = []

var sound_volume = 0


func _on_body_entered(body):
	if body.has_method("player"):
		sound_volume = body.sound_volume
		
		var inventori = body.inventory
		inventory = body.inventory
		inventory_artifacts = body.inventory_artifacts
		
		all_items = body.all_items
		player_node = body
		
		var evo = false
		
		for item in inventori:
			if item.level == 6:
				evo = true
		
		var evo_hepend = false
		if evo:
			for i in range(inventori.size()):
				
				if inventori[i].name == "Ricoshet":
					if inventori[i].level == 6:
						for j in range(inventory_artifacts.size()):
							if inventory_artifacts[j].name == "Colect range up":
								if inventory_artifacts[j].level == 6:
									var item_node = inventori[i].node
									item_node.queue_free()
									var addit = evo_list[0]
									additem(addit, body, i)
									ico_list.append(addit)
									evo_hepend = true
				
				if inventori[i].name == "Spin":
					if inventori[i].level == 6:
						for j in range(inventory_artifacts.size()):
							if inventory_artifacts[j].name == "Speed up":
								if inventory_artifacts[j].level == 6:
									var item_node = inventori[i].node
									item_node.queue_free()
									var addit = evo_list[1]
									additem(addit, body, i)
									ico_list.append(addit)
									evo_hepend = true
					
				if inventori[i].name == "Aura":
					if inventori[i].level == 6:
						for j in range(inventory_artifacts.size()):
							if inventory_artifacts[j].name == "Hp up":
								if inventory_artifacts[j].level == 6:
									var item_node = inventori[i].node
									item_node.queue_free()
									var addit = evo_list[2]
									additem(addit, body, i)
									ico_list.append(addit)
									evo_hepend = true
					
				if inventori[i].name == "Sword a":
					if inventori[i].level == 6:
						for j in range(inventory_artifacts.size()):
							if inventory_artifacts[j].name == "Armor up":
								if inventory_artifacts[j].level == 6:
									var item_node = inventori[i].node
									item_node.queue_free()
									var addit = evo_list[3]
									additem(addit, body, i)
									ico_list.append(addit)
									evo_hepend = true
					
				if inventori[i].name == "Erov":
					if inventori[i].level == 6:
						for j in range(inventory_artifacts.size()):
							if inventory_artifacts[j].name == "Cooldown up":
								if inventory_artifacts[j].level == 6:
									var item_node = inventori[i].node
									item_node.queue_free()
									var addit = evo_list[4]
									additem(addit, body, i)
									ico_list.append(addit)
									evo_hepend = true
					
				if inventori[i].name == "Fire zone":
					if inventori[i].level == 6:
						for j in range(inventory_artifacts.size()):
							if inventory_artifacts[j].name == "Range up":
								if inventory_artifacts[j].level == 6:
									var item_node = inventori[i].node
									item_node.queue_free()
									var addit = evo_list[5]
									additem(addit, body, i)
									ico_list.append(addit)
									evo_hepend = true
					
				if inventori[i].name == "Lightning":
					if inventori[i].level == 6:
						for j in range(inventory_artifacts.size()):
							if inventory_artifacts[j].name == "Amount bonus":
								if inventory_artifacts[j].level == 6:
									var item_node = inventori[i].node
									item_node.queue_free()
									var addit = evo_list[6]
									additem(addit, body, i)
									ico_list.append(addit)
									evo_hepend = true
					
				if inventori[i].name == "Magic crystal":
					if inventori[i].level == 6:
						for j in range(inventory_artifacts.size()):
							if inventory_artifacts[j].name == "Expe bonus":
								if inventory_artifacts[j].level == 6:
									var item_node = inventori[i].node
									item_node.queue_free()
									var addit = evo_list[7]
									additem(addit, body, i)
									ico_list.append(addit)
									evo_hepend = true
			
		#Not Rrdy???#############################
		if ! evo_hepend:
			#Kol items##############################
			var rand = randi_range(1, 100)
			var item_col = 1
			if rand > 97:
				item_col = 5
			elif rand > 75:
				item_col = 3
			elif rand > 0:
				item_col = 1
			
			selected_items = get_random_items(item_col)
			#Kol items##############################
			
			#Add items##############################
			for item in selected_items:
				add_or_up(item)
				ico_list.append(item)
			
		var new_chest_menu = preload("res://src/Menu/chest_menu.tscn").instantiate()
		
		new_chest_menu.ico_list = ico_list
		new_chest_menu.global_transform = global_transform
		new_chest_menu.player_node = player_node

		add_sibling(new_chest_menu)
		
		queue_free()

#Evo item ###################################
func additem(itemm, body, i):
	var addit = itemm
	addit.level += 1
	body.inventory[i] = addit
				
	var item1 = addit.path
	var item : PackedScene = load(item1)
	var new_item = item.instantiate()
	body.add_child(new_item)
			
	body.inventori_weapon_gui_change(addit, i+1)
#Evo item ###################################


func add_or_up(selected_ite):
	var choiset_item = selected_ite
	
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
			player_node.bonus_speed += 0.1
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
			player_node.might += 0.20
		
		player_node.pasyv_stat_up()
	
	
	
	Engine.time_scale = 1
	player_node.lvl_up_menu_activ = false
	player_node.player_level_up()


func get_random_items(count: int) -> Array:
	var available_items = []
	
	var artifact_new = 0
	var weapon_new = 0

	var all_items_shufl = []
	
	for item in all_items:
		all_items_shufl.append(item)
	
	all_items_shufl.shuffle()
	
	for item in all_items_shufl:
		if item.weapon:
			if (inventory.size() + weapon_new) < inventory_siz:
				if ! inventory.has(item):
					weapon_new += 1
					available_items.append(item)
		else :
			if (inventory_artifacts.size() + artifact_new) < artifact_invent_size:
				if ! inventory_artifacts.has(item):
					artifact_new += 1
					available_items.append(item)
	
	for item2 in inventory:
		if item2.level < 6:
			available_items.append(item2)
	for item3 in inventory_artifacts:
		if item3.level < 6:
			available_items.append(item3)

	available_items.shuffle()

	return available_items.slice(0, min(count, available_items.size()))
