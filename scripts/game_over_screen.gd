extends Control

func set_final_score(final_score: int) -> void:
	$Panel/Score.text = "SCORE: " + str(final_score)

func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()
