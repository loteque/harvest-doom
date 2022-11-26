extends MeshInstance

export (NodePath) var player_controller_path = "../../.."
export (NodePath) var camera_path = "../../../CameraController/CameraGimbal/Camera"
export (NodePath) var ray_path = "../../../CameraController/CameraGimbal/RayCast"

onready var player_controller_node: Node = get_node(player_controller_path)
onready var camera = get_node(camera_path)
onready var ray = get_node(ray_path)
onready var selector = get_node("Selector")
onready var detector = get_node("Detector")

# current ray intersection on gridmap
var ray_grid_map_intersection: Vector3
# current section position
var selection_position: Vector3

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _follow_camera(_delta: float) -> void:
	if !ray.is_colliding():
		visible = false
	else:
		ray_grid_map_intersection = get_ray_grid_intersection()
		global_transform.origin = get_selection_position()
		visible = true

# CURSOR HELPER FUNCTIONS

# return the meshlib item at the grid position of the cursor
func get_world_grid_cell_item() -> int:
	return get_placement_grid().get_cell_item(ray_grid_map_intersection.x,
											  ray_grid_map_intersection.y,
											  ray_grid_map_intersection.z)

# insert a meshlib item at the grid position of the cursor
func set_world_grid_cell_item(mesh_lib_item: int) -> void:
	get_placement_grid().set_cell_item(ray_grid_map_intersection.x,
									   ray_grid_map_intersection.y,
									   ray_grid_map_intersection.z,
									   mesh_lib_item)

#convert gridmap coordinate into worldspace coordinate
func get_selection_position() -> Vector3:
	return get_placement_grid().map_to_world(ray_grid_map_intersection.x, 
											 ray_grid_map_intersection.y,
											 ray_grid_map_intersection.z)

#convert collison point intro gridmap coordinate
func get_ray_grid_intersection() -> Vector3:
	return get_placement_grid().world_to_map(ray.get_collision_point())

# HANDLE DEPS

func get_placement_grid() -> GridMap:
	if player_controller_node.placement_grid:
		return player_controller_node.placement_grid
	else:
		print("Warning: (get_placement_grid) No grid configured, please configure a placement grid configured a default, but it will be ugly...")
		var placement_grid = GridMap.new()
		return placement_grid
