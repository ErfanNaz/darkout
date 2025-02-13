extends Node

signal on_toggle_menu(open: bool)

var is_menu_open: bool = false

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("open_menu"):
		toggle_menu()

func toggle_menu() -> void:
	if is_menu_open:
		close_menu()
	else:
		open_menu()

func open_menu() -> void:
	is_menu_open = true
	on_toggle_menu.emit(is_menu_open)

func close_menu() -> void:
	is_menu_open = false
	on_toggle_menu.emit(is_menu_open)
