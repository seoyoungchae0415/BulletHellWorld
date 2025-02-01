extends Node2D

@onready var game: Node2D = $".."
@onready var laser = preload("res://Scenes/laser.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click"):
		fire()

func fire():
	pass


func _on_lasagna_left_click(type, origin, rot) -> void:
	var las = laser.instantiate()
	las.global_position = origin
	las.global_rotation = rot
	add_child(las)
