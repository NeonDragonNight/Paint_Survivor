extends Area2D


var mob_list := []

var damage = 1
var might = 1

var live_time = 5


var atak_range
var bonus_atak_range

var sound_volume = 0


func _ready():
	$sound.volume_db = sound_volume -10
	$sound.play()
	
	damage *= might
	
	$live_time.start(live_time)
	
	$".".scale += bonus_atak_range
	$".".scale += (Vector2(1, 1) * (atak_range -1))
	
	#print("fire zon liv time: ", $live_time.wait_time)


func _on_area_entered(area):
	if area not in mob_list:
		mob_list.append(area)


func _on_live_time_timeout():
	queue_free()
	

func _on_damag_interval_timeout():
	for mob in mob_list:
		if mob.has_method("take_damag"):
			mob.take_damag(damage)


func _on_area_exited(area):
	if area in mob_list:
		mob_list.erase(area)
