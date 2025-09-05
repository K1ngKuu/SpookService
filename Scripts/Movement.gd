extends Node3D

@export var speed := 10
@export var friction := .25
@export var acceleration := .2

var character:CharacterBody3D
var input_handler:Node3D

func _ready() -> void:
	character = get_parent() as CharacterBody3D
	input_handler = get_parent().get_node("InputHandler")

func _physics_process(delta: float) -> void:
	if !character and input_handler:
		print("NO CHARACTER BODY AND/OR INPUT SOURCE FOUND!")
	var target_velocity:Vector3 = input_handler.direction * speed
	if target_velocity != Vector3.ZERO:
		character.velocity = lerp(character.velocity, target_velocity, acceleration)
	else:
		character.velocity = lerp(character.velocity, target_velocity, friction)
	character.velocity.y = 0
	character.move_and_slide()
