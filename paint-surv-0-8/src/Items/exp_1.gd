extends Area2D


var valued = 1


#func _on_body_entered(body):
	#if body.has_method("exp_up"):
		#body.exp_up(valued)
		#queue_free()




func _on_area_entered(area):
	if area.has_method("exp_up"):
		area.exp_up(valued)
		queue_free()
