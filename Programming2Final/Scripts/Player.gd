class_name Player extends ControlableObject



func _on_Area2D_area_entered(area):
	print(area.get_name())
	print(area)
	if area.get_name() == "CameraKiller":
		print("Collided With Camera edge")
		Global.gameover = true
		yield(get_tree().create_timer(1.0), "timeout")
		var _scene = get_tree().change_scene("res://Lose.tscn")
	if area.get_name() == "FloorKiller":
		print("Fell into the void")
		Global.gameover = true
		yield(get_tree().create_timer(1.0), "timeout")
		var _scene = get_tree().change_scene("res://Lose.tscn")
	if area.get_name() == "Final Platform":
		print("You won")
		Global.winner = true
		yield(get_tree().create_timer(1.0), "timeout")
		var _scene = get_tree().change_scene("res://Win.tscn")
