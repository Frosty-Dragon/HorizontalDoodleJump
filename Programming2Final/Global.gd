extends Node

var gameover = false

func _physics_process(delta):
	if gameover == true:
		print("Game over")
		get_tree().paused = true
