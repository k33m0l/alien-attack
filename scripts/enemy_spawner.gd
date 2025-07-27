extends Node2D

signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(enemy_instance)

@onready var enemy_scene: PackedScene = preload("res://scenes/enemy.tscn")
@onready var path_enemy_scene: PackedScene = preload("res://scenes/path_enemy.tscn")
@onready var spawn_positions: Node2D = $SpawnPos

func _on_timer_timeout() -> void:
	spawn_enemy()

func _on_path_enemy_timer_timeout() -> void:
	var path_enemy_instace: Path2D = path_enemy_scene.instantiate()
	emit_signal('path_enemy_spawned', path_enemy_instace)

func spawn_enemy() -> void:
	var spawn_pos_random: Marker2D = spawn_positions.get_children().pick_random()
	
	var enemy_instance: Area2D = enemy_scene.instantiate()
	enemy_instance.global_position = spawn_pos_random.global_position
	emit_signal('enemy_spawned', enemy_instance)
