extends Area2D

var might = 1
var liv_time = 1

var atak_range = 1

var sound_volume = 0

func _ready():
	$live_time.wait_time *= liv_time
	$".".scale += (Vector2(1, 1) * (atak_range -1))
	
	$sound.volume_db = sound_volume - 10
	$sound.play()


func _process(_delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		$Marker2D.look_at(target_enemy.global_position)


func shoot():
	const arow = preload("res://src/Weapons/magick_projectile.tscn")
	var new_arow = arow.instantiate()
	new_arow.global_transform = $Marker2D.global_transform

	new_arow.dmg = 1 * might
	
	$Marker2D.add_child(new_arow)


func _on_timer_timeout() -> void:
	shoot()
	

func lvl_up(up):
	pass


func _on_live_time_timeout():
	queue_free()
