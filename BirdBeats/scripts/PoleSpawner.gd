extends Node2D

@onready var pole_prefab = preload("res://scenes/pole.tscn")

signal spawning_pole_stopped
signal scored

func _on_timer_timeout():
	var pole = pole_prefab.instantiate()
	add_child(pole)
	pole.position.y += randi_range(-100, 100)
	pole.connect("bird_collision", stop_spawning)
	pole.connect("score_collision", call_scored)
	pass

func stop_spawning():
	emit_signal("spawning_pole_stopped")

func call_scored():
	emit_signal("scored")

func _on_main_start_game():
	$Timer.start()
	pass

func _on_main_end_game():
	get_tree().call_group("poles", "set_process", false)
	$Timer.stop()
	pass
