extends CharacterBody2D

var speed = 300

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
