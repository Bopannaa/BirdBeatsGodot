extends Node

@onready var player_prefab = preload("res://scenes/player.tscn")


var score = 0

signal new_game
signal end_game
signal start_game

func _ready():
	pass

func start_game_main():
	get_tree().call_group("poles", "queue_free")
	get_tree().call_group("players", "queue_free")
	var player = player_prefab.instantiate()
	add_child(player)
	player.connect("start_player", play_game)
	score = 0
	$Control/ScoreLabel.text = str(score)
	$Control/ScoreLabel.show()
	$Control/GameTitle.hide()
	$Control/PlayButton.hide()
	$Control/RankButton.hide()
	pass

func play_game():
	emit_signal("start_game")
	pass

func _on_pole_spawner_spawning_pole_stopped():
	emit_signal("end_game")
	get_tree().call_group("players", "set_physics_process", false)
	$Control/PlayButton.show()
	$Control/RankButton.show()
	$Control/ScoreLabel.hide()
	pass

func _on_ground_grounded():
	emit_signal("end_game")
	get_tree().call_group("players", "set_physics_process", false)
	$Control/PlayButton.show()
	$Control/ScoreLabel.hide()
	pass


func _on_pole_spawner_scored():
	score = score + 1
	$Control/ScoreLabel.text = str(score)
	pass # Replace with function body.


func _on_play_button_pressed():
	start_game_main()
	pass
