extends Area2D

var playerInContact = false
var isTarget = false

#func _process(delta: float) -> void:
#	if playerInContact && isTarget:
#		print("touching me and wants to hold me")

func CheckTarget(target: Node):
	if target == self:
		isTarget = true
		print(String(self.get_instance_id()) + ": player wants to hold me")
	else: 
		isTarget = false
		print(self.name + ": player doesn't want to hold me")

func _on_Object_body_entered(body: Node) -> void:
	if body.name == "Player":
		playerInContact = true

func _on_Object_body_exited(body: Node) -> void:
	if body.name == "Player":
		playerInContact = false

func _on_Object_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		get_tree().call_group("Objects", "CheckTarget", self)
