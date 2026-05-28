extends Sprite2D


var player
func _ready():
	player = $"..".get_node("..").get_node("..")


func _process(delta):
	$Label.text = str("%0.2f" % $skil_culdaun.time_left)
	


func akt():
	if $skil_culdaun.is_stopped() == true:
		
		
		const sword = preload("res://src/Player/monk/ult_skils/kik_wave.tscn")
		var new_sword = sword.instantiate()
		$"..".get_parent().get_parent().add_child(new_sword)
		
		player.add_child(new_sword)
		
		
		$skil_culdaun.start()
		$Timer.start()
		$".".modulate = Color(0, 0.8, 0)
	else :
		$Timer.start()
		$".".modulate = Color(0.6, 0, 0)


func _on_timer_timeout():
	$".".modulate = Color(1, 1, 1)
