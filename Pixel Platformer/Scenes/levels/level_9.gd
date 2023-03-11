extends TileMap

@onready var global = get_node("/root/Global")

func _on_area_2d_area_entered(area):
	if global.door == true:
		get_tree().change_scene_to_file("res://Scenes/levels/level_10.tscn")
