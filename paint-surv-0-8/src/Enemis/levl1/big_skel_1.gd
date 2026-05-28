extends CharacterBody2D

var drop_list = ["res://src/Items/chest_1.tscn"]

var healt = 100
var dmg = 6

var speed = 60
var coin = 420

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
	var x = 300 * rand_x
	
	var rand_y = -1
	if randi_range(0, 1) == 1:
		rand_y = 1
	var y = 300 * rand_y
	
	var tp_area = Vector2(x, y)
	global_position = player.global_position + tp_area

func _on_visible_on_screen_notifier_2d_screen_entered():
	$desp_time.stop()


var direction

func _physics_process(_delta):
	direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	
	if frozen:
		velocity = direction * 0
	
	move_and_slide()


func freez(freez_time):
	$freez_t.wait_time = freez_time
	frozen = true
	$AnimatedSprite2D.modulate = Color(0.3200, 1, 1)
	$AnimatedSprite2D.pause()
	$freez_t.start()


func _on_freez_t_timeout():
	frozen = false
	$AnimatedSprite2D.modulate = Color(1, 1, 1)
	$AnimatedSprite2D.play("default")
	$freez_t.stop()


func kik(kik):
	if ! frozen:
		global_position = global_position - (direction * kik)


func elit():
	player.add_ult_energy()
