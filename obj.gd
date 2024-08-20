extends Sprite2D
var dragging = false
var of = Vector2(0, 0)
var snap = 0

var cnct = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (dragging):
		var newpos = get_global_mouse_position() - of
		position = Vector2(snapped(newpos.x, snap), snapped(newpos.y, snap))
	else:
		if cnct != null:
			position = cnct
			cnct = null

func _on_button_button_down() -> void:
	dragging = true
	of = get_global_mouse_position() - global_position


func _on_button_button_up() -> void:
	dragging = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	if dragging:
		print("hello")
		cnct = area.get_parent().get_parent().position 
		cnct = cnct - Vector2(327, 100)
		print(position)
