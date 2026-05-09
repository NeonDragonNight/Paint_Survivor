extends Node2D


var ico_list


func _ready():
	Engine.time_scale = 0
	
	var active_ico = ico_list.size()
	if active_ico == 0:
		$Label.show()
	
	if active_ico >= 1:
		var texture_path = ico_list[0].ico
		var texture = load(texture_path)
		$Sprite2D.texture = texture
		$Sprite2D.show()
	if active_ico >= 2:
		var texture_path = ico_list[1].ico
		var texture = load(texture_path)
		$Sprite2D2.texture = texture
		$Sprite2D2.show()
	if active_ico >= 3:
		var texture_path = ico_list[2].ico
		var texture = load(texture_path)
		$Sprite2D3.texture = texture
		$Sprite2D3.show()
	if active_ico >= 4:
		var texture_path = ico_list[3].ico
		var texture = load(texture_path)
		$Sprite2D4.texture = texture
		$Sprite2D4.show()
	if active_ico >= 5:
		var texture_path = ico_list[4].ico
		var texture = load(texture_path)
		$Sprite2D5.texture = texture
		$Sprite2D5.show()


func _on_button_pressed():
	Engine.time_scale = 1
	queue_free()
