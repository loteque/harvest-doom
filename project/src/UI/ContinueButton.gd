extends RichTextLabel

func select():
	unpause()

func unpause():
	Signals.emit_signal("pause", false)
