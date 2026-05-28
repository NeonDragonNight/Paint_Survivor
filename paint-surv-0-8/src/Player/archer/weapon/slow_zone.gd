extends Area2D


var mob_list := []

var live_time = 5

var atak_range = 1


func _ready():
	$live_time.start(live_time)
	
	$".".scale += (Vector2(1, 1) * (atak_range -1))


func _on_live_time_timeout():
	queue_free()


func _on_body_entered(body):
	if body.has_method("kik"):
		body.speed /= 6


func _on_body_exited(body):
	if body.has_method("kik"):
		body.speed *= 6
