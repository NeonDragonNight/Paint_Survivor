extends Sprite2D


func _process(delta):
	$Label.text = str("%0.2f" % $skil_culdaun.time_left)


func akt():
	if $skil_culdaun.is_stopped() == true:
		
		$"..".get_parent().get_parent().heal(10)
		
		$skil_culdaun.start()
		$Timer.start()
		$".".modulate = Color(0, 0.8, 0)
	else :
		$Timer.start()
		$".".modulate = Color(0.6, 0, 0)


func _on_timer_timeout():
	$".".modulate = Color(1, 1, 1)
