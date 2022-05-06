extends KinematicBody2D

onready var signalManager = SignalManager

export(int) var speed := 100 # it's 2D so this is in pixels
var velocity := Vector2.ZERO
var path := []
var threshold: int = 16 
var navigation2d: Navigation2D = null

func _ready() -> void:
	yield(owner, "ready")
	signalManager.connect("find_player", self, "get_target_path")
	navigation2d = owner.navigation2d

func _physics_process(delta) -> void:
	if path.size() > 0:
		move_to_target()

func move_to_target() -> void:
	if global_position.distance_to(path[0]) < threshold:
		path.remove(0)
	else:
		var direction = global_position.direction_to(path[0])
		velocity = direction * speed
		velocity = move_and_slide(velocity)

func get_target_path(target_pos):
	print(target_pos)
	path = navigation2d.get_simple_path(global_position, target_pos, false)
