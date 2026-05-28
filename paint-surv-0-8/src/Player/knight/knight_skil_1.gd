extends Sprite2D


var player

func _process(delta):
	$Label.text = str("%0.2f" % $skil_culdaun.time_left)
	
	player = $"..".get_parent().get_parent()


func akt():
	if $skil_culdaun.is_stopped() == true:
		const sword = preload("res://src/Weapons/sword_a.tscn")
		var new_sword = sword.instantiate()
		new_sword.might = player.might
		new_sword.rotation_spid = 10
		new_sword.damag = 15
		new_sword.scale = Vector2(1.8, 1)
		
		new_sword.sound_volume = player.sound_volume
		
		player.add_child(new_sword)
		$skil_culdaun.start()
		$Timer.start()
		$".".modulate = Color(0, 0.8, 0)
	else :
		$Timer.start()
		$".".modulate = Color(0.6, 0, 0)


func _on_timer_timeout():
	$".".modulate = Color(1, 1, 1)
