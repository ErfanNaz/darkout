class_name Menu extends CanvasLayer

@onready var port_input: LineEdit = $Control/MarginContainer/HFlowContainer/HBoxContainer/PortInput

signal host(port: int)
signal join(port: int)


func _on_host_button_pressed() -> void:
	var port = int(port_input.text)
	host.emit(port)


func _on_join_button_pressed() -> void:
	var port = int(port_input.text)
	join.emit(port)
