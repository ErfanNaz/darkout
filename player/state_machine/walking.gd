class_name PlayerWalking extends State

@onready var player: Player = $"../../.."
@onready var character: Node2D = $"../../../Character"
@onready var character_animation_player: AnimationPlayer = $"../../../Character/CharacterAnimationPlayer"
@onready var collision_shape_2d: CollisionShape2D = $"../../../CollisionShape2D"

@export var speed: float = 300.0

signal standing()

var direction: Vector2 = Vector2.ZERO
var controller_input: ControllerInput

func _ready() -> void:
	set_physics_process(false)

func on_enter() -> void:
	character_animation_player.play("walking")
	controller_input = player.controller_manager.controller_input
	player.controller_manager.controller_input_changed.connect(_input_changed)
	set_physics_process(true)
	
func on_exit() -> void:
	player.controller_manager.controller_input_changed.disconnect(_input_changed)
	set_physics_process(false)
	
func _input_changed(new_controller_input: ControllerInput) -> void:
	controller_input = new_controller_input

func _physics_process(delta: float) -> void:
	direction = controller_input.direction.normalized()
	
	var velocity: Vector2 = player.velocity
	
	if direction == Vector2.ZERO && velocity == Vector2.ZERO:
		standing.emit()
		return
		
	if velocity != Vector2.ZERO:
		var character_rotation: float = atan2(velocity.y, velocity.x)
		character.rotation = character_rotation + PI / 2
		collision_shape_2d.rotation = character_rotation
		player.character_rotated.emit(character.rotation)
	
	player.velocity = direction * speed
	player.move_and_slide()
