class_name Player extends CharacterBody2D

@onready var character: Node2D = %Character

@export var is_enemy: bool = false
@export var controller_manager: ControllerManager

const ENEMY_MATERIAL = preload("res://player/enemy_material.tres")

signal character_rotated(rotation: float)

func _ready() -> void:
	if is_enemy:
		_updates_for_enemy()

# should be replaced with real other sprites maybe or even diffrent scene
func _updates_for_enemy() -> void:
	for child in character.get_children():
		if child is Sprite2D:
			child.material = ENEMY_MATERIAL
			child.modulate = Color("ff0000")
