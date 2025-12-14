extends CanvasLayer

const WORLD = preload("uid://c5sr50exfcxxh")

@onready var vignette: ColorRect = $PostProcessing/Vignette
@onready var slideshow: Slideshow = $Slideshow


func intro():
	match slideshow.index:
		0:
			vignette.outer_radius = 0.0
			vignette.outer_target = 5.0
			await get_tree().create_timer(2).timeout
			vignette.outer_target = 0.0
			vignette.inner_target = -10.0
			await get_tree().create_timer(4).timeout
		1:
			vignette.outer_target = 5
			vignette.inner_target = 0.0
			await get_tree().create_timer(4).timeout
			vignette.outer_target = 0.0
			vignette.inner_target = -10.0
			await get_tree().create_timer(4).timeout
		2:
			vignette.outer_target = 5
			vignette.inner_target = 0.0
			await get_tree().create_timer(6).timeout
			vignette.outer_target = 0.0
			vignette.inner_target = -10.0


func _ready() -> void:
	await intro()
	slideshow.index += 1
	await intro()
	slideshow.index += 1
	await intro()


func _process(_delta: float) -> void:
	var index = slideshow.index
	var count = slideshow.get_child_count()
	if Input.is_action_just_pressed("skip") && index != count - 1:
		slideshow.index += 1
