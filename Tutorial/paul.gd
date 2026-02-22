extends CharacterBody2D

@onready var bullet = preload("res://Weapons/enemy-bullet.tscn")

func _on_paul_bullet_timer_timeout() -> void:
	var bulletinstance = bullet.instantiate()
	add_child(bulletinstance)
	bulletinstance.position = $PaulSprite.position

func remove_bullet(bulletinstance):
	remove_child(bulletinstance)
