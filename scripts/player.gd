extends Node2D

signal move
signal stop

@onready var sprite: PlayerSprite = $PlayerSprite

@export var move_speed := 1
@export var anim_threshold := 0.5
@export var follow_speed := 100

var velocity := Vector2.ZERO


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


func move_player(delta: float):
	var target := get_move_axes() * move_speed
	var t := delta * follow_speed
	velocity = velocity.lerp(target, t)
	position += velocity


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _process(_delta: float) -> void:
	if velocity.length() > anim_threshold:
		move.emit()
	else:
		stop.emit()


func _physics_process(delta: float) -> void:
	move_player(delta)
