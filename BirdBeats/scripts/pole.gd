extends Node2D

var speed: float = 70

signal bird_collision
signal score_collision

func _ready():
	pass

func _process(delta):
	position.x -= speed * delta
	pass

func _on_middle_body_entered(_body):
	emit_signal("score_collision")
	pass

func _on_top_body_entered(_body):
	emit_signal("bird_collision")
	pass

func _on_bottom_body_entered(_body):
	emit_signal("bird_collision")
	pass
