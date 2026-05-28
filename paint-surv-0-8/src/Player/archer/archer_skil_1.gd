extends Sprite2D


var player
func _ready():
	player = $"..".get_node("..").get_node("..")
	
	$Marker2D.global_position = player.global_position


func _process(delta):
	$Label.text = str("%0.2f" % $skil_culdaun.time_left)
	


func akt():
	if $skil_culdaun.is_stopped() == true:
		var amount = player.amount
		for i in range(amount):
		
			const arow = preload("res://src/Player/archer/archer_arow_v_1.tscn")
			var new_arow = arow.instantiate()
			
			var enemies_in_range = $Area2D.get_overlapping_bodies()
		
			if enemies_in_range.size() > 0:
				var target_enemy = enemies_in_range.pick_random()
				$Marker2D.look_at(target_enemy.global_position)
			else :
				$Marker2D.look_at(Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)))
			
			new_arow.global_transform = $Marker2D.global_transform
			new_arow.might = player.might
			
			player.add_child(new_arow)
		
		
		$skil_culdaun.start()
		$Timer.start()
		$".".modulate = Color(0, 0.8, 0)
	else :
		$Timer.start()
		$".".modulate = Color(0.6, 0, 0)


func _on_timer_timeout():
	$".".modulate = Color(1, 1, 1)
