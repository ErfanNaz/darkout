class_name ControllerManager extends Node

@export var enable: bool = true:
	set(value):
		enable = value
		set_physics_process(value)

@export var direction_actions: Array[String] = ["move_left", "move_right", "move_up", "move_down"]

signal controller_input_changed(controller_input: ControllerInput)

var controller_input: ControllerInput = ControllerInput.new()

func _ready() -> void:
	set_physics_process(enable)

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector(direction_actions[0],direction_actions[1],direction_actions[2],direction_actions[3])
	if direction != controller_input.direction:
		controller_input.direction = direction
		controller_input_changed.emit(controller_input)
