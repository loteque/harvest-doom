extends MeshInstance

export (NodePath) var scene_root_path = "../../.."
export (NodePath) var camera_path = "../../../CameraController/CameraGimbal/Camera"
export (NodePath) var ray_path = "../../../CameraController/CameraGimbal/RayCast"

onready var scene_root_node: Node = get_node(scene_root_path)
onready var camera = get_node(camera_path)
onready var ray = get_node(ray_path)

var grid_map_intersection
var selection_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _follow_camera(_delta: float) -> void:
	if !ray.is_colliding():
		visible = false
	else:
		#convert collison point intro gridmap coordinate
		grid_map_intersection = get_placement_grid().world_to_map(ray.get_collision_point())
		#convert gridmap coordinate into worldspace coordinate
		selection_position = get_placement_grid().map_to_world(grid_map_intersection.x, 
															 grid_map_intersection.y,
															 grid_map_intersection.z)
		# move cursor to converted worldspace coordinte
		global_transform.origin = selection_position
		# set the cursor to visible
		visible = true

func detect_soul():
	if get_world_grid_cell_item() == 0:
		Signals.emit_signal("souls_detected", 1)

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

# Handle Dependencies
func get_placement_grid() -> GridMap:
	if scene_root_node.placement_grid:
		return scene_root_node.placement_grid
	else:
		print("Warning: No grid configured, please configure a placement grid")
		var placement_grid = GridMap.new()
		return placement_grid
