extends CharacterBody3D

var movement_velocity = Vector3.ZERO
const SPEED = 6
const JUMP_VELOCITY = 10  
const GRAVITY = 20  

func _ready():
	print("hey")

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y -= GRAVITY * delta

	
	if Input.is_action_pressed("u1_right") and Input.is_action_pressed("u1_left"):
		movement_velocity.x = 0.0
	elif Input.is_action_pressed("u1_right"):
		movement_velocity.x = SPEED
		$MeshInstance3D.rotate_z(deg_to_rad(-8))
	elif Input.is_action_pressed("u1_left"):
		movement_velocity.x = -SPEED
		$MeshInstance3D.rotate_z(deg_to_rad(8))
	else:
		movement_velocity.x = lerp(movement_velocity.x, 0.0, 0.1)

	
	if Input.is_action_pressed("u1_up") and Input.is_action_pressed("u1_down"):
		movement_velocity.z = 0.0
	elif Input.is_action_pressed("u1_up"):
		movement_velocity.z = -SPEED
		$MeshInstance3D.rotate_x(deg_to_rad(-8))
	elif Input.is_action_pressed("u1_down"):
		movement_velocity.z = SPEED
		$MeshInstance3D.rotate_x(deg_to_rad(8))
	else:
		movement_velocity.z = lerp(movement_velocity.z, 0.0, 0.1)

	
	if Input.is_action_just_pressed("jump") and is_on_floor():  
		velocity.y = JUMP_VELOCITY

	
	velocity.x = movement_velocity.x
	velocity.z = movement_velocity.z
	move_and_slide()
