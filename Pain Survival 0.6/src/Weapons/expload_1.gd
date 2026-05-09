extends Area2D


var might = 1
var dmg = 30


func _ready():
	dmg *= might


func _on_area_entered(area):
	if area.has_method("take_damag"):
		area.take_damag(dmg)


func _on_timer_timeout():
	queue_free()
