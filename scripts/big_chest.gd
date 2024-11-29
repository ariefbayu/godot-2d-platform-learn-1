extends Area2D

var chestOpened = false
var entered = false

signal on_chest_opened

func _process(delta: float) -> void:
	if entered:
		if Input.is_action_just_pressed("char_action"):
			if GameManager.isFoundAll() == false:
				pass
			elif chestOpened == false:
				chestOpened = true
				$SpriteLocked.visible = false
				$SpriteUnlocked.visible = true
				on_chest_opened.emit()

func _on_body_entered(body: Node2D) -> void:
	entered = true

func _on_body_exited(body: Node2D) -> void:
	entered = false
