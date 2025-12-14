extends CanvasLayer

@onready var vignette: ColorRect = $PostProcessing/Vignette
@onready var slideshow: Slideshow = $Slideshow


func delay(seconds: float):
	await get_tree().create_timer(seconds).timeout


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	vignette.inner_radius = 0.0
	# vignette.lerp_target = 5.0

	# await get_tree().create_timer(2.0).timeout
	# vignette.lerp_target = 0.0
	# await get_tree().create_timer(4.0).timeout
	# slideshow.index += 1
	# vignette.lerp_target = 5.0
	# await get_tree().create_timer(2.0).timeout
	# vignette.lerp_target = 0.0
	# await get_tree().create_timer(4.0).timeout
	# slideshow.index += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
