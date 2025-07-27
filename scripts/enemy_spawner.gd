extends Node2D

@onready var enemy_scene: PackedScene = preload("res://scenes/enemy.tscn")
@onready var enemy_container: Node = $EnemyContainer
@onready var spawn_positions: Node2D = $SpawnPos

func _on_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy() -> void:
	var spawn_pos_random: Marker2D = spawn_positions.get_children().pick_random()
	
	var enemy_instance: Area2D = enemy_scene.instantiate()
	enemy_instance.global_position = spawn_pos_random.global_position
	enemy_container.add_child(enemy_instance)
