extends CharacterBody2D

@onready var global = get_node("/root/Global")

func _on_key_area_entered(area):
	global.key()
	$AudioStreamPlayer2D.play()
	self.hide()

func _on_audio_stream_player_2d_finished():
	queue_free()
