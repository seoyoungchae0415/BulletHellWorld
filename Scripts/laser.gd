extends CharacterBody2D

const SPEED = 10000
var direction
var rot : float

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	# velocity = Vector2(SPEED, -SPEED).rotated(rot)
	position += transform.x * SPEED * delta
	pass

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
