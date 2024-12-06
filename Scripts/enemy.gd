extends Node2D

var fish = load("res://Scenes/bullet.tscn")
signal fire_fish

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate(0.01)
	var f = fish.instantiate()
	add_child(f)
