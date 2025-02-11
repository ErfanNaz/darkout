class_name PlayerPointLight extends PointLight2D

@export var player: Player

func _ready() -> void:
	if !player:
		return
	player.character_rotated.connect(_character_rotated)
	
func _character_rotated(character_rotation: float) -> void:
	self.rotation = character_rotation
