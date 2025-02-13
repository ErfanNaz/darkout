class_name Level_1 extends Node2D

const PLAYER: Resource = preload("res://player/player.tscn")
@onready var multiplayer_spawner: MultiplayerSpawner = $MultiplayerSpawner

@export var host_ip: String = "localhost"

var multiplayer_peer: ENetMultiplayerPeer = ENetMultiplayerPeer.new()

func _on_menu_host(port: int) -> void:
	multiplayer_peer.create_server(port)
	multiplayer.multiplayer_peer = multiplayer_peer
	multiplayer_peer.peer_connected.connect(add_player)
	add_host_player()

func _on_menu_join(port: int) -> void:
	multiplayer_peer.create_client(host_ip, port)
	multiplayer.multiplayer_peer = multiplayer_peer

func add_player(id: int = 1) -> void:
	var player: Player = PLAYER.instantiate()
	player.name = str(id)
	add_child(player)
	player.change_to_enemy()
	player.rpc_id(id, "change_to_enemy")
	
func add_host_player() -> void:
	var player: Player = PLAYER.instantiate()
	player.name = "1"
	add_child(player)
	
