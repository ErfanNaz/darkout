class_name StateMachine extends Node

@export var current_state: State

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if current_state:
		current_state.on_enter()

func set_state(state: State) -> void:
	if current_state == state:
		return
	if current_state != null:
		current_state.on_exit()
	state.on_enter()
	current_state = state


# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_state() -> State:
	return current_state
