extends RichTextLabel

var is_selected = false

func exit():
	get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)

func select():
	exit()
