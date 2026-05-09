extends Area2D

@onready var player = get_node("/root/level_1/Player")

#func _physics_process(_delta):
	#var direction = global_position.direction_to(player.global_position)
	
func _process(delta):
	global_position = player.global_position
