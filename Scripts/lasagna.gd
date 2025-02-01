extends CharacterBody2D

@onready var laser: Node2D = $"."
@onready var tip: Node2D = $weapon/Sprite2D/tip

const MAX_SPEED = 3000.0
const ACCELERATION = 3000

signal left_click

# ALL MOVEMENT
func movement_input(delta):
	# input movement
	var direction_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity += direction_vector * ACCELERATION * delta
	
	# friction
	var scale = velocity * 0.05
	velocity -= scale


func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("left_click"):
		left_click.emit("laser", tip.global_position, tip.global_rotation)
		
	
	movement_input(delta)
	move_and_slide()
