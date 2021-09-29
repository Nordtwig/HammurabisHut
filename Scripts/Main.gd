extends Node2D

onready var nav = get_tree().get_root().find_node("NavMesh", true, false)
onready var dest = nav.get_node("Destination")

func _input(event):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		SetPlayerDestination(get_global_mouse_position())

func RequestSpawnItem(requestedItemName: String, parent: Node):
	if CheckIfSceneExists(requestedItemName):
		parent.add_child(load("res://Scenes/" + requestedItemName + ".tscn").instance(), true)

func RequestNewDestination(pos: Vector2):
	SetPlayerDestination(pos)

func SetPlayerDestination(newPos: Vector2):
	dest.position = newPos
	get_tree().call_group("Player", "NewDestination")

func CheckIfSceneExists(requestedScene: String) -> bool:
	var scene = load("res://Scenes/" + requestedScene + ".tscn")
	if (scene != null):
		return true
	else:
		return false
