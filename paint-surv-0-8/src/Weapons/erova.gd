extends Area2D

var direction = Vector2.ZERO

var damag = 3
var strength = 0

func _ready():
	
	if direction == Vector2.UP:
		rotation = deg_to_rad(-90)
	if direction == Vector2.LEFT:
		rotation = deg_to_rad(-180)
	if direction == Vector2.DOWN:
		rotation = deg_to_rad(90)
	
	damag += strength

func _process(delta):
	
	direction = direction.normalized() * 600

	position += direction * delta

func _on_area_entered(area):
	if area.has_method("take_damag"):
		area.take_damag(damag)
		queue_free()
	

func _on_timer_timeout():
	queue_free()


func _on_body_entered(body):
	if body.has_method("take_damag"):
		body.take_damag(damag)
		queue_free()
