extends CharacterBody2D

@onready var character: Node2D = $Character


@export var speed = 300.0
@export var speed_handicap = 0.1

var direction: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	direction.y = Input.get_axis("move_up","move_down")
	direction.x = Input.get_axis("move_left","move_right")
	direction = direction.normalized()
	
	velocity = direction * speed
	
	if direction.length() > 0:  # Nur drehen, wenn der Charakter sich bewegt
		var r = atan2(direction.y, direction.x) + PI / 2
		character.rotation = r
		
	move_and_slide()
