extends CharacterBody2D

const FOLLOW_SPEED = 4.0

@onready var pos = get_tree().get_node()

func _physics_process(delta):
	$Sprite2D.position = $Sprite2D.position.lerp(pos, delta * FOLLOW_SPEED)
