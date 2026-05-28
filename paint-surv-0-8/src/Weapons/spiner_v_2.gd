extends PathFollow2D


var otstup = 0
var speed = 0.005

var bonus_dmg = 0

var might = 1

var sound_volume = 0

func _ready():
	$".".progress_ratio = otstup
	$spiner.dmg *= might
	$spiner.bonus_dmg = bonus_dmg
	
	$sound.volume_db = sound_volume
	$sound.play()
	
	#print(otstup)

func _process(delta):
	$".".progress_ratio += speed


func _on_timer_timeout():
	queue_free()
