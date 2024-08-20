extends TextureRect

@export_enum("if", "empty") var type = 1

func _get_drag_data(at_position: Vector2) -> Variant:
	var data = [self, type]
	var prev = TextureRect.new()
	prev.texture = texture
	set_drag_preview(prev)
	return data
