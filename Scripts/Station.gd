extends "res://Scripts/Object.gd"

var containedReagent
var workDone = 0

func TriggerObject(player: Node):
	if player.GetIsCarrying():
		var item = player.find_node("Hands").get_child(0)
		player.find_node("Hands").remove_child(item)
		add_child(item)
		player.SetIsCarrying(false)
		item.z_index = 2
		item.inStation = true
		containedReagent = item
	if containedReagent != null:
		if workDone >= containedReagent.workNeeded:
			containedReagent.inStation = false
			containedReagent.TriggerObject(player)
		else: 
			workDone += 1
			print(workDone)
