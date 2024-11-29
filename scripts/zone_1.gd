extends ZoneMaster

func _ready() -> void:
	if start_point_configured == false:
		start_point_configured = true
		spawn()
	GameManager.on_char_found.connect(_game_manager_on_char_found)
	_game_manager_on_char_found()
	$Player/Camera2D/DialogueLabel.start_dialogue()

func _game_manager_on_char_found():
	$Player/Camera2D/Label.text = GameManager.getMessage()

func spawn():
	print("Position: " + starting_point + " | Facing: " + str(facing))
	if starting_point == "position1":
		$Player.position = $"StartingPoints/Position1".position
	elif starting_point == "position2":
		$Player.position = $"StartingPoints/Position2".position
	elif starting_point == "position3":
		$Player.position = $"StartingPoints/Position3".position
	elif starting_point == "position0":
		$Player.position = $"StartingPoints/Position0".position
	print("Got facing value: " + str(facing))
	if facing == 0: 
		$Player.flip()
	else:
		$Player.flip(false)

func _on_kill_zone_on_killed() -> void:
	GameManager.dead()
	spawn()
