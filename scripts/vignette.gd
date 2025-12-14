@tool
extends ColorRect

@export var inner_target: float = 0.0
@export var outer_target: float = 1.0

@export var outer_radius: float:
	set(value):
		outer_radius = value
		material.set("shader_parameter/outer_radius", value)

@export var inner_radius: float:
	set(value):
		inner_radius = value
		material.set("shader_parameter/inner_radius", value)


func lerp_vignette(weight: float):
	inner_radius = lerp(inner_radius, inner_target, weight)
	outer_radius = lerp(outer_radius, outer_target, weight)


func _ready() -> void:
	inner_radius = 0.0
	outer_radius = 1.0


func _process(delta: float) -> void:
	lerp_vignette(delta)
