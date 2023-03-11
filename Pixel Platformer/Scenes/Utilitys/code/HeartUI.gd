extends Node2D

@onready var player_vars = get_node("/root/Player")

#func _ready():
	if player_vars.health == 3:
		get_node("AnimationPlayer").play("3 hearts")
	if player_vars.health == 2:
		get_node("AnimationPlayer").play("2 hearts")
	if player_vars.health == 1:
		get_node("AnimationPlayer").play("1 heart")
	if player_vars.health == 0:
		get_node("AnimationPlayer").play("no hearts")
