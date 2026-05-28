extends Sprite2D

var ult_cup = 2
var ult_energy = 0

var base_speed = 0
var base_might = 0

var player

var aktiv = false

func _ready():
	player = $"..".get_node("..").get_node("..")
	
	base_speed = player.base_speed
	base_might = player.base_might
	
	$ProgressBar.max_value = ult_cup


func add_ult_energy():
	ult_energy += 1
	bar_update()


func akt():
	if ult_energy >= ult_cup:
		if ! aktiv:
			ult_energy -= ult_cup
			
			player.base_speed *= 1.5
			player.base_might += 1
			
			player.player_stat_check()
			player.level_up_chek()
			
			$work_time.start()
			$heal.start()
			
			$Timer.start()
			$".".modulate = Color(0, 0.8, 0)
			
			bar_update()
		else :
			$Timer.start()
			$".".modulate = Color(0.6, 0, 0)
	else :
		$Timer.start()
		$".".modulate = Color(0.6, 0, 0)


func bar_update():
	var step = 1
	var numb = 0
	var colo = 0
	while (true):
		if ult_energy > (ult_cup*step):
			numb += 1
			step += 1
			if colo < 1:
				colo += 0.2
		else :
			$ProgressBar.modulate = Color(0, colo, 1)
			$ProgressBar.value = ult_energy - (ult_cup*numb)
			if numb == 0:
				$ProgressBar/Label.text = ""
			else:
				$ProgressBar/Label.text = "+" + str(numb)
			break



func _on_timer_timeout():
	$".".modulate = Color(1, 1, 1)


func _on_heal_timeout():
	player.heal(1)


func _on_work_time_timeout():
	$heal.stop()
	player.base_speed = base_speed
	player.base_might = base_might
	player.player_stat_check()
	player.level_up_chek()
