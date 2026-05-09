extends Area2D

var kords
var direction

var speed = 400

var might = 1
var dmg = 3

var liv_time = 1

#var direction = Vector2(randf_range(-1, 1), randf_range(-1, 1))

#@onready var player_node = get_node("..")


func _ready():
	direction = global_position.direction_to(kords)
	dmg *= might
	
	$live_time.wait_time *= liv_time
	
	#print(get_node(".."))


func _physics_process(_delta):

	
	position +=  direction * speed * _delta
	
	#position.normalized()
	

func _on_area_entered(area):
	if area.has_method("take_damag"):
		area.take_damag(dmg)


func _on_up_screen_exited():
	direction.y *= -1


func _on_down_screen_exited():
	direction.y *= -1


func _on_right_screen_exited():
	direction.x *= -1


func _on_left_screen_exited():
	direction.x *= -1


func _on_live_timer_timeout():
	queue_free()
	
