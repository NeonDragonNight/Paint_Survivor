extends PathFollow2D


var otstup = 0
var speed = 0.02

var might = 1

func _ready():
	$".".progress_ratio = otstup
	$Area2D.dmg *= might
	
	#print(otstup)

func _process(delta):
	$".".progress_ratio += speed


func _on_timer_timeout():
	queue_free()
