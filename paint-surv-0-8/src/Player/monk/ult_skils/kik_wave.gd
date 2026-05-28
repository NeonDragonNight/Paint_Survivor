extends Area2D


func _process(delta):
	$".".scale *= 1.1


func _on_timer_timeout():
	queue_free()


func _on_body_entered(body):
	if body.has_method("kik"):
		body.kik(100)
