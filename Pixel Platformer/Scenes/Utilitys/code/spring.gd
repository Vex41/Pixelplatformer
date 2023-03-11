extends StaticBody2D

func _on_spring_area_entered(area):
	$Sprite2D.set_frame(1)

func _on_spring_area_exited(area):
	$Timer.start()

func _on_timer_timeout():
	$Sprite2D.set_frame(0)
