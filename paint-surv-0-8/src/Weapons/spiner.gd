extends Area2D


var travelled_distance = 0

var might = 1
var dmg = 2

var bonus_dmg = 0


func _on_area_entered(area):
	if area.has_method("take_damag"):
		area.take_damag(dmg + bonus_dmg)
