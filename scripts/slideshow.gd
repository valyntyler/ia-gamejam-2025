@tool
class_name Slideshow
extends Node

@export var lock := true
@export var index: int:
	set(value):
		var count = get_child_count()
		if count == 0:
			return
		index = (value + count) % count


func lock_slides():
	if !lock:
		return

	var children = get_children()
	var count = get_child_count()
	for i in range(0, count):
		var child = children[i]
		if child is Control:
			if i == index:
				child.visible = true
			else:
				child.visible = false


func _process(_delta: float) -> void:
	lock_slides()


func _unhandled_key_input(event):
	if event.is_pressed():
		index += 1
