extends Node2D

@onready var vignette: ColorRect = %Vignette

var target: float
var perc: float:
	set(value):
		perc = value
		vignette.material.set("shader_parameter/outer_radius", value)


func lerp_vignette(weight: float):
	perc = lerp(perc, target, weight)
	print(perc)


func _ready() -> void:
	perc = 0.0


func _process(delta: float) -> void:
	lerp_vignette(delta)
	if (
		Input.is_action_pressed("move_left")
		|| Input.is_action_pressed("move_right")
		|| Input.is_action_pressed("move_up")
		|| Input.is_action_pressed("move_down")
	):
		target = 1
