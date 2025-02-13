class_name PlayerIdle extends State

@onready var player: Player = $"../../.."
@onready var character_animation_player: AnimationPlayer = $"../../../Character/CharacterAnimationPlayer"

signal want_walk()

func _ready() -> void:
	var controller_manager = player.controller_manager
	if !controller_manager:
		return
	controller_manager.controller_input_changed.connect(_input_changed)

func on_enter() -> void:
	character_animation_player.play("idle")
	
func on_exit() -> void:
	set_process_input(false)

func _input_changed(controller_input: ControllerInput) -> void:
	if controller_input.direction != Vector2.ZERO:
		want_walk.emit()
