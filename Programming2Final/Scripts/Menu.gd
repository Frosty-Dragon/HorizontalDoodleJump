extends Control
class_name menu
#This script takes care of button handling
func _ready():
	print(Global.WASD)
func _process(delta):
	#Here we check if the "play" button has been pressed
	#print($Control/WASD.toggle_mode)
	if $PlayButton/Button.pressed == true:
		var _scene = get_tree().change_scene("res://Level1.tscn")
		print("Play button pressed")

# here we check if any of the options have been togled
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
