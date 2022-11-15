extends Spatial

# Export parameters exposing them to godots editor's inspector panel
export (float, 0, 100) var movement_speed

# Set variables time of load


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Overides the process() function (Adds functionality to the main loop.)
func _process(delta):
	_move(delta)

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
