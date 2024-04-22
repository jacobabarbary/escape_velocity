extends RigidBody2D

var gravity = 9.8
var planets = []

func _ready():
	planets = get_tree().get_nodes_in_group("planets")
	$AnimatedSprite2D.play("wobble")

func _physics_process(delta):
	linear_velocity += get_gravitational_force()

func get_gravitational_force():
	var delta_v = Vector2()
	for planet in planets:
		delta_v += (global_position.direction_to(planet.global_position)) * (gravity * planet.mass * mass) / global_position.distance_to(planet.global_position) ** 2
	return delta_v
