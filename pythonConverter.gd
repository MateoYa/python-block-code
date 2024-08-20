extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("wtf is this")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_button_down() -> void:
	print("hello")
	var f1 = FileAccess.open("res://someFile.py", FileAccess.WRITE)
	f1.store_string("input()")
	var f = FileAccess.open("user://run.bat", FileAccess.WRITE)
	f.store_string("python3 " +f1.get_path_absolute()+"\npause\nexit")
	var pyout = []
	print([f1.get_path_absolute()])
	OS.execute("C:\\Program Files\\WindowsApps\\PythonSoftwareFoundation.Python.3.10_3.10.3056.0_x64__qbz5n2kfra8p0\\python3.10.exe", [f1.get_path_absolute()], pyout, true, true)
	print(pyout)
