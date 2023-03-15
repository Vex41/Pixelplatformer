extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0
const SpringJump = -600

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jumped = true
var health = 3
var score = 0
var start = true
@onready var global = get_node("/root/Global")

func _physics_process(delta):
	if start == true:
		$explosion.hide()
		start = false
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_pressed("reset"):
		get_tree().reload_current_scene()
	
	# Handle Jump.
	if Input.is_action_just_pressed("Up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Jump.play()
	
	if !is_on_floor():
		$Sprite2D.set_frame(1)
		jumped = true
	
	if jumped == true and is_on_floor():
		$land.play()
		$AnimationPlayer.play("walk")
		jumped = false
	
	if Input.is_action_pressed("Right"):
		$Sprite2D.scale.x = -1
		if jumped == false:
			$AnimationPlayer.play("walk")
	if Input.is_action_pressed("Left"):
		$Sprite2D.scale.x = 1
		if jumped == false:
			$AnimationPlayer.play("walk")
	
	velocity.x = lerp(velocity.x,0.0,1)
	
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	$RichTextLabel.set_text(str(global.score))
	
	move_and_slide()

func _on_visible_on_screen_notifier_2d_screen_exited():
	$"off map".play()
	$Timer.start()

func _on_timer_timeout():
	$Timer.stop()
	get_tree().reload_current_scene()

func _on_enemy_area_entered(_area):
	$explosion.show()
	$death.play()
	$Timer2.start()
	$CanvasLayer/AnimationPlayer.play("fade out")

func _on_timer_2_timeout():
	$Timer2.stop()
	global.reset()
	get_tree().change_scene_to_file("res://Scenes/levels/level_1.tscn")

func _on_coin_area_entered(_area):
	global.add_coin()

func _on_diamond_area_entered(_area):
	global.add_diamond()

func _on_spring_area_entered(_area):
	velocity.y = SpringJump
