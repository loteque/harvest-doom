extends Node

export (NodePath) var player_controller_path = ".."
export (NodePath) var camera_controller_path = "../CameraController"
export (NodePath) var ray_path = "../CameraController/CameraGimbal/RayCast"
export (NodePath) var cursor_path = "../CameraController/CameraGimbal/Cursor"

onready var player_controller: Node = get_node(player_controller_path)
onready var camera_controller = get_node(camera_controller_path)
onready var ray = get_node(ray_path)
onready var cursor = get_node(cursor_path)

func _ready():
	pass

func _process(delta):
	# Camera Movement
	camera_controller._move(delta)
	
	# CURSOR INPUTS
	cursor._handle_inputs()
		
func _physics_process(delta):
	cursor._follow_camera(delta)
