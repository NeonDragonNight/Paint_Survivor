extends Area2D


var travelled_distance = 0


var healt = 1


func take_damag(damag):
	healt -= damag
	if healt <= 0:
		queue_free()


func _physics_process(delta):
	#const SPEED = 1000
	const SPEED = 150
	const RANGE = 1200

	position += Vector2.RIGHT.rotated(rotation) * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body):
	if body.has_method("damag_to_player"):
		body.damag_to_player(5)
		queue_free()
