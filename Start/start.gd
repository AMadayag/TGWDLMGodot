extends Node2D

var pokey_float_distance = 5.0
var pokey_float_duration = 2.0

func _on_start_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Cutscene1/Cutscene1.tscn")

func _ready():
	$Pokey/Goo.play()
	
	# pokey bobbing
	var tween = create_tween().set_loops(INF).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_SINE)
	tween.tween_property($Pokey, "position:y", $Pokey.position.y - pokey_float_distance, pokey_float_duration)
	tween.tween_property($Pokey, "position:y", $Pokey.position.y + pokey_float_distance, pokey_float_duration)
