extends Node

onready var edgeofscreen = $Camera2D/Node2D2
#edgeofscreen = edgeofscreen.instance()

var Singleblock = load("res://Terrains/SingleBlock.tscn")
var Doubleblock = load("res://Terrains/SingleBlock.tscn")
var Tripleblock = load("res://Terrains/SingleBlock.tscn")
onready var GameOver = get_node("Game Over")
func instanceblocks():
	var block1 = Singleblock.instance()
	var block2 = Doubleblock.instance()
	var block3 = Tripleblock.instance()
	generate(block1, block2, block3)

func generate(block1, block2, block3):
	add_child(block1)
	
func ongamestart():
	pass
	
func _ready():
	GameOver.visible = false
	instanceblocks()
func _physics_process(_delta):
	if Global.gameover == true:
		print(GameOver.visible)
