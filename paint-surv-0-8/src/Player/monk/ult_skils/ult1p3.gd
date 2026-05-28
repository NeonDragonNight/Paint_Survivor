extends Area2D


var might = 1
var dmg = 10

var bonus_dmg = 0


func _on_area_entered(area):
	if area.has_method("take_damag"):
		area.take_damag(dmg + bonus_dmg)


var kik_pow = 40
func _on_body_entered(body):
	if body.has_method("kik"):
		body.kik(kik_pow)
