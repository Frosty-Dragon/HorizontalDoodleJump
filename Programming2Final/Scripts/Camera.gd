extends Camera2D
#Here we speed up the camera over time
var addspud = 1
var speed = 1
var addtoaddspud = 0.01
#Here we check hard mode is on
func _ready():
	if Global.HardMode == true:
		addtoaddspud = 0.07
func _physics_process(delta):
	var position = Vector2()
	position = self.position
	#print(position)
	position = Vector2(position.x+addspud, position.y)
	self.position = position
	Global.Camerapos = position
	addspud += addtoaddspud
