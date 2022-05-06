extends Node2D

onready var player = $Player
onready var navigation2d = $Navigation2D
onready var signalManager = SignalManager

func _on_Timer_timeout():
	SignalManager.emit_find_player_signal(player.global_position)

