extends Area2D


func _ready():
	$AnimatedSprite2D.play("default")
	#$AnimatedSprite2D.play_backwards("default")


func _on_body_entered(body):
	if body.has_method("win"):
		body.win()
