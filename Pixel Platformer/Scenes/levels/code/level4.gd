extends Area2D

func _on_area_entered(area):
	get_tree().change_scene_to_file("res://Scenes/levels/level_5.tscn")
