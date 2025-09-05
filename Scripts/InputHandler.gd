extends Node3D

var direction:Vector3
var parry_pressed:bool

func _physics_process(delta: float) -> void:
	direction = Vector3.ZERO
	parry_pressed = false
	
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.z = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	direction = direction.normalized()
	
	if Input.is_action_pressed("parry"):
		parry_pressed = true
