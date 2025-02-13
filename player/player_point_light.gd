class_name PlayerPointLight extends PointLight2D

@export var player: Player:
	set(value):
		player = value
		connect_player(player)

func connect_player(player: Player) -> void:
	if !player:
		return
	player.character_rotated.connect(_character_rotated)

func _character_rotated(character_rotation: float) -> void:
	self.rotation = character_rotation
