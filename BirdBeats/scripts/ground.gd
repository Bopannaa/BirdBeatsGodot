extends Area2D

signal grounded

func _on_body_entered(_body):
	emit_signal("grounded")
	pass
