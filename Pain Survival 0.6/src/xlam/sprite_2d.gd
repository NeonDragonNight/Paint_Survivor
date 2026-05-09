extends Sprite2D

var aa = 1
#
func _ready():
	$Timer.wait_time = 5
	$Timer.start()
	print($Timer.wait_time)
	
	#
	#$".".modulate = Color.BLUE
	#print(Color.BLUE)
	
	
	#print(aa)
	#print("b")
#
#
func _on_timer_timeout():
	print("ooo")
	#print($".".modulate)
	#
	#$".".modulate = Color(0.3200, 1, 1)
