extends Control

func open():
	self.visible = true

func close():
	self.visible = false

# send attractor button signal to the global Signals bus
func _on_Button_pressed():
	Signals.emit_signal("attractor_button_pressed")
