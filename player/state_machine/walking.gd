class_name PlayerWalking extends State

@onready var player: Player = $"../../.."
@onready var character: Node2D = $"../../../Character"
@onready var character_animation_player: AnimationPlayer = $"../../../Character/CharacterAnimationPlayer"
@onready var collision_shape_2d: CollisionShape2D = $"../../../CollisionShape2D"

@export var speed: float = 300.0

signal standing()

var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	set_physics_process(false)

func on_enter() -> void:
	character_animation_player.play("walking")
	set_physics_process(true)
	
func on_exit() -> void:
	set_physics_process(false)

func _physics_process(delta: float) -> void:
	direction.y = Input.get_axis("move_up","move_down")
	direction.x = Input.get_axis("move_left","move_right")
	direction = direction.normalized()
	
	var velocity: Vector2 = player.velocity
	
	if direction == Vector2.ZERO && velocity == Vector2.ZERO:
		standing.emit()
		return
		
	if velocity != Vector2.ZERO:
		var character_rotation = atan2(velocity.y, velocity.x)
		character.rotation = character_rotation + PI / 2
		collision_shape_2d.rotation = character_rotation
	
	player.velocity = direction * speed
	player.move_and_slide()
