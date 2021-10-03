extends Node2D

onready var itemContainer = get_child(0)

export var containedItemName = "Object"

var isOccupied

func _ready() -> void:
	if containedItemName != "":
		isOccupied = true
		itemContainer.global_rotation_degrees = 0.0
		get_tree().call_group("GameMaster", "RequestSpawnItem", containedItemName, itemContainer)
	if get_child(0).get_child_count() > 0:
		isOccupied = false

func _on_Slot_Clicked(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		get_tree().call_group("GameMaster", "RequestNewDestination", $PickUpPosition.global_position)
		if !isOccupied:
			get_tree().call_group("Player", "TargetAcquired", self)
