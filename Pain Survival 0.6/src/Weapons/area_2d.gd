extends Area2D


var might = 1
var dmg = 10


#func _physics_process(delta):
	#const SPEED = 200
	#const RANGE = 1200
#
	#position += Vector2.RIGHT.rotated(rotation) * SPEED * delta
	#
	#travelled_distance += SPEED * delta
	#if travelled_distance > RANGE:
		#queue_free()


#func _on_body_entered(body):
	##queue_free()
	#if body.has_method("take_damag"):
		#body.take_damag(1)
		#queue_free()


func _on_area_entered(area):
	if area.has_method("take_damag"):
		area.take_damag(dmg)
