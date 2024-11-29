extends ZoneMaster

func _ready() -> void:
	if !shouldShowSoftButtons():
		$Player/Camera2D/Buttons.visible = false
	if start_point_configured == false:
		start_point_configured = true
		spawn()
	GameManager.on_all_chars_found.connect(_on_all_chars_found)
	GameManager.on_char_found.connect(_game_manager_on_char_found)
	_game_manager_on_char_found()

func _game_manager_on_char_found():
	$Player/Camera2D/Label.text = GameManager.getMessage()

func spawn():
	if starting_point == "position1":
		$Player.position = $"StartingPoints/Position1".position
	elif starting_point == "position2":
		$Player.position = $"StartingPoints/Position2".position
	else:
		$Player.position = $"StartingPoints/Position1".position
	print("Got facing value: " + str(facing))
	if facing == 0: 
		$Player.flip()
	else:
		$Player.flip(false)

func _on_all_chars_found():
	print("all chars has been found")


func _on_big_chest_on_chest_opened() -> void:
	print("Game Over!")
	$Node/FireworkParticle.emitting = true
	$Node/FireworkParticle2.emitting = true
	$Node/FireworkParticle3.emitting = true
	$Node/FireworkParticle4.emitting = true
	$Node/FireworkParticle5.emitting = true


func _on_kill_zone_on_killed() -> void:
	GameManager.dead()
	spawn()
