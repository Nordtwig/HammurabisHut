extends Area2D

var playerInContact = false
var isTarget = false

#func _process(delta: float) -> void:
#	if playerInContact && isTarget:
#		print("touching me and wants to hold me")

func _ready() -> void:
	name = "Object" + String(self.get_instance_id())

func CheckTarget(target: Node):
	if target == self:
		isTarget = true
	else: 
		isTarget = false

func CheckPlayerIntent(player: Node):
	if isTarget:
		TriggerObject(player)
		isTarget = false
		
func _on_Object_body_entered(body: Node) -> void:
	if body.name == "Player":
		playerInContact = true

func _on_Object_body_exited(body: Node) -> void:
	if body.name == "Player":
		playerInContact = false

func _on_Object_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		get_tree().call_group("Objects", "CheckTarget", self)

func TriggerObject(player: Node):
	print("I haven't inherited my right existence")
