extends Area2D

signal level_complete



func set_collider_size():
	pass



func _on_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("level_complete")
		print("level_complete")
