extends CanvasLayer

var start = true

func _ready():
	if start == true:
		$AnimationPlayer.play("Fade in")
		start = false
