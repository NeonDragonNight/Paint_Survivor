extends Area2D


var mob_list := []

var damage = 6
var might = 1


func _ready():
	damage *= might


func _on_area_entered(area):
	if area not in mob_list:
		mob_list.append(area)


func _on_live_time_timeout():
	queue_free()
	

func _on_damag_interval_timeout():
	for mob in mob_list:
		if mob.has_method("take_damag"):
			mob.take_damag(damage)
	
	#$".".scale *= 1.05
	

func _process(delta):
	$".".scale *= 1.015


func _on_area_exited(area):
	if area in mob_list:
		mob_list.erase(area)
