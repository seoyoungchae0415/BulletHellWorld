extends Node2D

@onready var bullet_manager: Node2D = $"../BulletManager"
@onready var lasagna: CharacterBody2D = $"../Lasagna"
@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer

var rng = RandomNumberGenerator.new()

signal fire_fish

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	var xpos = rng.randf_range(10, 1000)
	var ypos = rng.randf_range(10, 600)
	position = Vector2(xpos, ypos)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_parent() == bullet_manager:
		on_hit(body)
	else:
		print("WHT")

func on_hit(type):
	if type.name == "laser":
		print("UHOH")
		animation_player.play("on_hit_laser")
	type.queue_free()
