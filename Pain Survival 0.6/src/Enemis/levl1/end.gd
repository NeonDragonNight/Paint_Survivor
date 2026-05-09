extends CharacterBody2D

var drop_list = ["res://src/Items/exp_1.tscn"]

var healt = 99999999
var dmg = 0

var coin = 0

var speed = 20

var frozen = false

var player_node
var player


func _ready():
	player = player_node
	$danger_area.pl = player
	
	$AnimatedSprite2D.play("default")


func _on_visible_on_screen_notifier_2d_screen_exited():
	$desp_time.start()

func _on_desp_time_timeout():
	var rand_x = -1
	if randi_range(0, 1) == 1:
		rand_x = 1
	var x = 600 * rand_x
	
	var rand_y = -1
	if randi_range(0, 1) == 1:
		rand_y = 1
	var y = 600 * rand_y
	
	var tp_area = Vector2(x, y)
	global_position = player.global_position + tp_area

func _on_visible_on_screen_notifier_2d_screen_entered():
	$desp_time.stop()


var direction

func _physics_process(_delta):
		direction = global_position.direction_to(player.global_position)
		velocity = direction * speed
		move_and_slide()
		


#Damage to player
func _on_danger_area_body_entered(body):
		if body.has_method("endd"):
			body.endd()


#func _on_danger_area_body_exited(body):
	#if body.has_method("damag_to_player_cykl_stop"):
		#body.damag_to_player_cykl_stop(dmg)


func freez(freez_time):
	$freez_t.wait_time = freez_time
	frozen = true
	$AnimatedSprite2D.modulate = Color(1, 1, 1)
	$AnimatedSprite2D.pause()
	$freez_t.start()


func _on_freez_t_timeout():
	frozen = false
	$AnimatedSprite2D.modulate = Color(1, 1, 1)
	$AnimatedSprite2D.play("default")
	$freez_t.stop()


func kik(kik):
	pass
