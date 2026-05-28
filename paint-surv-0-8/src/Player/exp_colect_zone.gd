extends Area2D


#var up = 0

@onready var base = $".".scale


func exp_up(exp):
	$"..".exp_up(exp)


func range_up(value):
	#up = value
	
	$".".scale *= value
	$Timer.start()


func _on_timer_timeout():
	$".".scale = base
	$Timer.stop()
