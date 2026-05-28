extends Area2D


var might = 1
var dmg = 30

var sound_volume = 0


func _ready():
	dmg *= might
	$sound.volume_db = sound_volume - 12
	$sound.play()


func _on_area_entered(area):
	if area.has_method("take_damag"):
		area.take_damag(dmg)


func _on_timer_timeout():
	queue_free()
