extends Node2D

onready var nav = get_tree().get_root().find_node("NavMesh", true, false)
onready var dest = nav.get_node("Destination")
onready var timer = get_node("NewDestinationTimer")

var canMoveDest = true

func _input(event):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and canMoveDest:
		dest.position = get_global_mouse_position()
		get_tree().call_group("Player", "NewDestination")
		canMoveDest = false
		timer.start()



func _on_NewDestinationTimer_timeout() -> void:
	canMoveDest = true
