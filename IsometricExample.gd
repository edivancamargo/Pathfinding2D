extends Node2D

onready var nav : Navigation2D = $Navigation2D
onready var Godette : Sprite = $Godette

var path : PoolVector2Array
var goal : Vector2
export var speed := 250

func _input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			goal = event.position
			path = nav.get_simple_path(Godette.position, goal, false)
			$Line2D.points = PoolVector2Array(path)
			$Line2D.show()
			
func _process(delta: float) -> void:
	if !path:
		$Line2D.hide()
		return
	if path.size() > 0:
		var d: float = Godette.position.distance_to(path[0])
		if d > 10:
			Godette.position = Godette.position.linear_interpolate(path[0], (speed * delta)/d)
		else:
			path.remove(0)
