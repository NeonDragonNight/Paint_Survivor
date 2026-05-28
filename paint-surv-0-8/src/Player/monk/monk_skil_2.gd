extends Sprite2D


var player

func _ready():
	player = $"..".get_node("..").get_node("..")


func _process(delta):
	$Label.text = str("%0.2f" % $skil_culdaun.time_left)


func akt():
	if $skil_culdaun.is_stopped() == true:
		
		$heal.start()
		$work_time.start()
		
		$skil_culdaun.start()
		$Timer.start()
		$".".modulate = Color(0, 0.8, 0)
	else :
		$Timer.start()
		$".".modulate = Color(0.6, 0, 0)


func _on_timer_timeout():
	$".".modulate = Color(1, 1, 1)


func _on_heal_timeout():
	player.heal(2)


func _on_work_time_timeout():
	$heal.stop()
