extends KinematicBody2D

export var speed: Vector2 = Vector2(0.0, 300.0)

var _velocity: Vector2 = Vector2.ZERO
var score: int = 0

func _ready() -> void:
	set_physics_process(false)

func _on_Level_start_game() -> void:
	set_physics_process(true)

func _physics_process(delta: float) -> void:
	var direction: float = Input.get_action_strength("down") - Input.get_action_strength("up")
	_velocity = Vector2(0.0, direction * speed.y)
	_velocity = move_and_slide(_velocity)
