extends State
class_name RepositionState

@onready var sprite_2d: Sprite2D = $"../../Sprite2D"
@onready var enemy: Node2D = $"../.."

var rng = RandomNumberGenerator.new()

func Enter():
	# Play reposition animation
	pass

func Exit():
	
	pass

func Update(_delta):
	var xpos = rng.randf_range(10, 1000)
	var ypos = rng.randf_range(10, 600)
	enemy.position = Vector2(xpos, ypos)
	# if statement to transition out of state when exit condition
