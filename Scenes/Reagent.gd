extends "res://Scripts/Object.gd"

func TriggerObject(player: Node):
	if !player.GetIsCarrying():
		get_parent().remove_child(self)
		player.find_node("Hands").add_child(self)
		player.SetIsCarrying(true)
		z_index = 4
	else: 
		print("I'm already carrying something")
	
