extends Node2D

@onready var vignette: Vignette = %Vignette

var touched := false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	vignette.outer_radius = 0.0
	vignette.outer_target = 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if !touched:
		if (
			Input.is_action_just_pressed("move_up")
			|| Input.is_action_just_pressed("move_down")
			|| Input.is_action_just_pressed("move_left")
			|| Input.is_action_just_pressed("move_right")
		):
			vignette.outer_target = 1.0
			touched = true
