extends Node
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_button_down() -> void:
	print("hi")
	var lines = []
	var lineArray = {}
	for child in get_children():
		if child is Sprite2D:
			print(child.position.y)
			
			for otherchild in child.get_children():
				if otherchild is Button:
					lineArray[child.position.y] = otherchild.text
	var things = lineArray.keys()
	things.sort()
	print(things)
	for thing in things:
		lines.append(lineArray[thing])
	var data_to_send = {"lines": lines}
	var json = JSON.stringify(data_to_send)
	print(json)
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request("http://127.0.0.1:5000/", headers, HTTPClient.METHOD_POST, json)
