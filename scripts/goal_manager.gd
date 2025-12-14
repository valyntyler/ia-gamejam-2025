extends Node2D

@onready var vignette: ColorRect = %Vignette

var perc: float = 1.0:
	set(value):
		vignette.material.set("shader_parameter/outer_radius", value)


func _ready() -> void:
	perc = 0.1


func _process(_delta: float) -> void:
	perc = abs(sin(Time.get_ticks_msec() / 1000.0))
