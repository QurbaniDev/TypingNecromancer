extends RigidBody2D

@export var speed := 100.0
var Hit : bool = false

func _process(delta):
	linear_velocity = Vector2(0, -speed)

func _on_body_entered(body: Node) -> void:
	Hit = true
	if Hit == true:
		queue_free()
