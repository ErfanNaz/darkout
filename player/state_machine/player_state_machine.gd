class_name PlayerStateMachine extends Node

@onready var state_machine: StateMachine = $StateMachine
@onready var player: Player = $".."

@onready var idle: PlayerIdle = $StateMachine/Idle
@onready var walking: PlayerWalking = $StateMachine/Walking

func _on_walking_standing() -> void:
	state_machine.set_state(idle)


func _on_idle_want_walk() -> void:
	state_machine.set_state(walking)
