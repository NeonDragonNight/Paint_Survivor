extends Area2D

var direction = Vector2.ZERO

var damag = 20
var might = 1

var player_node = null

var sound_volume = 0

func _ready():
	damag *= might
	$sound.volume_db = sound_volume
	$sound.play()
	


func _on_area_entered(area):
	if area.has_method("take_damag"):
		area.take_damag(damag)
	

func _on_timer_timeout():
	for i in range(4):
		atack()
	
	queue_free()


func _on_body_entered(body):
	if body.has_method("take_damag"):
		body.take_damag(damag)


func atack():
	const arow = preload("res://src/Weapons/lightning.tscn")
	var new = arow.instantiate()
	
	var x = randf_range(-100, 100)
	var y = randf_range(-50, 50)
	
	var paoition = global_position + Vector2(x, y)

	#$".".add_child(new_arow)
	#Vector2(x, y)
	
	new.global_position = paoition
	new.might = might
	player_node.add_sibling(new)
