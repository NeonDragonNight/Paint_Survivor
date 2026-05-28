extends Area2D

var kords
var direction

var speed = 400

var might = 1
var dmg = 3

var liv_time = 1
var sound_volume = 0


func _ready():
	direction = global_position.direction_to(kords)
	dmg *= might
	
	$live_timer.wait_time *= liv_time
	$sound.volume_db = sound_volume - 8


func _physics_process(_delta):
	position +=  direction * speed * _delta
	
	$Sprite2D.rotate(0.15)


func _on_area_entered(area):
	if area.has_method("take_damag"):
		area.take_damag(dmg)
		$sound.play()


func _on_up_screen_exited():
	direction.y *= -1


func _on_down_screen_exited():
	direction.y *= -1


func _on_right_screen_exited():
	direction.x *= -1


func _on_left_screen_exited():
	direction.x *= -1


func _on_live_timer_timeout():
	queue_free()
	
