extends Spatial

#initalize nodes used by Selection Controller
onready var cursor_mesh = get_node("CursorMesh")
onready var ray = get_node("RayCast")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	



func _on_SelectionController_ready():
	pass # Replace with function body.
