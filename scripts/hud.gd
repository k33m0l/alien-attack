extends Control

@onready var score: Label = $Score
@onready var health: Label = $LifeLeft

func set_score(new_score: int) -> void:
	score.text = "SCORE: " + str(new_score)

func set_health(new_health: int) -> void:
	health.text = str(new_health)
