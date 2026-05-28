extends Sprite2D

var ult_cup = 2
var ult_energy = 0

var player


func _ready():
	player = $"..".get_node("..").get_node("..")
	$ProgressBar.max_value = ult_cup
	
	$ult2_Path2D.global_position = player.global_position
	$Marker2D.global_position = player.global_position


func add_ult_energy():
	ult_energy += 1
	bar_update()


func akt():
	if ult_energy >= ult_cup:
		ult_energy -= ult_cup
		
		$ult2_Path2D/ult2_PathFollow2D.progress_ratio = 0
		$shut.start()
		$work_time.start()
		
		$Timer.start()
		$".".modulate = Color(0, 0.8, 0)
		
		bar_update()
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


func _on_shut_timeout():
	const arow = preload("res://src/Player/archer/archer_arow_v_1.tscn")
	var new_arow = arow.instantiate()

	$Marker2D.look_at($ult2_Path2D/ult2_PathFollow2D/Marker2D.global_position)
	
	new_arow.global_transform = $Marker2D.global_transform
	new_arow.might = player.might
	
	player.add_child(new_arow)
	
	
	$ult2_Path2D/ult2_PathFollow2D.progress_ratio += 0.05


func _on_work_time_timeout():
	$shut.stop()
