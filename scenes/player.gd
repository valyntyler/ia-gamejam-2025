extends Node2D

@onready var player_sprite: AnimatedSprite2D = $PlayerSprite

func _ready() -> void:
	player_sprite.play("idle")


func _process(delta: float) -> void:
	print(player_sprite.animation)
