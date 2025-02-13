class_name Menu extends CanvasLayer

@onready var port_input: LineEdit = %PortInput

signal host(port: int)
signal join(port: int)

var menu_is_open: bool = true

func _ready() -> void:
	InputHandler.on_toggle_menu.connect(toggle_menu)

func toggle_menu(open: bool) -> void:
	menu_is_open = open
	visible = open

func _on_host_button_pressed() -> void:
	var port = int(port_input.text)
	host.emit(port)
	InputHandler.close_menu()

func _on_join_button_pressed() -> void:
	var port = int(port_input.text)
	join.emit(port)
	InputHandler.close_menu()
