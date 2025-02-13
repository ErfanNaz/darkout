class_name PlayerMultiplayerSynchronizer extends MultiplayerSynchronizer

@export var position: Vector2:
	set(value):
		if is_multiplayer_authority():
			position = value
		else:
			get_parent().position = value
