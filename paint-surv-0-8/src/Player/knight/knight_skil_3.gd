extends Sprite2D


var player
var base_speed = 0
#var base_armor = 0


func _process(delta):
	$Label.text = str("%0.2f" % $skil_culdaun.time_left)


func _ready():
	player = $"..".get_node("..").get_node("..")
	
	base_speed = player.base_speed
	#base_armor = player.base_armor


func akt():
	if $skil_culdaun.is_stopped() == true:
		
		player.base_speed *= 3
		#player.base_armor = 1
		
		player.player_stat_check()
		$work_time.start()
		
		$skil_culdaun.start()
		$Timer.start()
		$".".modulate = Color(0, 0.8, 0)
	else :
		$Timer.start()
		$".".modulate = Color(0.6, 0, 0)


func _on_timer_timeout():
	$".".modulate = Color(1, 1, 1)


func _on_work_time_timeout():
	player.base_speed = base_speed
	#player.base_armor = base_armor
	player.player_stat_check()
