extends Node2D

var _game_started: bool = false

signal start_game

enum WHO_SCORED {Player, Enemy}

func _on_PlayerGoal_body_entered(body: Node) -> void:
	score_goal(WHO_SCORED.Enemy)

func _on_EnemyGoal_body_entered(body: Node) -> void:
	score_goal(WHO_SCORED.Player)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("serve") and not _game_started:
		emit_signal("start_game")

func score_goal(who_scored: int) -> void:
	_game_started = false
	$Player.set_physics_process(false)
	$Enemy.set_physics_process(false)
	$Ball.set_physics_process(false)
	
	$Player.position = Vector2(124, 274)
	$Enemy.position = Vector2(893, 274)
	$Ball.position = Vector2(510, 290)
	
	if who_scored == WHO_SCORED.Player:
		$Player.score += 1
	else:
		$Enemy.score += 1
