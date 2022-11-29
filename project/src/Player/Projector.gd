extends Node

export (NodePath) onready var cursor_path = ".."

onready var cursor = get_node(cursor_path) 

func _set_mesh(item_id) -> void:
	if item_id < 0:
		cursor.selection_mesh.visible = true
	else:
		cursor.selection_mesh.visible = false
		cursor.attractor_mesh.visible = true

func _ready():
	print("SMOKE TEST: PlayerController/Cursor/Projector")
	print("cursor: " + str(cursor))
