extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Shine")



func _on_area_2d_area_entered(area):
	$Timer.start()
	$AudioStreamPlayer2D.play()
	self.hide()

func _on_timer_timeout():
	queue_free()
