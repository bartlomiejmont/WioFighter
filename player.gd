extends KinematicBody2D

const gravity = 10
const jumpPower = -250
const FLOOR = Vector2(0, -1)

export (int) var speed = 200

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	
	if Input.is_action_pressed('ui_right'):
		velocity.x += 3
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
		
	elif Input.is_action_pressed('ui_left'):
		velocity.x -= 3
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
		
	elif Input.is_action_pressed("ui_up"):
		velocity.y = jumpPower
		$AnimatedSprite.play("jumpPress")
	elif Input.is_action_pressed("ui_down"):
		$AnimatedSprite.play("legHit")
		
	else:
		$AnimatedSprite.play("idle")
		
	
	
	
	
	velocity.y += gravity
	velocity = velocity.normalized() * speed
	
	move_and_slide(velocity)

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	
	
