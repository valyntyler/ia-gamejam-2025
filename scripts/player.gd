extends AnimatedSprite2D

@export var move_speed := 1


func get_move_axes() -> Vector2:
	var move_axes := Vector2.ZERO

	if Input.is_action_pressed("move_up"):
		move_axes.y -= 1
	if Input.is_action_pressed("move_down"):
		move_axes.y += 1
	if Input.is_action_pressed("move_left"):
		move_axes.x -= 1
	if Input.is_action_pressed("move_right"):
		move_axes.x += 1

	return move_axes.normalized()


func animate_move(move: Vector2):
	if abs(move.x) >= 0.01:
		play("walk_h")
	elif abs(move.y) >= 0.01:
		play("walk_v")
	else:
		play("idle")


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	var move := get_move_axes() * move_speed
	position += move
	animate_move(move)
