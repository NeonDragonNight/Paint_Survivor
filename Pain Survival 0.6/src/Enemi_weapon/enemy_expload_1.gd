extends Area2D


var might = 1
var dmg = 15


func _ready():
	dmg *= might


func _on_area_entered(area):
	if area.has_method("damag_to_player"):
		area.damag_to_player(dmg)


func _on_timer_timeout():
	queue_free()
