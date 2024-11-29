extends Node2D

signal on_all_chars_found
signal on_char_found

var current_scene

var isFirstLoad = true

var foundF = false
var foundI = false
var foundR = false
var foundA = false
var foundS = false

var startTime:float = 0
var finishTime: float = 0
var deathCount = 0

func _ready() -> void:
	change_scene("zone1", "position0", 1)
	#change_scene("zone6", "position1", 1)
	startTime = Time.get_unix_time_from_system()
	#pass

func reload_scene():
	get_tree().get_root().get_child(1)
	
func change_scene(target: String, start: String, facing: int) -> void:
	print("Change scene to " + target + " at " + start)
	$AnimationPlayer.play("fade_in")
	await $AnimationPlayer.animation_finished
	var scene = load("res://scenes/" + target + ".tscn")
	var loaded_scene = scene.instantiate()
	loaded_scene.starting_point = start
	loaded_scene.facing = facing
	#get_tree().change_scene_to_packed(loaded_scene)
	if isFirstLoad:
		isFirstLoad = false
		get_tree().get_root().get_child(2).free()
	else:
		get_tree().get_root().get_child(1).free()
	get_tree().get_root().add_child(loaded_scene)
	get_tree().get_root().move_child(loaded_scene, 1)
	$AnimationPlayer.play_backwards("fade_in")
	await $AnimationPlayer.animation_finished

func foundChar(char: String):
	if char == "F":
		foundF = true
		on_char_found.emit()
	if char == "I":
		foundI = true
		on_char_found.emit()
	if char == "R":
		foundR = true
		on_char_found.emit()
	if char == "A":
		foundA = true
		on_char_found.emit()
	if char == "S":
		foundS = true
		on_char_found.emit()
		
	if isFoundAll():
		finishTime = Time.get_unix_time_from_system()
		print("Game time: " + str(finishTime - startTime))
		on_all_chars_found.emit()

func getTotalGameTime() -> float:
	return finishTime - startTime

func dead():
	deathCount+=1

func getMessage():
	var msg = ""
	msg += "F" if foundF else "*"
	msg += "I" if foundI else "*"
	msg += "R" if foundR else "*"
	msg += "A" if foundA else "*"
	msg += "S" if foundS else "*"
	return msg

func isFoundAll() -> bool:
	#return true
	return foundF && foundI && foundR && foundA && foundS
