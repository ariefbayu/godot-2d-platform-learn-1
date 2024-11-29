extends ZoneMaster


func _on_button_start_pressed() -> void:
	GameManager.change_scene("zone1", "position0", 1)
