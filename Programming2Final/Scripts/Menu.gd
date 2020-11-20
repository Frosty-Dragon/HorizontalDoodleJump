extends Control
class_name menu
func _ready():
	print(Global.WASD)
func _process(delta):
	#print($Control/WASD.toggle_mode)
	if $PlayButton/Button.pressed == true:
		var _scene = get_tree().change_scene("res://Level1.tscn")
		print("Play button pressed")

func _on_WASD_toggled(button_pressed):
	if button_pressed == true:
		Global.WASD = true
	if button_pressed == false:
		Global.WASD = false

func _on_HardMode_toggled(button_pressed):
	if button_pressed == true:
		Global.HardMode = true
	if button_pressed == false:
		Global.HardMode = false
