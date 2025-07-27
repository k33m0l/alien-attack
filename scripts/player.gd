extends CharacterBody2D

signal took_damage

var speed = 300
var rocket_scene: PackedScene = preload("res://scenes/rocket.tscn")
@onready var rocket_container: Node = $RocketContainer

func _process(_delta: float) -> void:
	shoot_rocket()


func _physics_process(_delta: float) -> void:
	move_player()
	limit_to_arena()


func limit_to_arena() -> void:
	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0, 0), screen_size)


func move_player() -> void:
	velocity = Vector2(0, 0)
	if Input.is_action_pressed('move_up'):
		velocity.y = -speed
	if Input.is_action_pressed('move_down'):
		velocity.y = speed
	if Input.is_action_pressed('move_right'):
		velocity.x = speed
	if Input.is_action_pressed('move_left'):
		velocity.x = -speed
	move_and_slide()


func shoot_rocket() -> void:
	if Input.is_action_just_pressed('shoot'):
		var rocket_instance: Area2D = rocket_scene.instantiate()
		rocket_container.add_child(rocket_instance)
		rocket_instance.global_position = global_position
		rocket_instance.global_position.x += 65

func damage() -> void:
	emit_signal('took_damage')
	
func die() -> void:
	queue_free()
