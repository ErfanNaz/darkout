class_name Player extends CharacterBody2D

@onready var character: Node2D = %Character
@onready var camera_2d: Camera2D = $Camera2D
@onready var point_light_2d: PlayerPointLight = $PointLight2D
@onready var green_character: Sprite2D = $Character/GreenCharacter

@export var is_enemy: bool = false
@export var controller_manager: ControllerManager

const ENEMY_MATERIAL = preload("res://player/enemy_material.tres")

signal character_rotated(rotation: float)

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())
	
func _ready() -> void:
	if is_multiplayer_authority():
		camera_2d.make_current()
		controller_manager.enable = true
		point_light_2d.visible = true
	else:
		controller_manager.enable = false
		point_light_2d.visible = false

# should be replaced with real other sprites maybe or even diffrent scene
@rpc("any_peer")
func change_to_enemy() -> void:
	is_enemy = true
	print("change_to_enemy name: %s" % [name])
	for child in character.get_children():
		if child is Sprite2D:
			child.modulate = Color("ff0000")
