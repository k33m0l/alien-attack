extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var hud: Control = $UI/HUD
@onready var game_over_scene: PackedScene = preload("res://scenes/game_over_screen.tscn")
@onready var enemy_hit_sound: AudioStreamPlayer2D = $EnemyHitSound
@onready var player_hit_sound: AudioStreamPlayer2D = $PlayerHitSound
var health = 3
var score = 0

func _ready() -> void:
	hud.set_score(score)
	hud.set_health(health)

func _on_enemy_death_zone_area_entered(area: Area2D) -> void:
	area.queue_free()

func _on_player_took_damage() -> void:
	health -= 1
	hud.set_health(health)
	player_hit_sound.play()
	if health <= 0:
		player.die()
		
		await get_tree().create_timer(1.5).timeout
		
		var game_over_instance = game_over_scene.instantiate()
		game_over_instance.set_final_score(score)
		$UI.add_child(game_over_instance)

func _on_enemy_spawner_enemy_spawned(enemy_instance: Area2D) -> void:
	enemy_instance.connect('died', _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died() -> void:
	score += 100
	hud.set_score(score)
	enemy_hit_sound.play()
