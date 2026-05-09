extends Area2D

var healt

var drop_list = ["res://src/Items/exp_1.tscn", "res://src/Items/colect_range_baff.tscn"]

var exp_path = "res://src/Items/exp_1.tscn"
var colect_range_baff_path = "res://src/Items/colect_range_baff.tscn"


var exp = ""


var pl


func _ready():
	healt = $"..".healt


func take_damag(damag):
	healt -= damag
	#$hp.text = "Hp: " + str(healt)
	if healt <= 0:
		
		
		var drop = randi_range(1, 3)
		if drop == 5:
			exp = preload("res://src/Items/colect_range_baff.tscn")
		else:
			exp = preload("res://src/Items/exp_1.tscn")
			
			
		#const exp = preload("res://src/Items/exp_1.tscn")
		if exp != null:
			var new_exp = exp.instantiate()
			new_exp.global_position = global_position
			$"..".add_sibling(new_exp)
		
		pl.coin_edit(randi_range(1, 2))
		pl.kill_plus()
		$"..".queue_free()
		
	
	#Otbrasyvanie
	#var player_pos = pl.global_position
	#var direction = global_position.direction_to(player_pos) * 50
	#$"..".position -= direction


func frfr(freez_time):
	$"..".freez(freez_time)
