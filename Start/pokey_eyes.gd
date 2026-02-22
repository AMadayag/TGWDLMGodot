extends Sprite2D

@export var max_offset: float = 10.0
@export var follow_speed: float = 10.0

var home_position: Vector2

func _ready() -> void:
	home_position = global_position

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	var direction = mouse_pos - home_position
	
	var offset = direction.normalized() * min(direction.length(), max_offset)
	var target = home_position + offset
	
	global_position = global_position.lerp(target, follow_speed * delta)
