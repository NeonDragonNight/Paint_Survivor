extends Path2D


var might = 1

var player_node


func start():
	var projectiles = 8
	
	var otstup_part = (1.0 / projectiles)
	var otstup = 0
	
	for i in range(projectiles):
		var new = preload("res://src/Player/monk/ult_skils/ult1p2.tscn").instantiate()
		new.otstup = otstup
		
		$".".add_child(new)
		
		otstup += otstup_part
