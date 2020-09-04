extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		$AnimatedSprite.play("run")
	
	elif Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		$AnimatedSprite.play("run")
		
	else:
		$AnimatedSprite.stop()
		$AnimatedSprite.play("idle")
	
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	
	
