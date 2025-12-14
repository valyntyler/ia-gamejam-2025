@tool
extends ColorRect

@export var lerp_target: float

@export var outer_radius: float:
	set(value):
		inner_radius = value
		material.set("shader_parameter/outer_radius", value)

@export var inner_radius: float:
	set(value):
		inner_radius = value
		material.set("shader_parameter/inner_radius", value)


func lerp_vignette(weight: float):
	inner_radius = lerp(inner_radius, lerp_target, weight)


func delay(seconds: float):
	await get_tree().create_timer(seconds).timeout


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	lerp_vignette(delta)
