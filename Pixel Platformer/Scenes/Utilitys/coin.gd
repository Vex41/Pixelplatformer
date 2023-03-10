extends StaticBody2D

func _ready():
	$AnimationPlayer.play("spin")

func _on_area_2d_area_entered(area):
	$pickup.play()

func _on_pickup_finished():
	queue_free()
