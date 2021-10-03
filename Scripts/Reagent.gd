extends "res://Scripts/Object.gd"

export var reagentType = "nettles"
export var workNeeded = 5

func TriggerObject(player: Node):
	if player.isOccupied == false:
		get_parent().get_parent().isOccupied = false
		get_parent().remove_child(self)
		player.find_node("Item").add_child(self)
		player.isOccupied = true
		z_index = 4
	else: 
		get_parent().remove_child(self)
		player.targetObject.find_node("Item").add_child(self)
		Hide(true)

func Hide(status: bool):
	if status:
		scale = Vector2(0,0)
	else: 
		scale = Vector2(1,1) 
