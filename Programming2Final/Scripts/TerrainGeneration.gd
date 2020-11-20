extends Node
var Node2d = Node2D.new()
#var root_node = get_tree().get_edited_scene_root()
var Singleblock = load("res://Terrains/SingleBlock.tscn")
var Doubleblock = load("res://Terrains/SingleBlock.tscn")
var Tripleblock = load("res://Terrains/SingleBlock.tscn")
var scene = load("res://Game Over.tscn")
var GameOver = scene.instance()
func instanceblocks():
	var block1 = Singleblock.instance()
	var block2 = Doubleblock.instance()
	var block3 = Tripleblock.instance()
	generate(block1, block2, block3)
func generate(block1, block2, block3):
	#add_child(block1)
	#block1.position = Global.Camerapos.x + 50
	pass
func ongamestart():
	pass
	
func _ready():
#	GameOver.visible = false
	instanceblocks()
	print(Node2d.position)
func _physics_process(_delta):
	var camerposition = Global.Camerapos
	#Node2d.position = camerposition.AXIS_X + 1000
	if Global.gameover == true:
		add_child(Node2d)
