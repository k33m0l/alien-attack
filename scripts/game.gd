extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var hud: Control = $UI/HUD
var health = 3
var score = 0

func _ready() -> void:
	hud.set_score(score)
	hud.set_health(health)

func _on_enemy_death_zone_area_entered(area: Area2D) -> void:
	area.die()


func _on_player_took_damage() -> void:
	health -= 1
	hud.set_health(health)
	if health <= 0:
		player.die()


func _on_enemy_spawner_enemy_spawned(enemy_instance: Area2D) -> void:
	enemy_instance.connect('died', _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died() -> void:
	score += 100
	hud.set_score(score)
