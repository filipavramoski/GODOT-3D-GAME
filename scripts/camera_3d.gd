extends Camera3D

@export var target: Node3D 
@export var follow_speed: float = 5.0

func _process(delta):
	if target:
		global_transform.origin = global_transform.origin.lerp(target.global_transform.origin, delta * follow_speed)
