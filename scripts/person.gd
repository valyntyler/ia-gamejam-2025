extends Node2D

@onready var player: Node2D = %Player


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass
	if player.position.y > position.y:
		z_index = -999
	else:
		z_index = 999
