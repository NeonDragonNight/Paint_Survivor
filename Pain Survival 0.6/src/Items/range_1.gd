extends Area2D


var player_node

var all_items
var inventory
var inventory_artifacts

var selected_items

var item = [{"name": "Range up", "level": 0, "id": 9, "path": null, "node": null, "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false, "ico": "res://graphic/inventory_ico/range_up_ico.png"}]


func _on_body_entered(body):
	if body.has_method("player"):
		var inventori = body.inventory
		inventory = body.inventory
		inventory_artifacts = body.inventory_artifacts
		
		all_items = body.all_items
		player_node = body
		
		var choiset_item = item[0]
		
		
		for elem in inventory_artifacts:
			if elem.name == choiset_item.name:
				if elem.level > 6:
					queue_free()
				else :
					choiset_item.level = elem.level
		
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
						
					if choiset_item.name == "Hp up":#v
						player_node.healt += 10
						player_node.max_healt += 10
					if choiset_item.name == "Range up":#v
						player_node.atak_range += 0.1
					if choiset_item.name == "Speed up":#v
						player_node.bonus_speed += 0.1
					if choiset_item.name == "Colect range up":#v
						player_node.colect_range += 0.1
					
					if choiset_item.name == "Expe bonus":#v
						player_node.exp_bonus += 0.15
					if choiset_item.name == "Amount bonus":#v
						player_node.amount += 1
					if choiset_item.name == "Cooldown up":#v
						player_node.cooldown += 0.15
					if choiset_item.name == "Armor up":#v
						player_node.armor_bonus += 0.5
					
					if choiset_item.name == "Duration up":#x
						player_node.duration += 0.15
					if choiset_item.name == "Might up":#v
						player_node.might += 0.20
					
					player_node.pasyv_stat_up()
					
					queue_free()
					
		if choiset_item.level == 0:
			if choiset_item.name == "Amount bonus":
				choiset_item.level += 2
			
			choiset_item.level += 1
			inventory_artifacts.append(choiset_item)
			
			player_node.inventori_artifact_gui_edit(choiset_item)
			
			var id = choiset_item.id
			all_items[id] = choiset_item
			player_node.all_items = all_items
			
			queue_free()
		
		
		
		
		
		#var inventori = body.inventory
		#inventory = body.inventory
		#inventory_artifacts = body.inventory_artifacts
		#
		#all_items = body.all_items
		#player_node = body
		#
		#additem(item[0], body, 000)
#
#
#func additem(itemm, body, i):
	#var addit = itemm
	#addit.level += 1
	#body.inventory[i] = addit
				#
	#var item1 = addit.path
	#var item : PackedScene = load(item1)
	#var new_item = item.instantiate()
	#body.add_child(new_item)
			#
	#body.inventori_weapon_gui_change(addit, i+1)
