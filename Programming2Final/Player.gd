extends KinematicBody2D

const WALK_FORCE = 450
const WALK_MAX_SPEED = 470
const STOP_FORCE = 700
const JUMP_SPEED = 700

var velocity = Vector2()

onready var gravity = 1500 #ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Horizontal movement code. First, get the player's input.
	var walk = WALK_FORCE * (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))
	# Slow down the player if they're not trying to move.
	if abs(walk) < WALK_FORCE * 0.2:
		# The velocity, slowed down a bit, and then reassigned.
		velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
	else:
		velocity.x += walk * delta
	# Clamp to the maximum horizontal movement speed.
	velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)

	# Vertical movement code. Apply gravity.
	velocity.y += gravity * delta

	# Move based on the velocity and snap to the ground.
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)

	# Check for jumping. is_on_floor() must be called after movement code.
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = -JUMP_SPEED



func _on_Area2D_area_entered(area):
	print(area.get_name())
	print(area)
	if area.get_name() == "CameraKiller":
		print("Collided With Camera edge")
		Global.gameover = true
	if area.get_name() == "FloorKiller":
		print("Fell into the void")
		Global.gameover = true
	if area.get_name() == "Final Platform":
		Global.winner = true
