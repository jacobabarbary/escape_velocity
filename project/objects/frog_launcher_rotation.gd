extends Node2D

signal launch_rotation_changed
@onready var slider = $slider
@onready var sprite_2d = $slider/Sprite2D

var is_dragging = false
var draggable_area = 128/2
var zoom_scaler

func enable():
	show()

func _physics_process(delta):
	_process_setting_rotation()
	zoom_scaler = Vector2.ONE / get_viewport().get_camera_2d().zoom
	sprite_2d.scale = zoom_scaler
	draggable_area = draggable_area / zoom_scaler.x

func _process_setting_rotation():
	if Input.is_action_just_pressed("left_click") and (sprite_2d.get_rect()).has_point(get_global_mouse_position() - sprite_2d.global_position):
		is_dragging = true
	if Input.is_action_just_released("left_click"):
		is_dragging = false
		emit_signal("launch_rotation_changed",global_position.direction_to(slider.global_position))
	if is_dragging:
		look_at(get_global_mouse_position())

func disable():
	hide()
