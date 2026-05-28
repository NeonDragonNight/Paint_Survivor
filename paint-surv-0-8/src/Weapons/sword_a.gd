extends Area2D

var rotation_spid = 5

var back_rotation = true

var damag = 0

var might = 1
var amount = 1

var sound_volume = 0

func _ready():
	rotation = deg_to_rad(-80)
	damag = (damag * might)
	
	$AudioStreamPlayer.volume_db = sound_volume - 8
	#print("dmg: ", damag)

func _process(delta):
	
	if rotation >= deg_to_rad(80):
		
		if back_rotation:
			ba()
			back_rotation = false


	if ! back_rotation:
		rotation -= deg_to_rad(rotation_spid)
		if rotation <= deg_to_rad(-260):
			queue_free()
	else:
		rotation += deg_to_rad(rotation_spid)


func ba():
	rotation = deg_to_rad(-100)


func _on_area_entered(area):
	if area.has_method("take_damag"):
		$AudioStreamPlayer.play()
		area.take_damag(damag)


var kik_pow = 40
func _on_body_entered(body):
	if body.has_method("kik"):
		body.kik(kik_pow)
