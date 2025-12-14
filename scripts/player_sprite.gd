extends Node2D
class_name PlayerSprite

@export var front: AnimatedSprite2D
@export var back: AnimatedSprite2D
@export var left: AnimatedSprite2D
@export var right: AnimatedSprite2D

var current: AnimatedSprite2D:
	set(value):
		hide_all()
		current = value
		current.visible = true


func hide_all():
	front.visible = false
	back.visible = false
	left.visible = false
	right.visible = false


func _on_player_move() -> void:
	print("ho")
	if Input.is_action_pressed("move_left"):
		current = left
	elif Input.is_action_pressed("move_right"):
		current = right
	elif Input.is_action_pressed("move_up"):
		current = back
	elif Input.is_action_pressed("move_down"):
		current = front
	current.play("walk")


func _on_player_stop() -> void:
	print("hi")
	if Input.is_action_pressed("move_left"):
		current = left
	elif Input.is_action_pressed("move_right"):
		current = right
	elif Input.is_action_pressed("move_up"):
		current = back
	elif Input.is_action_pressed("move_down"):
		current = front
	if current != null:
		current.play("stand")
