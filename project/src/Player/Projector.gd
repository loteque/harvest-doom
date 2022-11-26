extends Node

export (NodePath) onready var cursor_path = ".."

onready var cursor = get_node(cursor_path) 



func _ready():
	print("SMOKE TEST: PlayerController/Cursor/Projector")
	print("cursor: " + str(cursor))
