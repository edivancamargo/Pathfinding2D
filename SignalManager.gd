extends Node

signal find_player

func emit_find_player_signal(player_position: Vector2):
	emit_signal("find_player", player_position)
