extends Area3D

signal coinCollected	

func _ready() -> void:
	pass 



func _physics_process(delta: float) :
	rotate_y(deg_to_rad(3))


func _on_body_entered(body: Node3D) :
	if body.name=="Player":
		$AnimationPlayer.play("bounce")
		$Timer.start()


func _on_timer_timeout() :
	emit_signal("coinCollected")
	queue_free() 
