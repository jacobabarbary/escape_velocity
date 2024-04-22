extends Node2D

signal launch_power_changed

@onready var h_slider = $HSlider

var launch_power = 0.0

func enable():
	show()

func disable():
	hide()

func _on_h_slider_drag_ended(value_changed):
	launch_power = h_slider.value 
	emit_signal("launch_power_changed",launch_power)
