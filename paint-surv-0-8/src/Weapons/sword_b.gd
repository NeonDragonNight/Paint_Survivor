extends Area2D

var rotation_spid = 5
#var back_rotation = false

var back_rotation = true

var damag = 10

func _ready():
	rotation = deg_to_rad(280)

func _process(delta):
	
	if rotation >= deg_to_rad(440):
		
		if back_rotation:
			#print("test")
			ba()
			back_rotation = false


	if ! back_rotation:
		rotation -= deg_to_rad(rotation_spid)
		if rotation <= deg_to_rad(-260):
			#queue_free()
			$".".hide()
	else:
		rotation += deg_to_rad(rotation_spid)


func ba():
	#rotation = deg_to_rad(250)
	rotation = deg_to_rad(-100)


func _on_area_entered(area):
	if area.has_method("take_damag"):
		area.take_damag(damag)


func _on_body_entered(body):
	if body.has_method("take_damag"):
		body.take_damag(damag)
