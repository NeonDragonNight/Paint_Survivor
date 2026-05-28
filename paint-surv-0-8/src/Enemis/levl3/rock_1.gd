extends CharacterBody2D

var drop_list = ["res://src/Items/exp_1.tscn"]

var healt = 1
var dmg = 0.2

var speed = 150

var coin = 1

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
	queue_free()

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
	global_position = global_position - (direction * kik)


func _on_explota_body_entered(body):
	if body.has_method("player"):
		const arow = preload("res://src/Enemi_weapon/enemy_expload_1.tscn")
		var new_arow = arow.instantiate()
		new_arow.global_transform = global_transform
	
		$"..".add_sibling(new_arow)
		queue_free()
		
