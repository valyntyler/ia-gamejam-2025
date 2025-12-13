extends AnimatedSprite2D

@export var move_speed := 1
@export var threshold := 0.1
@export var follow_speed := 100

var move := Vector2.ZERO


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


func animate_move():
	if abs(move.x) >= threshold:
		play("walk_h")
		if move.x > 0:
			flip_h = true
		else:
			flip_h = false
	elif abs(move.y) >= threshold:
		play("walk_v")
	else:
		play("idle")


func move_player(delta: float):
	var target := get_move_axes() * move_speed
	var t = delta * follow_speed
	move = move.lerp(target, t)
	position += move


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	animate_move()


func _physics_process(delta: float) -> void:
	move_player(delta)
