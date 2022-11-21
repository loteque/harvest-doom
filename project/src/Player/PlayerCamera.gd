extends Spatial

# get the 
export (NodePath) var grid_path

onready var placement_grid: GridMap = get_node(grid_path)

var high_score: int


func _ready():
	#print(cursor_projection_surface.name)
	print("parent")
	print(self.placement_grid)
