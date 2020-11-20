extends Node
#This script stores global variables

var gameover = false
var Camerapos = Vector2()
var winner = false
var WASD = false
var HardMode = false

#This method pauses physics if the player has won or lost
func _process(_delta):
	if gameover == true:
		get_tree().paused = true
	if winner == true:
		get_tree().paused = true
