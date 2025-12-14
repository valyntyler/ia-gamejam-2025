extends Node2D

@onready var vignette: Vignette = %Vignette

@export var player: Node2D
@export var goal: Node2D

var max_distance: float
var darkness := 0.0

var distance: float:
	get():
		return player.position.distance_to(goal.position)


func _ready() -> void:
	max_distance = distance


func _process(_delta: float) -> void:
	var normalized_distance = distance / max_distance
	vignette.outer_radius = 1.5 - normalized_distance - darkness
	darkness += (Time.get_ticks_msec() / 1000.0) / 100_000
