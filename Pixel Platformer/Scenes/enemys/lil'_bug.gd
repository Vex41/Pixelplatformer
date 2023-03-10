extends CharacterBody2D

var move = Vector2()
var right = false
var left = true
var sleep = true

func _physics_process(delta):
	
	
	if !$right.is_colliding():
		right = false
		left = true
	if !$left.is_colliding():
		right = true
		left = false
	if right == true and sleep == false:
		move.x = 1
		$Sprite2D.scale.x = -1
		$AnimationPlayer.play("Walk")
	if left == true and sleep == false:
		move.x = -1
		$Sprite2D.scale.x = 1
		$AnimationPlayer.play("Walk")
	
	if sleep == true:
		$AnimationPlayer.play("sleep")
	
	move_and_collide(move)


func _on_sleep_area_entered(area):
	$Timer.start()
	sleep = false


func _on_timer_timeout():
	$Timer.stop()
	move.x = 0
	sleep = true
