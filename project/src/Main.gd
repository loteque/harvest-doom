extends Spatial

# listener node paths
export (NodePath) var static_ui_listener_path = "Mall/StaticUI"
onready var static_ui_listener_node = get_node(static_ui_listener_path)

func _ready() -> void:
	pass
