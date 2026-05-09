extends CharacterBody2D

#var healt = 3
var dmg = 1

#var speed = 200
var speed = 100


var frozen = false

#@onready var player = get_node("/root/level_1/Player")


#var set_player
#var player
#
#func _ready():
	#player

var player_node
@onready var player = get_node(player_node)


func _ready():
	$danger_area.pl = player


func _on_visible_on_screen_notifier_2d_screen_exited():
	$despavn_timer.start()

func _on_despavn_timer_timeout():
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_entered():
	$despavn_timer.stop()


#Damage to enemi
#func take_damag(damag):
	#healt -= damag
	#if healt == 0:
		#queue_free()


func _physics_process(_delta):
	if ! frozen:
	
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * speed
		move_and_slide()
	
	#if healt == 0:
		#queue_free()


#Damage to player
func _on_danger_area_body_entered(body):
	if body.has_method("damag_to_player_cykl"):
		body.damag_to_player_cykl(dmg)


func _on_danger_area_body_exited(body):
	if body.has_method("damag_to_player_cykl_stop"):
		body.damag_to_player_cykl_stop(dmg)


func freez(freez_time):
	$freez_timer.wait_time = freez_time
	frozen = true
	$Sprite2D.modulate = Color(0.3200, 1, 1)
	$freez_timer.start()


func _on_freez_timer_timeout():
	frozen = false
	$Sprite2D.modulate = Color(1, 1, 1)
	$freez_timer.stop()
