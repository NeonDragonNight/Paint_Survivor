extends Node

var test

#var all_items = [
	#{"name": "Меч", "level": 3},
	#{"name": "Щит", "level": 2},
	#{"name": "Лук", "level": 5},
	#{"name": "Посох", "level": 6},
	#{"name": "Кинжал", "level": 1},
	#{"name": "Топор", "level": 4}
#]

var inventory = [
	{"name": "Щит", "level": 2}, # Уже есть в инвентаре
]


var all_items = [
	{"name": "Turel", "level": 0, "id": "0", "path": "res://src/Weapons/turel.tscn", "node": get_node("."), "xtx": ["1", "2","3"]},
	{"name": "Aura", "level": 0, "id": "1", "path": "res://src/Weapons/aura.tscn", "node": null, "xtx": ["1", "2","3"]},
]


var test_d = {1: {"name": "Turel", "level": 0, "path": "res://src/Weapons/turel.tscn", "node": get_node(".")},
2: {"name": "Aura", "level": 1, "path": "res://src/Weapons/aura.tscn", "node": null}
}

var tete = [
	{"name": "0", "id": 99},
	{"name": "1", "id": 99},
	{"name": "2", "id": 99},
	{"name": "3", "id": 99},
	{"name": "4", "id": 99},
]


func _ready():
	for i in range(tete.size()):
		tete[i].id = i
	
	print(tete.size())
	
	#$Sprite2D.texture_repeat = "res://graphic/player textures/pl idl.png"
	
	var a = 2
	var b = $Sprite2D.aa
	#var c = a + b
	#
	#tete.append(all_items[0])
	#print(tete.size())
	#print(tete)
	#print(b)
	$Sprite2D.aa *= a
	
	#$Sprite2D.aa = a
	
	#for i in range((a + 1)):
		#print(i)
	
	#var selected_items = get_random_items(1)
	#print(selected_items)
	
	#print(selected_items[0])
	#selected_items[0].level += 1
	#print(selected_items[0])
	#print(all_items[0].xtx[0])
	#print(selected_items.size())
	#print(all_items)
	#all_items[0] = {"name": "test", "level": 99, "id": "99", "path": "99", "node": null}
	#print(all_items)
	
	#var test = all_items[0]
	#print(test_d.get(2))
	
	#var item1 = choiset_item.path
	#var item : PackedScene = load("res://src/Weapons/aura.tscn")
	#var new_item = item.instantiate()
	##all_items[1].node = get_node(new_item)
	#add_child(new_item)
	#
	#print(all_items[1])
	#var rrr = all_items[1].node
	#print(rrr.damage)
	#rrr.damage = 99
	#print(rrr.damage)


	#all_items[1].node = get_node("aura")
	#
	#if get_node_or_null("aura"):
		#print("all_items[1]")


func get_random_items(count: int) -> Array:
	# 1. Фильтруем доступные предметы
	var available_items = []
	for item in all_items:
		var in_inventory = inventory.any(func(inv_item): return inv_item.name == item.name)
		if item.level < 7 and not in_inventory:
			available_items.append(item)
	
	# 2. Перемешиваем список
	available_items.shuffle()
	
	# 3. Берём первые N элементов
	return available_items.slice(0, min(count, available_items.size()))
