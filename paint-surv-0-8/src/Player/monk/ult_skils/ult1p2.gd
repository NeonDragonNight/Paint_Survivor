extends PathFollow2D


var otstup = 0
var speed = 0.04

var bonus_dmg = 0

var might = 1

func _ready():
	$".".progress_ratio = otstup
	$spiner.dmg *= might
	$spiner.bonus_dmg = bonus_dmg


func _process(delta):
	$".".progress_ratio += speed


func _on_timer_timeout():
	queue_free()
