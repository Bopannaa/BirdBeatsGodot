extends Node2D

@export var speed:float = 100

func _ready():
	set_process(true)

func _process(delta):
	$ParallaxBackground.scroll_offset.x -= speed * delta
	$ParallaxBackground2.scroll_offset.x -= 70 * delta
	pass

func _on_main_new_game():
	set_process(false)
	$ParallaxBackground.scroll_offset.x = 100
	$ParallaxBackground2.scroll_offset.x = 100
	pass

func _on_main_end_game():
	set_process(false)
	pass


func _on_main_start_game():
	set_process(true)
	pass


func _on_play_button_pressed():
	set_process(false)
	$ParallaxBackground.scroll_offset.x = 100
	$ParallaxBackground2.scroll_offset.x = 100
	pass
