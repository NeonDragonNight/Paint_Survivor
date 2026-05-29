extends CharacterBody2D

var speed = 0
var base_speed = 400

var timer = false

var healt = 1
var max_healt = 85

var dmg = 0
var entered_counter = 0

var last_inp_dir = Vector2.RIGHT

@onready var animated_sprite = $AnimatedSprite2D

var might = 0
var base_might = 1
var bonus_might = 0

var colect_range = 1
var atak_range = 1
var old_atak_range = 1

var bonus_speed = 1.2

var armor = 0
var armor_bonus = 0
var base_armor = 0

var cooldown = 1
var exp_bonus = 1
var duration = 1

var amount = 0
var amount_bonus = 0
var base_amount = 2

var expe = 0
var need_to_lvl_up = 3


var all_items = [
	#Weapons
	{"name": "Erov", "level": 0, "id": 0, "path": "res://src/Weapons/turel.tscn", "node": null, "title": "Лук", "txt": ["Лук", "+частота стрільби", "+шкода", "+частота стрільби", "+шкода", "випускає дві стріли"], "weapon": true, "ico": "res://graphic/inventory_ico/erow_ico.png"},
	{"name": "Aura", "level": 0, "id": 1, "path": "res://src/Weapons/aura.tscn", "node": null, "title": "Аура", "txt": ["Аура", "lvl 2", "шкода +0,5", "розмір +20%", "шкода +1", "шкода +2", "розмір +20%", "lvl 6"], "weapon": true, "ico": "res://graphic/inventory_ico/aura_ico.png"},
	{"name": "Sword a", "level": 0, "id": 2, "path": "res://src/Weapons/sword_a_spawner.tscn", "node": null, "title": "Меч", "txt": ["Меч", "lvl 1", "шкода +2", "+20% розміру", "+швидкість атаки", "шкода +8", "+20% розміру, +швидкість атаки"], "weapon": true, "ico": "res://graphic/inventory_ico/sword_a_ico.png"},
	{"name": "Fire zone", "level": 0, "id": 3, "path": "res://src/Weapons/fire_zone_spawner.tscn", "node": null, "title": "Руна вогню", "txt": ["lvl 0", "збільшення розміру", "збільшення часу існування", "+шкода", "збільшення часу існування", "збільшення розміру", "lvl 5", "lvl 6"], "weapon": true, "ico": "res://graphic/inventory_ico/fire_zone_ico.png"},
	
	{"name": "Lightning", "level": 0, "id": 4, "path": "res://src/Weapons/lightning_spawner_v_3.tscn", "node": null, "title": "Блискавка", "txt": ["lvl 0", "+6 шкода", "+частота", "+6 шкода", "+1 снаряд", "притяжіння до ворогів", "lvl 6"], "weapon": true, "ico": "res://graphic/inventory_ico/lightning_ico.png"},
	{"name": "Magic crystal", "level": 0, "id": 5, "path": "res://src/Weapons/magick_crystal_spawner.tscn", "node": null, "title": "Магічний кристал", "txt": ["lvl 0", "+частота", "+шкода", "+час існування", "+частота", "+шкода", "lvl 6"], "weapon": true, "ico": "res://graphic/inventory_ico/magic_crystal_ico.png"},
	{"name": "Spin", "level": 0, "id": 6, "path": "res://src/Weapons/spainer_spawner.tscn", "node": null, "title": "Орбіта", "txt": ["lvl 0", "+снаряд", "+шкода", "+шкода", "+швидкість обертання", "+2 існаряд", "lvl 5", "lvl 6"], "weapon": true, "ico": "res://graphic/inventory_ico/spin_ico.png"},
	{"name": "Ricoshet", "level": 0, "id": 7, "path": "res://src/Weapons/rikoshet_spawner.tscn", "node": null, "title": "Бумеранг", "txt": ["lvl 0", "+швидкість снаряду", "збільшення шкоди", "частота атак", "збільшення часу існування снаряду", "+кількість снарядів", "lvl 6"], "weapon": true, "ico": "res://graphic/inventory_ico/ricoshet_ico.png"},


	#pasyvs
	{"name": "Hp up", "level": 0, "id": 8, "path": null, "node": null, "title": "Покращення здоров'я", "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false, "ico": "res://graphic/inventory_ico/hp_up_ico.png"},
	{"name": "Range up", "level": 0, "id": 9, "path": null, "node": null, "title": "Збільшення зброї", "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false, "ico": "res://graphic/inventory_ico/range_up_ico.png"},
	{"name": "Speed up", "level": 0, "id": 10, "path": null, "node": null, "title": "Збільшення швидкості", "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false, "ico": "res://graphic/inventory_ico/speed_up_ico.png"},
	{"name": "Colect range up", "level": 0, "id": 11, "path": null, "node": null, "title": "Збільшення дальності збирання есенції", "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false, "ico": "res://graphic/inventory_ico/colekt_range_ico.png"},
	
	{"name": "Expe bonus", "level": 0, "id": 12, "path": null, "node": null, "title": "Збільшення ефективності есенції", "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false, "ico": "res://graphic/inventory_ico/exp_up_ico.png"},
	{"name": "Amount bonus", "level": 0, "id": 13, "path": null, "node": null, "title": "Збільшення кількості снарядів", "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false, "ico": "res://graphic/inventory_ico/emount_ico.png"},
	{"name": "Cooldown up", "level": 0, "id": 14, "path": null, "node": null, "title": "Збільшення частоти атак", "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false, "ico": "res://graphic/inventory_ico/cooldown_ico.png"},
	{"name": "Armor up", "level": 0, "id": 15, "path": null, "node": null, "title": "Збільшення броні", "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false, "ico": "res://graphic/inventory_ico/armor_ico.png"},

	{"name": "Might up", "level": 0, "id": 16, "path": null, "node": null, "title": "Збільшення шкоди", "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false, "ico": "res://graphic/inventory_ico/might_up_ico.png"},
	#{"name": "Duration up", "level": 0, "id": 17, "path": null, "node": null, "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false},

]


var inventory = []
var inventory_artifacts = []

var lvl_up_menu_activ = false

var abilitys = ["res://src/Player/knight/knight_skil_1.tscn", "res://src/Player/knight/knight_ult_1.tscn"]

var dash = false

var sound_volume = 0


func _ready():
	healt = max_healt
	
	var skil_p = abilitys[0]
	var skil : PackedScene = load(skil_p)
	var new_skil = skil.instantiate()
	$coin/skil.add_child(new_skil)
	
	var ult_p = abilitys[1]
	var ult : PackedScene = load(ult_p)
	var new_ult = ult.instantiate()
	$coin/ult.add_child(new_ult)
	
	
	$AnimatedSprite2D.pause()
	
	#player_stat_check()
	
	
	#---------------------------------------------------------------------
	#Базова зброя
	var choiset_item = all_items[0]
	
	choiset_item.level += 1
	inventory.append(choiset_item)
	var item1 = choiset_item.path
	var item : PackedScene = load(item1)
	var new_item = item.instantiate()
	$".".add_child(new_item)
	
	var texture_path = choiset_item.ico
	var texture = load(texture_path)
	$inventory_gui/Sprite2DWeap.texture = texture
	#---------------------------------------------------------------------
	
	
	
	
	
	if max_shild_hp > 0:
		shild_hp = max_shild_hp
	if shild_hp > 0:
		$hp_bar2.modulate = Color(0 ,0 ,1)
		$hp_bar.text = "Shild: " + str(shild_hp)
		$hp_bar2.value = shild_hp
		$hp_bar2.max_value = max_shild_hp
	else :
		$hp_bar2.modulate = Color(0 ,0.8 ,0.3)
		$hp_bar.text = "Hp: " + str(healt)
		$hp_bar2.value = healt
		$hp_bar2.max_value = max_healt

	player_stat_check()
	pasyv_stat_up()

func get_input():
	var input_direction = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		input_direction.x += 1
		animated_sprite.flip_h = false
	if Input.is_action_pressed("left"):
		input_direction.x -= 1
		animated_sprite.flip_h = true
	if Input.is_action_pressed("down"):
		input_direction.y += 1
	if Input.is_action_pressed("up"):
		input_direction.y -= 1
		
	if input_direction != Vector2.ZERO:
		last_inp_dir = input_direction

	velocity = input_direction * (speed)
	
	
	if velocity.length() > 0.0:
		$AnimatedSprite2D.play("default")
	else :
		$AnimatedSprite2D.stop()
	
	if Input.is_action_just_pressed("skil"):
		$coin/skil.get_child(0).akt()
	
	
	if Input.is_action_just_pressed("ult"):
		$coin/ult.get_child(0).akt()


func _physics_process(delta):
	get_input()
	move_and_slide()


var shild_hp = 0
var max_shild_hp = 0


func heal(heal):
	if (healt + heal) > max_healt:
		var normaliz_hil = heal - (healt + heal - max_healt)
		if normaliz_hil > 0:
			healt += normaliz_hil
	else :
		healt += heal


func _process(delta):
	if shild_hp > 0:
		$hp_bar2.modulate = Color(0 ,0 ,1)
		$hp_bar2.value = shild_hp
		$hp_bar2.max_value = max_shild_hp
	else :
		$hp_bar2.modulate = Color(0 ,0.8 ,0.3)
		$hp_bar2.value = healt
		$hp_bar2.max_value = max_healt
	
	
	if healt <= 0:
		endd()
		
	if ! lvl_up_menu_activ:
		if expe >= need_to_lvl_up:
			lvl_up_menu_spawn()
			lvl_up_menu_activ = true


func power_up(up):
	bonus_might += up
	player_stat_check()
	
func damag_to_player(dmge):
	if shild_hp > 0:
		shild_hp -= (dmge - armor)
	else :
		healt -= (dmge - armor)


func _on_damag_cykl_timeout():
	var overlapping_mobs = $h_box.get_overlapping_bodies()
	var t_dmg = 0
	var m_dmg = 0
	
	if not dash:
		if overlapping_mobs:
			$AudioStreamPlayer.play()
			for mob in overlapping_mobs:
				if ! mob.frozen:
					m_dmg = (mob.dmg - armor)
				if m_dmg > 0:
					t_dmg += m_dmg
			
			if shild_hp > 0:
				shild_hp -= t_dmg
			else :
				healt -= t_dmg
				if max_shild_hp > 0:
					if shild_hp <= 0:
						$shild_regen.start()


func add_item():
	pass


func lvl_up_menu_spawn():
	var new_lvl_up_menu = preload("res://src/Menu/lvl_up_menu.tscn").instantiate()
	new_lvl_up_menu.player_node = get_node(".")
	
	new_lvl_up_menu.all_items = all_items
	new_lvl_up_menu.inventory = inventory
	new_lvl_up_menu.inventory_artifacts = inventory_artifacts
	
	new_lvl_up_menu.global_transform = global_transform
	
	add_child(new_lvl_up_menu)
	
	expe -= need_to_lvl_up
	
	need_to_lvl_up *= 1.1
	
	$exp_bar.value = expe
	$exp_bar.max_value = need_to_lvl_up


func exp_up(exp):
	expe += (exp * exp_bonus)
	
	$exp_bar.value = expe
	$exp_bar.max_value = need_to_lvl_up


var old_bonus_speed = bonus_speed
var old_colect_range = colect_range


func level_up_chek():
	for item in inventory:
		var i_nod = item.node
		if i_nod.has_method("stat_check"):
				i_nod.stat_check()


func player_stat_check():
	speed = base_speed * bonus_speed
	might = base_might + bonus_might
	armor = base_armor + armor_bonus
	amount = base_amount + amount_bonus
	pasyv_stat_up()


func pasyv_stat_up():
	$hp_bar2.max_value = max_healt

	if old_colect_range < colect_range:
		$exp_colect_zone.scale *= colect_range
		old_colect_range = colect_range
	
	for item in inventory:
		
		var i_nod = item.node
		if i_nod.has_method("stat_check"):
				i_nod.stat_check()
	#------------------------------------------------------------------


var minuts = 0
var secund = 0

func _on_game_time_timeout():
	secund += 1
	if secund == 60:
		minuts += 1
		secund = 0
	$game_timer.text = str(minuts) + ":" + str(secund)
	

var coins = 0
func coin_edit(coin):
	coins += coin
	$coin/coin_counter.text = str(coins)
	

var kill = 0
func kill_plus():
	kill += 1
	$coin/kill_counter.text = str(kill)


func inventori_weapon_gui_edit(item):
	var inv_siz = inventory.size()
	
	if inv_siz == 1:
		var texture_path = item.ico
		var texture = load(texture_path)
		$inventory_gui/Sprite2DWeap.texture = texture
	elif inv_siz == 2:
		var texture_path = item.ico
		var texture = load(texture_path)
		$inventory_gui/Sprite2DWeap2.texture = texture
	elif inv_siz == 3:
		var texture_path = item.ico
		var texture = load(texture_path)
		$inventory_gui/Sprite2DWeap3.texture = texture
	elif inv_siz == 4:
		var texture_path = item.ico
		var texture = load(texture_path)
		$inventory_gui/Sprite2DWeap4.texture = texture
	elif inv_siz == 5:
		var texture_path = item.ico
		var texture = load(texture_path)
		$inventory_gui/Sprite2DWeap5.texture = texture
	elif inv_siz == 6:
		var texture_path = item.ico
		var texture = load(texture_path)
		$inventory_gui/Sprite2DWeap6.texture = texture


func inventori_weapon_gui_change(item, inv_siz):
	if inv_siz == 1:
		var texture_path = item.ico
		var texture = load(texture_path)
		$inventory_gui/Sprite2DWeap.texture = texture
	elif inv_siz == 2:
		var texture_path = item.ico
		var texture = load(texture_path)
		$inventory_gui/Sprite2DWeap2.texture = texture
	elif inv_siz == 3:
		var texture_path = item.ico
		var texture = load(texture_path)
		$inventory_gui/Sprite2DWeap3.texture = texture
	elif inv_siz == 4:
		var texture_path = item.ico
		var texture = load(texture_path)
		$inventory_gui/Sprite2DWeap4.texture = texture
	elif inv_siz == 5:
		var texture_path = item.ico
		var texture = load(texture_path)
		$inventory_gui/Sprite2DWeap5.texture = texture
	elif inv_siz == 6:
		var texture_path = item.ico
		var texture = load(texture_path)
		$inventory_gui/Sprite2DWeap6.texture = texture
		

func inventori_artifact_gui_edit(item):
	var inv_siz = inventory_artifacts.size()
	
	if inv_siz == 1:
		var texture_path = item.ico
		var texture = load(texture_path)
		$inventory_gui/Sprite2D.texture = texture
	elif inv_siz == 2:
		var texture_path = item.ico
		var texture = load(texture_path)
		$inventory_gui/Sprite2D2.texture = texture
	elif inv_siz == 3:
		var texture_path = item.ico
		var texture = load(texture_path)
		$inventory_gui/Sprite2D3.texture = texture
	elif inv_siz == 4:
		var texture_path = item.ico
		var texture = load(texture_path)
		$inventory_gui/Sprite2D4.texture = texture
	elif inv_siz == 5:
		var texture_path = item.ico
		var texture = load(texture_path)
		$inventory_gui/Sprite2D5.texture = texture
	elif inv_siz == 6:
		var texture_path = item.ico
		var texture = load(texture_path)
		$inventory_gui/Sprite2D6.texture = texture


var player_level = 0
func player_level_up():
	player_level += 1
	$level_counter.text = "Level: " + str(player_level)


func player():
	pass


func _on_shild_regen_timeout():
	shild_hp = max_shild_hp


#func _on_timer_timeout():
	#$coin/skil.modulate = Color(1, 1, 1)
	#$coin/ult.modulate = Color(1, 1, 1)


func add_ult_energy():
	$coin/ult.get_child(0).add_ult_energy()


func endd():
	var menu = load("res://src/Menu/game_over_menu.tscn").instantiate()
	menu.gold = coins
	menu.kils = kill
	menu.surv_time = str(minuts) + ":" + str(secund)
	menu.sound_volume = sound_volume
	get_tree().root.add_child(menu)
	get_tree().current_scene.queue_free()
	get_tree().current_scene = menu
	

func win():
	get_node("..").win(coins, kill, minuts, secund)
