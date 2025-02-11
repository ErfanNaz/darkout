class_name PlayerIdle extends State

@onready var player: Player = $"../../.."
@onready var character_animation_player: AnimationPlayer = $"../../../Character/CharacterAnimationPlayer"

signal want_walk()

func _ready() -> void:
	set_process_input(false)

func on_enter() -> void:
	character_animation_player.play("idle")
	if player.is_enemy:
		return
	set_process_input(true)
	
func on_exit() -> void:
	set_process_input(false)

func _input(event: InputEvent) -> void:
	var move_actions: Array[String] = ["move_down", "move_up", "move_left", "move_right"]
	for action in move_actions:
		if event.is_action_pressed(action):
			want_walk.emit()
