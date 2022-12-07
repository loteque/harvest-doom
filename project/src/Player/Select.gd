extends Node

export (NodePath) onready var cursor_path = ".."

onready var cursor = get_node(cursor_path) 

func _on_select_first_soul() -> void:
		Signals.emit_signal("first_soul_collected")
		Signals.emit_signal("souls_detected", 1)
		cursor.set_world_grid_cell_item(-1)

func _place_plant():
	if cursor.grid_cell_menu_item < 0:
		return
	else:
		cursor.set_world_grid_cell_item(cursor.get_grid_cell_menu_item())
