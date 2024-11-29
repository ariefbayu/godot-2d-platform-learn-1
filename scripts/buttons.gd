extends Node

func _on_button_left_pressed() -> void:
	Input.action_press("move_left")

func _on_button_left_released() -> void:
	Input.action_release("move_left")


func _on_button_right_pressed() -> void:
	Input.action_press("move_right")


func _on_button_right_released() -> void:
	Input.action_release("move_right")


func _on_button_jump_pressed() -> void:
	Input.action_press("jump")


func _on_button_jump_released() -> void:
	Input.action_release("jump")


func _on_button_action_pressed() -> void:
	Input.action_press("char_action")


func _on_button_action_released() -> void:
	Input.action_release("char_action")
