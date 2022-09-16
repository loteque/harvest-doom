extends Spatial


onready var nav = get_parent().get_node("AStar")
onready var unit = get_parent().get_node("Unit")
onready var marker = $Marker


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var e: InputEventMouseButton = event
		var camera = get_viewport().get_camera()
		var from = camera.project_ray_origin(e.position)
		var to = camera.project_ray_normal(e.position) * 1000

		var space_state = get_world().direct_space_state
		var result = space_state.intersect_ray(from, to, [self, unit])
		if result != null and not result.empty():
			if event.is_action_pressed("move"):
					unit.update_path(nav.find_path(unit.global_transform.origin, result.position))
					marker.global_transform.origin = result.position
