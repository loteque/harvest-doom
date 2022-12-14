extends Spatial

# DEPENDANCIES
# Path to the node that is the grid of the surface the player controller interacts with. 
export (NodePath) var placement_grid_path = "../PlacementGrid"
# get the node via it's path
onready var placement_grid: GridMap = get_node(placement_grid_path)

# PLAYER DATA
export (float, 0, 100) var movement_speed = 10.0

var high_score: int
var cursor_pos: int
var player_souls: int

#PLAYER CONTROLLER METHODS
func get_cursor_position() -> Vector3:
	return Vector3(0,0,0)

func get_gridmesh_item_under_cursor() -> Dictionary:
	return {"Placeholder Dictionary": "This is a future dictionary of gridmesh items under the cursor",
			"Item Name": "MeshLib Index"}

func change_player_souls(num_souls) -> int:
	var changed_player_souls = player_souls + num_souls
	return changed_player_souls
	
func _ready():
	# TESTS
	print("TESTS: PlayerController")
	print(get_cursor_position())
	print(get_gridmesh_item_under_cursor())
