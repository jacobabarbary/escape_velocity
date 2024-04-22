extends Node2D

var frog = preload("res://project/objects/player_character.tscn")

@onready var frog_launcher_rotation = $frog_launcher_rotation
@onready var frog_launcher_power = $frog_launcher_power
@onready var launch_button = $CanvasLayer/launch_button
@onready var launch_menu = $CanvasLayer/launch_menu
@onready var animation_player = $AnimationPlayer

var launch_direction : Vector2
var launch_power = 0
var launch_timing

var state = 0

@onready var states = [frog_launcher_rotation,frog_launcher_power,launch_button]


func next_state():
	states[state].disable()
	state += 1
	states[state].enable()

func _on_launch_button_pressed():
	animation_player.play("launch")


func launch_frog():
	var new_frog = frog.instantiate()
	new_frog.linear_velocity = launch_direction * launch_power
	new_frog.rotate(Vector2.ZERO.angle_to_point(launch_direction) + PI/2)
	add_child(new_frog)


func _on_frog_launcher_rotation_launch_rotation_changed(new_launch_direction):
	launch_direction = new_launch_direction

func _on_frog_launcher_power_launch_power_changed(new_launch_power):
	launch_power = new_launch_power
