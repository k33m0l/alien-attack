extends Node2D

@export var health = 3

@onready var player: CharacterBody2D = $Player

func _on_enemy_death_zone_area_entered(area: Area2D) -> void:
	area.die()


func _on_player_took_damage() -> void:
	health -= 1
	if health <= 0:
		player.die()
