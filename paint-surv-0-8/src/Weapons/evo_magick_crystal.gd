extends Area2D


#func _ready():
	#$"..".ttest(get_node("."))

#var inventory = $"..".inventory
#func _ready():
	#var player_node = get_node("..")
	#var inventory = player_node.inventory
	##$"..".aura_node = get_node(".")
	##$"..".weapon_node_list[1] = get_node(".")
	#$"..".all_items[5].node = get_node(".")
	#
	#var id = $"..".all_items[5].id
	#for i in range(inventory.size()):
		#if id == inventory[i].id:
			#$"..".inventory[i].node = get_node(".")
			
var might = 1


var player_node

var speed = 400

var sound_volume = 0

func _ready():
	$sound.volume_db = sound_volume
	$sound.play()


func _process(_delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		$Marker2D.look_at(target_enemy.global_position)
	
	
	var distanse_to_player = (player_node.global_position).distance_to(global_position)
	
	if distanse_to_player <= 200.0:
		#velocity = Vector2.ZERO
		var direction = global_position.direction_to(player_node.global_position) * -1
		position += direction * speed * _delta
	else:
		var direction = global_position.direction_to(player_node.global_position)
		position += direction * speed * _delta


func shoot():
	
	#var enemies_in_range = get_overlapping_bodies()
	#if enemies_in_range.size() > 0:
		#var target_enemy = enemies_in_range.front()
		#look_at(target_enemy.global_position)
	
	const arow = preload("res://src/Weapons/magick_projectile.tscn")#("res://src/xlam/bullet_2d.tscn")#("res://src/Weapons/turel_arow.tscn")#
	var new_arow = arow.instantiate()
	new_arow.global_transform = $Marker2D.global_transform
	
	#new_arow.global_rotation = global_rotation
	new_arow.dmg = 1 * might
	new_arow.dmg += 4
	
	$Marker2D.add_child(new_arow)
	#add_sibling(new_arow)


func _on_timer_timeout() -> void:
	shoot()
	

func lvl_up(up):
	print("turel lvl up")


func _on_live_time_timeout():
	queue_free()
