extends Spatial

# DEPENDANCIES
# Path to the node that is the grid of the surface the player controller interacts with. 
export (NodePath) var placement_grid_path = "../PlacementGrid"
# get the node via it's path
onready var placement_grid: GridMap = get_node(placement_grid_path)

# PLAYER DATA
export (float, 0, 100) var movement_speed = 10.0
var high_score: int
