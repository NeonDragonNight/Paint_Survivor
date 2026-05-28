extends Sprite2D

var player


func _process(delta):
	$Label.text = str("%0.2f" % $skil_culdaun.time_left)


func _ready():
	player = $"..".get_node("..").get_node("..")
	
	$Marker2D.global_position = player.global_position

func akt():
	if $skil_culdaun.is_stopped() == true:
		
		
		const arow = preload("res://src/Player/archer/weapon/slow_zone.tscn")
		var new = arow.instantiate()

		new.global_position = player.global_position
		
		new.atak_range = player.atak_range
		
		player.add_sibling(new)
		
		
		$skil_culdaun.start()
		$Timer.start()
		$".".modulate = Color(0, 0.8, 0)
	else :
		$Timer.start()
		$".".modulate = Color(0.6, 0, 0)


func _on_timer_timeout():
	$".".modulate = Color(1, 1, 1)


func _on_work_time_timeout():
	pass # Replace with function body.
