extends Camera2D

var speed = 1
func _physics_process(delta):
	var position = Vector2()
	position = self.position
	#print(position)
	position = Vector2(position.x+1, position.y)
	self.position = position
