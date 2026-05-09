extends Area2D


var valued = 5


func _on_area_entered(area):
	if area.has_method("range_up"):
		area.range_up(valued)
		queue_free()
