extends Node

var gameover = false
var Camerapos = Vector2()
var winner = false

func _process(_delta):
	if gameover == true:
		print("Game over")
		get_tree().paused = true
	if winner == true:
		print("You win")
		get_tree().paused = true
