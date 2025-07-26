extends CharacterBody2D

var speed = 300
var left_border = 0
var upper_border = 0

func _physics_process(_delta: float) -> void:
	move_player()
	limit_to_arena()


func limit_to_arena() -> void:
	var right_border = get_viewport_rect().size.x
	var lower_border = get_viewport_rect().size.y
	if global_position.x < left_border:
		global_position.x = left_border
	elif global_position.x > right_border:
		global_position.x = right_border
	
	if global_position.y < upper_border:
		global_position.y = upper_border
	elif global_position.y > lower_border:
		global_position.y = lower_border


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
