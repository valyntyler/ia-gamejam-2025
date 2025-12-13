extends Node2D

@onready var player_sprite: AnimatedSprite2D = $PlayerSprite

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


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	position += get_move_axes() * move_speed
