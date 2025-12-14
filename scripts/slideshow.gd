@tool
extends CanvasLayer

@export var index: int:
	set(value):
		value = max(0, value)
		index = value % get_child_count()


func _process(_delta: float) -> void:
	var children = get_children()
	var count = get_child_count()
	for i in range(0, count):
		var child = children[i]
		if i == index:
			child.visible = true
		else:
			child.visible = false
