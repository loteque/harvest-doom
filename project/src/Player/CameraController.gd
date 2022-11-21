extends Spatial

# Export parameters exposing them to godots editor's inspector panel
export (float, 0, 100) var movement_speed = 10.0
export (NodePath) var scene_root

# Set Variables when tree is ready
onready var scene_root_node: Node = get_node(scene_root)
onready var camera = get_node("CameraGimbal/Camera")
onready var ray = get_node("CameraGimbal/RayCast")
onready var cursor = get_node("CameraGimbal/Cursor")

# Set variables at time of load
var ray_length = 1000
var grid_map_intersection
var selection_position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Overides the process() function (Adds functionality to the main loop.)
func _process(delta):
	#_move(delta)
	pass
	
# Overrides the physics_process() function, runs for every tick of the phys engine (constant time)
func _physics_process(delta):
	print("physics")
	_cursor_follow_camera(delta)
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
	
	if Input.is_action_just_pressed("ui_accept") and get_world_grid_cell_item() == 0:
		set_world_grid_cell_item(-1)
	
# Cursor functions
func _cursor_follow_camera(_delta: float) -> void:
	if !ray.is_colliding():
		cursor.visible = false
	else:
		#translategrid to the coords of the ray intersection
		get_placement_grid().global_transform.origin.y = ray.get_collision_point().y 
		#convert collison point intro gridmap coordinate
		grid_map_intersection = get_placement_grid().world_to_map(ray.get_collision_point())
		#convert gridmap coordinate into worldspace coordinate
		selection_position = get_placement_grid().map_to_world(grid_map_intersection.x, 
															 grid_map_intersection.y,
															 grid_map_intersection.z)
		#move cursor to converted worldspace coordinte
		cursor.global_transform.origin = selection_position
		#set the cursor to visible
		cursor.visible = true
# Cursor Helper Functions
func get_world_grid_cell_item() -> int:
	return get_placement_grid().get_cell_item(grid_map_intersection.x,
											  grid_map_intersection.y,
											  grid_map_intersection.z)
func set_world_grid_cell_item(mesh_lib_item: int) -> void:
	get_placement_grid().set_cell_item(grid_map_intersection.x,
									   grid_map_intersection.y,
									   grid_map_intersection.z,
									   mesh_lib_item)
# general helper function
func get_placement_grid() -> GridMap:
	print(scene_root_node)
	print(scene_root_node.placement_grid)
	return scene_root_node.placement_grid
