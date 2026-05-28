extends CharacterBody2D

var dmg = 1

var speed = 200


var player_node
@onready var player = get_node(player_node)


func _on_visible_on_screen_notifier_2d_screen_exited():
	$despavn_timer.start()

func _on_despavn_timer_timeout():
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_entered():
	$despavn_timer.stop()


func _physics_process(_delta):
	var distanse_to_player = (player.global_position).distance_to(global_position)
	
	if distanse_to_player <= 250.0:
		#velocity = Vector2.ZERO
		var direction = global_position.direction_to(player.global_position) * -1
		velocity = direction * (speed / 4)
	else:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * speed
	
	move_and_slide()


#Damage to player
func _on_danger_area_body_entered(body):
	if body.has_method("damag_to_player_cykl"):
		body.damag_to_player_cykl(dmg)


func _on_danger_area_body_exited(body):
	if body.has_method("damag_to_player_cykl_stop"):
		body.damag_to_player_cykl_stop(dmg)
