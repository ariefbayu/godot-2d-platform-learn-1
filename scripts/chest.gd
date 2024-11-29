extends Area2D

@export var foundChar = ""

signal on_chest_opened

var chestOpened = false
var entered = false

func _process(delta: float) -> void:
	if entered:
		if Input.is_action_just_pressed("char_action") && chestOpened == false:
			chestOpened = true
			$SpriteLock.visible = false
			$SpriteUnlock.visible = true
			GameManager.foundChar(foundChar)
			on_chest_opened.emit()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		entered = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		entered = false
