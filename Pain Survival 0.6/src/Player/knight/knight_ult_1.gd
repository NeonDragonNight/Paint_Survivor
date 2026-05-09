extends Sprite2D

var ult_cup = 2
var ult_energy = 0


func add_ult_energy():
	ult_energy += 1
	bar_update()


func akt():
	if ult_energy >= ult_cup:
		ult_energy -= ult_cup
		
		$"..".get_parent().get_parent().shild_hp += 25
		
		$Timer.start()
		$".".modulate = Color(0, 0.8, 0)
		
		bar_update()
	else :
		$Timer.start()
		$".".modulate = Color(0.6, 0, 0)


func bar_update():
	if ult_energy <= ult_cup:
		$ProgressBar.modulate = Color(0, 0.3, 1)
		$ProgressBar.value = ult_energy
		$ProgressBar/Label.text = ""

	elif ult_energy <= (ult_cup*2):
		$ProgressBar.modulate = Color(0, 0.6, 1)
		$ProgressBar.value = ult_energy - ult_cup
		$ProgressBar/Label.text = "+1"

	elif ult_energy <= (ult_cup*3):
		$ProgressBar.modulate = Color(0, 0.9, 1)
		$ProgressBar.value = ult_energy - (ult_cup*2)
		$ProgressBar/Label.text = "+2"



func _on_timer_timeout():
	$".".modulate = Color(1, 1, 1)
