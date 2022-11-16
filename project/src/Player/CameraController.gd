extends Spatial

# Export parameters exposing them to godots editor's inspector panel
export (float, 0, 100) var movement_speed
export (NodePath) var _map_path

# Set Variables when tree is ready
onready var camera = get_node("CameraController/Camera")
onready var ray = get_node("CameraController/RayCast")
onready var cursor = get_node("CameraController/Cursor")

# Set variables at time of load
var ray_length = 1000
var cursor_normal
var cursor_pos

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Overides the process() function (Adds functionality to the main loop.)
func _process(delta):
	_move(delta)

# Overrides the physics_process() function, runs for every tick of the phys engine (constant time)
func _physics_process(delta):
	# make a ray from one point extending in a defined direction
	pass
# Movement functions
func _move(delta: float) -> void:
	var velocity = Vector3()
	if Input.is_action_pressed("camera_forward"):
		velocity -= transform.basis.z
	if Input.is_action_pressed("camera_backward"):
		velocity += transform.basis.z
	if Input.is_action_pressed("camera_left"):
		velocity -= transform.basis.x
	if Input.is_action_pressed("camera_right"):
		velocity += transform.basis.x
	velocity = velocity.normalized()
	translation += velocity * delta * movement_speed
