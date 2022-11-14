extends Control


onready var radial_menu = get_node("RadialMenu")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# visible = true
	pass

func _input(event):
	var menu_should_open = InputMap.event_is_action(event, "ui_open_radial_menu") and event.is_pressed() and !radial_menu.visible
	var menu_should_close = InputMap.event_is_action(event, "ui_close_radial_menu") and event.is_pressed() and radial_menu.visible
	
	if menu_should_open:
		radial_menu.open()
	elif menu_should_close:
		radial_menu.close()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
