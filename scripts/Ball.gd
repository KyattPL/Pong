extends KinematicBody2D

export var speed: Vector2 = Vector2(300.0, 300.0)

var _velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	set_physics_process(false)
	
func _on_Level_start_game() -> void:
	set_physics_process(true)
	_velocity = Vector2(-1.0, 0.25) * speed

func _physics_process(delta: float) -> void:
	var collision: KinematicCollision2D = move_and_collide(_velocity * delta)
	if collision:
		_velocity = _velocity.bounce(collision.normal)
