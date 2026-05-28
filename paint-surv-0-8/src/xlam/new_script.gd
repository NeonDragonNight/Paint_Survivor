extends Node

var all_items = [
	{"name": "Меч", "level": 3},
	{"name": "Щит", "level": 2},
	{"name": "Лук", "level": 5},
	{"name": "Посох", "level": 6},
	{"name": "Кинжал", "level": 1},
	{"name": "Топор", "level": 4}
]

var inventory = [
	{"name": "Щит", "level": 2}, # Уже есть в инвентаре
]

func _ready():
	var selected_items = get_random_items(2)
	print(selected_items)


func get_random_items(count: int) -> Array:
	# 1. Фильтруем доступные предметы
	var available_items = []
	for item in all_items:
		var in_inventory = inventory.any(func(inv_item): return inv_item.name == item.name)
		if item.level < 6 and not in_inventory:
			available_items.append(item)
	
	# 2. Перемешиваем список
	available_items.shuffle()
	
	# 3. Берём первые N элементов
	return available_items.slice(0, min(count, available_items.size()))
