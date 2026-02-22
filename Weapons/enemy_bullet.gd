extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var speed = 300
var direction = 1

func _process(delta: float) -> void:
	position.x += speed * direction * delta
