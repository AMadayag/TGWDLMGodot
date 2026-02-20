extends Node2D

func _on_ready() -> void:
	$Character.modulate.a = 0.0
	$Bg.modulate.a = 0.0
	$Textbox.modulate.a = 0.0
	await fade_in($Bg, 1)
	$Character.play("Paul")
	await fade_in($Character, 0.5)
	fade_in($Textbox, 0.1)
	$Textbox.play("emma")

func fade_in(sprite, duration):
	sprite.modulate.a = 0.0
	var tween = sprite.create_tween()
	tween.tween_property(sprite, "modulate:a", 1.0, duration)
	await tween.finished

func fade_out(sprite, duration):
	var tween = sprite.create_tween()
	tween.tween_property(sprite, "modulate:a", 0.0, duration)
	await tween.finished	

func fade_out_all() -> void:
	await fade_out($Textbox, 0.1)
	fade_out($Character, 0.5)
	fade_out($Bg, 1)
	get_tree().change_scene_to_file("res://Tutorial/Tutorial.tscn")

func _on_click_pressed() -> void:
	if ($Textbox.animation == "im-sorry"):
		switch_sprites()
	go_to_next_textbox()
		

func switch_sprites() -> void:
	if ($Character.animation == "Paul"):
		$Character.play("Emma")
	else:
		$Character.play("Paul")

func go_to_next_textbox() -> void:
	if ($Textbox.animation == "emma"):
		$Textbox.play("im-sorry")
	elif ($Textbox.animation == "im-sorry"):
		$Textbox.play("w-what")
	else:
		fade_out_all()
