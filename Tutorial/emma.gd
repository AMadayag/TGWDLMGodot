extends CharacterBody2D

@export var speed = 200

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
	# check for collisions
	for index in get_slide_collision_count():
		var collision = get_slide_collision(index)
		if (collision.get_collider().is_in_group("Damager")):
			get_parent().increase_infection(collision.get_collider())
	
	# animation played on press
	if velocity == Vector2.ZERO:
		$EmmaSprite.stop()
		return
	if Input.is_action_pressed("left"):
		$EmmaSprite.play("left")
	elif Input.is_action_pressed("right"):
		$EmmaSprite.play("right")
