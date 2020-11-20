extends Camera2D
var addspud = 1
var speed = 1
var addtoaddspud = 0.01
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
