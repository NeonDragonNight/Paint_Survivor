extends Area2D

var direction = Vector2.ZERO

var damag = 5
var might = 1
var bonus_dmg = 0

var atak_range = 1

var sound_volume = 0

func _ready():
	damag *= might
	$".".scale += (Vector2(1, 1) * (atak_range -1))
	
	$sound.volume_db = sound_volume
	$sound.play()


func _on_area_entered(area):
	if area.has_method("take_damag"):
		area.take_damag(damag + bonus_dmg)
	

func _on_timer_timeout():
	queue_free()


func _on_body_entered(body):
	if body.has_method("take_damag"):
		body.take_damag(damag)
