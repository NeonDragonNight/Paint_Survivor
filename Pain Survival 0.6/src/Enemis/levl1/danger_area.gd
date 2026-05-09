extends Area2D

var healt

var drop_list

#var exp_path = "res://src/Items/exp_1.tscn"
#var colect_range_baff_path = "res://src/Items/colect_range_baff.tscn"


var exp = ""

var pl

var coin


func _ready():
	healt = $"..".healt
	drop_list = $"..".drop_list
	coin = $"..".coin


func take_damag(damag):
	healt -= damag
	if healt <= 0:
		var drop_path = drop_list[0]
		var exp : PackedScene = load(drop_path)
			
		if exp != null:
			var new_exp = exp.instantiate()
			new_exp.global_position = global_position
			$"..".add_sibling(new_exp)
		
		pl.coin_edit(coin)
		pl.kill_plus()
		$"..".queue_free()


func frfr(freez_time):
	$"..".freez(freez_time)
