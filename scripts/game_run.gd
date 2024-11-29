extends Node2D


func _on_timer_timeout() -> void:
	$Label.text = "Run: " + GameManager.get_current_run()
	
