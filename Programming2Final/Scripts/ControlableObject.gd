class_name ControlableObject extends AnimateObject

var WALK_FORCE = 420
var WALK_MAX_SPEED = 500
var STOP_FORCE = 700
var JUMP_SPEED = 800
var walk = null
var velocity = Vector2()

#onready var gravity = 1500 #ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	print(Global.WASD)
	if Global.HardMode == true:
		WALK_FORCE = 1200
		WALK_MAX_SPEED = 1300
		gravity = 1800
		print("WASD is activated and Walkf foroce is ", WALK_FORCE)
func _physics_process(delta):
	if Global.WASD == false:
		# Horizontal movement code. First, get the player's input.
		walk = WALK_FORCE * (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))
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
	if Global.WASD == true:
		# Horizontal movement code. First, get the player's input.
		walk = WALK_FORCE * (Input.get_action_strength("D") - Input.get_action_strength("A"))
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
		if is_on_floor() and Input.is_action_just_pressed("W"):
			velocity.y = -JUMP_SPEED
