extends Area2D


var travelled_distance = 0

var dmg = 13
var might = 1

var freez_time = 4

var sound_volume = 0

func _ready():
	dmg *= might
	$sound.volume_db = sound_volume - 8


func _physics_process(delta):
	#const SPEED = 1000
	const SPEED = 600
	const RANGE = 4200

	position += Vector2.RIGHT.rotated(rotation) * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()


#func _on_body_entered(body):
	#if body.has_method("freez"):
		#body.freez()
	##queue_free()
	#if body.has_method("take_damag"):
		#body.take_damag(1)
		#queue_free()


func _on_area_entered(area):
	if area.has_method("take_damag"):
		area.take_damag(dmg)
		area.frfr(freez_time)
		$sound.play()


func _on_timer_timeout():
	queue_free()
