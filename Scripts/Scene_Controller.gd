extends Button

@export var PauseScreen: Node2D

func _on_pressed() -> void:
	get_tree().reload_current_scene()
	Engine.time_scale = 1

func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Level_1.tscn")

func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Level_2.tscn")

func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Level_3.tscn")

func MenuButton_on_pressed() -> void:
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://Menu.tscn")

func pause_on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		PauseScreen.visible = true
		Engine.time_scale = 0
		get_tree().paused = true
	else:
		PauseScreen.visible = false
		Engine.time_scale = 1
		get_tree().paused = false
