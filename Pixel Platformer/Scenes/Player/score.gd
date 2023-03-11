extends Sprite2D

@onready var player = get_node("/root/Playergd")
@onready var score = player.score

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if score == 0:
		$AnimationPlayer.play("0")
	if score == 1:
		$AnimationPlayer.play("1")
	if score == 2:
		$AnimationPlayer.play("2")
	if score == 3:
		$AnimationPlayer.play("3")
	if score == 4:
		$AnimationPlayer.play("4")
	if score == 5:
		$AnimationPlayer.play("5")
	if score == 6:
		$AnimationPlayer.play("6")
	if score == 7:
		$AnimationPlayer.play("7")
	if score == 8:
		$AnimationPlayer.play("8")
	if score == 9:
		$AnimationPlayer.play("9")
