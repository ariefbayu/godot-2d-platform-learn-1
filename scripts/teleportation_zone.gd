extends Area2D

@export var target = ""
@export var starting_point = ""
@export_enum ("LEFT", "RIGHT") var facing: int = 1


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		GameManager.change_scene(target, starting_point, facing)
