class_name ZoneMaster

extends Node2D

var start_point_configured = false
var starting_point: String = ""
var facing: int = 1

func shouldShowSoftButtons():
	var os_name = OS.get_name()
	return os_name == "Android" || os_name == "iOS" || os_name == "Web"
