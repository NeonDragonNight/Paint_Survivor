extends Area2D


func _process(_delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)


func shoot():
	const BULLET = preload("res://src/Enemi_weapon/enemi_bullet.tscn")
	var new_bullet = BULLET.instantiate()
	#new_bullet.global_transform = global_transform
	#$".".add_child(new_bullet)
	
	new_bullet.global_rotation = global_rotation
	$"..".add_child(new_bullet)

func _on_shut_time_timeout() -> void:
	shoot()
