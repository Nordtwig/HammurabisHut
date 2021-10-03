extends "res://Scripts/Object.gd"

var containedReagent
var workDone = 0

func TriggerObject(player: Node):
#	if containedReagent != null:
#		if workDone >= containedReagent.workNeeded:
#			containedReagent.scale = Vector2(1,1)
#			containedReagent.inStation = false
#			containedReagent.TriggerObject(player)
#			containedReagent = null
#		else: 
#			workDone += 1
#			print(workDone)
#	if player.GetIsCarrying():
#		var item = player.find_node("Hands").get_child(0)
#		player.find_node("Hands").remove_child(item)
#		find_node("Item").add_child(item)
#		player.SetIsCarrying(false)
#		containedReagent = item
#		containedReagent.inStation = true
#		containedReagent.scale = Vector2(0,0)
	pass
