extends Node2D

@onready var vignette: ColorRect = %Vignette

@export var goal: Node2D
@export var max_distance: float


func fade_in():
	if (
		Input.is_action_pressed("move_left")
		|| Input.is_action_pressed("move_right")
		|| Input.is_action_pressed("move_up")
		|| Input.is_action_pressed("move_down")
	):
		pass
		# lerp_target = 1


func _ready() -> void:
	# lerp_perc = 0.0
	max_distance = position.distance_to(goal.position)


func _process(delta: float) -> void:
	# lerp_target = position.distance_to(goal.position) / max_distance
	pass


func _unhandled_key_input(event):
	if event.is_pressed():
		pass
