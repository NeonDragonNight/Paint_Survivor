extends CharacterBody2D

@export var speed = 400

var timer = false

@export var healt = 100
var max_healt = 100

var dmg = 0
var entered_counter = 0

var last_inp_dir = Vector2.RIGHT

#var erova_culdaun = true
#var danger_zone_culdaun = true

@onready var animated_sprite = $AnimatedSprite2D

var might = 1
var colect_range = 1
var atak_range = 1
var old_atak_range = 1

var bonus_speed = 1

var armor_bonus = 0
var cooldown = 1
var exp_bonus = 1
var duration = 1

var amount = 1


var sykl_work = false


#Уровень игрока
var expe = 0
var need_to_lvl_up = 3


var all_items = [
	#Weapons
	{"name": "Erov", "level": 0, "id": 0, "path": "res://src/Weapons/turel.tscn", "node": null, "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": true, "ico": "res://graphic/inventory_ico/erow_ico.png"},
	{"name": "Aura", "level": 0, "id": 1, "path": "res://src/Weapons/aura.tscn", "node": null, "txt": ["lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": true, "ico": "res://graphic/inventory_ico/aura_ico.png"},
	{"name": "Sword a", "level": 1, "id": 2, "path": "res://src/Weapons/sword_a_spawner.tscn", "node": null, "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": true, "ico": "res://graphic/inventory_ico/sword_a_ico.png"},
	{"name": "Fire zone", "level": 0, "id": 3, "path": "res://src/Weapons/fire_zone_spawner.tscn", "node": null, "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": true, "ico": "res://graphic/inventory_ico/fire_zone_ico.png"},
	
	{"name": "Lightning", "level": 0, "id": 4, "path": "res://src/Weapons/lightning_spawner.tscn", "node": null, "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": true, "ico": "res://graphic/inventory_ico/lightning_ico.png"},
	{"name": "Magic crystal", "level": 0, "id": 5, "path": "res://src/Weapons/magick_crystal_spawner.tscn", "node": null, "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": true, "ico": "res://graphic/inventory_ico/magic_crystal_ico.png"},
	{"name": "Spin", "level": 0, "id": 6, "path": "res://src/Weapons/spainer_spawner.tscn", "node": null, "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": true, "ico": "res://graphic/inventory_ico/spin_ico.png"},
	{"name": "Ricoshet", "level": 0, "id": 7, "path": "res://src/Weapons/rikoshet_spawner.tscn", "node": null, "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": true, "ico": "res://graphic/inventory_ico/ricoshet_ico.png"},


	#pasyvs
	{"name": "Hp up", "level": 0, "id": 8, "path": null, "node": null, "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false, "ico": "res://graphic/inventory_ico/hp_up_ico.png"},
	{"name": "Range up", "level": 0, "id": 9, "path": null, "node": null, "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false, "ico": "res://graphic/inventory_ico/range_up_ico.png"},
	{"name": "Speed up", "level": 0, "id": 10, "path": null, "node": null, "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false, "ico": "res://graphic/inventory_ico/speed_up_ico.png"},
	{"name": "Colect range up", "level": 0, "id": 11, "path": null, "node": null, "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false, "ico": "res://graphic/inventory_ico/colekt_range_ico.png"},
	
	{"name": "Expe bonus", "level": 0, "id": 12, "path": null, "node": null, "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false, "ico": "res://graphic/inventory_ico/exp_up_ico.png"},
	{"name": "Amount bonus", "level": 0, "id": 13, "path": null, "node": null, "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false, "ico": "res://graphic/inventory_ico/emount_ico.png"},
	{"name": "Cooldown up", "level": 0, "id": 14, "path": null, "node": null, "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false, "ico": "res://graphic/inventory_ico/cooldown_ico.png"},
	{"name": "Armor up", "level": 0, "id": 15, "path": null, "node": null, "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false, "ico": "res://graphic/inventory_ico/armor_ico.png"},

	{"name": "Might up", "level": 0, "id": 16, "path": null, "node": null, "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false, "ico": "res://graphic/inventory_ico/might_up_ico.png"},
	#{"name": "Duration up", "level": 0, "id": 17, "path": null, "node": null, "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false},

]

	#{"name": "Hp up", "level": 0, "id": 000, "path": null, "node": null, "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false},
	#{"name": "Range up", "level": 0, "id": 000, "path": null, "node": null, "txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"], "weapon": false},

#var inventory = [{"name": "Sword a", "level": 1, "id": 2, 
#"path": "res://src/Weapons/sword_a_spawner.tscn", "node": null, 
#"txt": ["lvl 0", "lvl 1", "lvl 2", "lvl 3", "lvl 4", "lvl 5", "lvl 6"],
#"weapon": true}]

var inventory = []
var inventory_artifacts = []

var lvl_up_menu_activ = false


#var inventori_weapon_gui_nodes = [get_node("inventory_gui/Sprite2DWeap")]#, get_node("inventory_gui/Sprite2DWeap2"), ]
#var inventori_artifacts_gui_nodes = []





func _ready():
	var choiset_item = all_items[2]
	
	choiset_item.level += 1
	inventory.append(choiset_item)
	var item1 = choiset_item.path
	var item : PackedScene = load(item1)
	var new_item = item.instantiate()
	$".".add_child(new_item)
	
	var texture_path = choiset_item.ico
	var texture = load(texture_path)
	$inventory_gui/Sprite2DWeap.texture = texture
	
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
	
	#var ttte = "inventory_gui/Sprite2DWeap"
	#print(get_node(ttte))
	#
	#var ttt = inventori_weapon_gui_nodes[1]
	##ttt.texture = texture
	#print(inventori_weapon_gui_nodes.size())
	
	##inventory[0].node = all_items[2].node
	#
	#print("all_items")
	#print(all_items)
	#print("inventory")
	#print(inventory)
	
	#print(get_node("inventory_gui/Sprite2D2"))


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
		
	if Input.is_action_pressed("shift"):
		velocity = input_direction * ((speed + bonus_speed) * 4)
	elif Input.is_action_pressed("ctrl"):
		velocity = input_direction * ((speed + bonus_speed) / 4)
	else: velocity = input_direction * (speed + bonus_speed)
	
	if velocity.length() > 0.0:
		$AnimatedSprite2D.animation = "walk"
	else :
		$AnimatedSprite2D.animation = "idl"


func _physics_process(delta):
	get_input()
	move_and_slide()


var shild_hp = 0
var max_shild_hp = 0


func cykl():
	
	sykl_work = true
	
	#print("max_shild_hp -", max_shild_hp)s
	#healt -= (dmg - armor_bonus)
	
	#New dmg###################
	var fixed_dmg = (dmg - armor_bonus)
	
	if shild_hp > 0:
		if fixed_dmg < 0:
			fixed_dmg = 0
		shild_hp -= fixed_dmg
		
		#$hp_bar2.modulate = Color(0 ,0 ,1)
		#$hp_bar.text = "Shild: " + str(shild_hp)
		#$hp_bar2.value = shild_hp
		#$hp_bar2.max_value = max_shild_hp
	else :
		if fixed_dmg < 0:
			fixed_dmg = 0
		healt -= fixed_dmg
		
		#$hp_bar2.modulate = Color(0 ,0.8 ,0.3)
		#$hp_bar.text = "Hp: " + str(healt)
		#$hp_bar2.value = healt
		#$hp_bar2.max_value = max_healt
		
		if max_shild_hp > 0:
			if shild_hp <= 0:
				$shild_regen.start()
	#New dmg######################
	
	
	#Old dmg###################
	#var fixed_dmg = (dmg - armor_bonus)
	#if fixed_dmg < 0:
		#fixed_dmg = 0
		#
	#healt -= fixed_dmg
	#Old dmg###################
	
	#if healt == 0:
		#print("Game over")
	$damag_cykl.start()

func _process(delta):
	if entered_counter == 0:
		$damag_cykl.stop()
		sykl_work = false
	
	#Old hp bar################
	#$hp_bar.text = "Hp: " + str(healt)
	#$hp_bar2.value = healt
	#Old hp bar################
	
	
	#Test hp bar#########################
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
	#Test hp bar#########################
	
	
	if healt <= 0:
		get_tree().change_scene_to_file("res://src/Menu/game_over_menu.tscn")
		
	if ! lvl_up_menu_activ:
		if expe >= need_to_lvl_up:
			lvl_up_menu_spawn()
			lvl_up_menu_activ = true


func power_up(up):
	might += up
	
func damag_to_player(dmge):
	healt -= (dmge - armor_bonus)

func damag_to_player_cykl(dmge1):
	dmg += dmge1
	entered_counter += 1
	if ! sykl_work:
		cykl()

func damag_to_player_cykl_stop(dmge2):
	dmg -= dmge2
	entered_counter -= 1


func _on_damag_cykl_timeout():
	cykl()


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
	
	#if expe >= need_to_lvl_up:
		#lvl_up_menu_spawn()
		
		#var new_lvl_up_menu = preload("res://src/Menu/lvl_up_menu.tscn").instantiate()
		#new_lvl_up_menu.player_node = get_node(".")
		#
		#new_lvl_up_menu.all_items = all_items
		#new_lvl_up_menu.inventory = inventory
		#new_lvl_up_menu.inventory_artifacts = inventory_artifacts
		#
		#new_lvl_up_menu.global_transform = global_transform
		#
		#add_child(new_lvl_up_menu)
		
		
		#expe -= need_to_lvl_up
		#
		#need_to_lvl_up *= 1.2
		#
		#$exp_bar.value = expe
		#$exp_bar.max_value = need_to_lvl_up


var old_bonus_speed = bonus_speed
var old_colect_range = colect_range


#lvl up func #######################################
#func speed_up():
	#speed *= bonus_speed
	#
#func colect_range_up():
	#$exp_colect_zone.scale *= colect_range
# ###################################################


func pasyv_stat_up():
	print("old speed - ", old_bonus_speed, "| bonus_speed - ", bonus_speed)
	print("old_colect_range - ", old_colect_range, "| colect_range - ", colect_range)
	
	#player stat
	$hp_bar2.max_value = max_healt
	
	if old_bonus_speed < bonus_speed:
		speed *= bonus_speed
		old_bonus_speed = bonus_speed
	
	if old_colect_range < colect_range:
		$exp_colect_zone.scale *= colect_range
		old_colect_range = colect_range
	
	#weapon stat
	for item in inventory:
		if item.weapon:
			var i_nod = item.node
			
			if old_atak_range < atak_range:
				i_nod.scale *= atak_range
				old_atak_range = atak_range
			
			i_nod.amount = amount
			i_nod.might = might
			i_nod.cooldown = cooldown
			
			print(i_nod, i_nod.amount, i_nod.might, i_nod.cooldown)
			
			#i_nod.duration = duration#?????
			
			if i_nod.has_method("stat_edit"):
				i_nod.stat_edit()

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
