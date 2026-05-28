extends PathFollow2D


var otstup = 0
var speed = 0.02

var might = 1

var sound_volume = 0

func _ready():
	$".".progress_ratio = otstup
	$Area2D.dmg *= might
	
	$sound.volume_db = sound_volume
	$sound.play()
	
	#print(otstup)

func _process(delta):
	$".".progress_ratio += speed


func _on_timer_timeout():
	queue_free()
