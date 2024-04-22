extends CharacterBody2D

const FRICTION = 0.5
@onready var camera_2d = $Camera2D
var zoom_sensitivity = 0.1

var _previousPosition: Vector2 = Vector2(0, 0);
var _moveCamera: bool = false;

func _unhandled_input(event: InputEvent):
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_RIGHT:
		get_viewport().set_input_as_handled();
		if event.is_pressed():
			_previousPosition = event.position;
			_moveCamera = true;
		else:
			_moveCamera = false;
	elif event is InputEventMouseMotion && _moveCamera:
		get_viewport().set_input_as_handled();
		position += (_previousPosition - event.position) / camera_2d.zoom.x;
		_previousPosition = event.position;


func _physics_process(delta):
	var mouse_position = get_global_mouse_position()
	
	
	var delta_mouse_position = mouse_position
#
#	if Input.is_action_pressed("camera_drag"):
#		global_position += -delta_mouse_position 
#
	if Input.is_action_just_pressed("zoom_in"):
		set_zoom(Vector2(zoom_sensitivity,zoom_sensitivity))
	
	if Input.is_action_just_pressed("zoom_out"):
		set_zoom(-Vector2(zoom_sensitivity,zoom_sensitivity))
	

func set_zoom(delta: Vector2) -> void:
	var mouse_pos := get_global_mouse_position()
	$Camera2D.zoom += delta
	var new_mouse_pos := get_global_mouse_position()
	$Camera2D.position += mouse_pos - new_mouse_pos
