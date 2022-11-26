extends Spatial

# Export parameters exposing them to godots editor's inspector panel
export (NodePath) var player_controller_path = ".."

# Set Variables when tree is ready
onready var player_controller: Node = get_node(player_controller_path)
onready var cursor = get_node("CameraGimbal/Cursor")

# Set variables at time of load
var ray_length = 1000

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
	translation += velocity * delta * player_controller.movement_speed
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
