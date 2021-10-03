extends "res://Scripts/Object.gd"

var inStation = false

export var reagentType = "nettles"
export var workNeeded = 5

func TriggerObject(player: Node):
	if !player.GetIsCarrying() && !inStation:
		get_parent().remove_child(self)
		player.find_node("Hands").add_child(self)
		player.SetIsCarrying(true)
		z_index = 4
