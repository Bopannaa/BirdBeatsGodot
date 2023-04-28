extends RigidBody2D

@onready var bird = $Bird
@onready var animPlayer = $Bird/AnimationPlayer
@export var birds:Array[AtlasTexture] = []

var startGame: bool = false

var rng = RandomNumberGenerator.new()

signal start_player

func _ready():
	var rand_num = rng.randi_range(0,3)
	$Bird.texture = birds[rand_num]
	animPlayer.current_animation = "idle"


func _physics_process(_delta):
	if(Input.is_action_just_pressed("fly")):
		if(!startGame):
			emit_signal("start_player")
			gravity_scale = 1.0
			startGame = true
		if(startGame):
			linear_velocity = Vector2.UP * 300
	if(startGame):
		if(linear_velocity.y > 0):
			var tw = create_tween()
			tw.tween_property($Bird, "rotation", 0.9, 0.5)
			animPlayer.current_animation = "RESET"
		elif(linear_velocity.y < 0):
			var tw = create_tween()
			tw.tween_property($Bird, "rotation", -0.5, 0.25)
			animPlayer.current_animation = "flap"
