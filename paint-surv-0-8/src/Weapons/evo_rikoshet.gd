extends Area2D

var kords
var direction

var speed = 400

var might = 1
var dmg = 16

#var direction = Vector2(randf_range(-1, 1), randf_range(-1, 1))

#@onready var player_node = get_node("..")
var sound_volume = 0


func _ready():
	direction = global_position.direction_to(kords)
	dmg *= might
	
	$sound.volume_db = sound_volume
	
	#print(kords)


func _physics_process(_delta):

	
	position +=  direction * speed * _delta
	$Sprite2D.rotate(0.15)
	
	#position.normalized()
	

func _on_area_entered(area):
	if area.has_method("take_damag"):
		area.take_damag(dmg)
		
		const arow = preload("res://src/Weapons/expload_1.tscn")
		var new_arow = arow.instantiate()
		new_arow.global_transform = global_transform
		
		new_arow.sound_volume = sound_volume
	
		new_arow.might = might
		$"..".add_sibling(new_arow)
		
		$sound.play()


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
	
