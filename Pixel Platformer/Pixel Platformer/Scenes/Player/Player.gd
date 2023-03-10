extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jumped = true
var health = 3

func _physics_process(delta):
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
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited():
	$"off map".play()
	$Timer.start()


func _on_timer_timeout():
	$Timer.stop()
	get_tree().reload_current_scene()


func _on_enemy_area_entered(area):
	$death.play()
	$Timer2.start()
	$CanvasLayer/AnimationPlayer.play("fade out")

func _on_timer_2_timeout():
	$Timer2.stop()
	get_tree().change_scene_to_file("res://Scenes/levels/level_1.tscn")
