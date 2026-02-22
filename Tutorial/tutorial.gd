extends Node2D

func _ready() -> void:
	$Emma/EmmaSprite.play("left")
	$Paul/PaulSprite.play("right")
	$InfectionBar.value = 0

func _on_infection_decrease_timer_timeout() -> void:
	$InfectionBar.value -= 1

func increase_infection(bulletinstance):
	$InfectionBar.value += 40
	$Paul.remove_bullet(bulletinstance)
