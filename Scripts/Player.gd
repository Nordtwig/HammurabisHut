extends KinematicBody2D

onready var nav = get_tree().get_root().find_node("NavMesh", true, false)
onready var line = get_tree().get_root().find_node("Line2D", true, false)
onready var dest = nav.get_node("Destination")

var motion
var targetDestination
var targetObject
var path
var isOccupied = false

export var moveSpeed = 200
export var destinationReachedMargin = 5

func _physics_process(delta: float):
	if targetDestination != null:
		Navigate(delta)
		
func NewDestination():
	targetDestination = dest
	MakePath()

func Navigate(delta: float):
	var distanceToMove = moveSpeed * delta
	
	while distanceToMove > 0 && path.size() > 0:
		var distanceToNextPoint = position.distance_to(path[0])
		
		if distanceToMove <= distanceToNextPoint:
			position += position.direction_to(path[0]) * distanceToMove
		else:
			position = path[0]
			path.remove(0)
		distanceToMove -= distanceToNextPoint
	if path.size() <= 0:
		line.points = PoolVector2Array()
		ArrivedAtDest()
		
func MakePath():
	path = nav.get_simple_path(position, targetDestination.position)
	line.points = path

func ArrivedAtDest():
	targetDestination = null
	get_tree().call_group("Objects", "CheckPlayerIntent", self)

func TargetAcquired(target: Node):
	targetObject = target
