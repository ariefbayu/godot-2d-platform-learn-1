extends ZoneMaster

func _ready() -> void:
	if !GameManager.is_game_started:
		$Player/Camera2D/Label.visible = false
		$Player/Camera2D/LabelKilled.visible = false
		$Player/Camera2D/GameRun.visible = false
		$Player.freeze()

		Dialogic.start("help-start")
		Dialogic.signal_event.connect(_dialogic_events)
	if !shouldShowSoftButtons():
		$Player/Camera2D/Buttons.visible = false
	if start_point_configured == false:
		start_point_configured = true
		spawn()
	GameManager.on_char_found.connect(_game_manager_on_char_found)
	_game_manager_on_char_found()

func _dialogic_events(arg: String):
	if arg == "helpstart_finished":
		GameManager.start_run()
		$Player/Camera2D/Label.visible = true
		$Player/Camera2D/LabelKilled.visible = true
		$Player/Camera2D/GameRun.visible = true
		$Player.unfreeze()


func _game_manager_on_char_found():
	$Player/Camera2D/Label.text = GameManager.getMessage()

func spawn():
	print("Position: " + starting_point + " | Facing: " + str(facing))
	$Player/Camera2D/LabelKilled.text = "Killed: " + str(GameManager.deathCount)
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
