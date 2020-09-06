extends KinematicBody2D

const SPEED = 300
const GRAVITY = 20
const JUMP_POWER = -400
const FLOOR = Vector2(0, -1)

var state_machine
export var velocity = Vector2()

var on_ground = false
export var canMove = true

func _ready():
	state_machine = $AnimationTree.get("parameters/playback")

func _physics_process(delta):
	if Input.is_action_pressed("leg_hit"): #leg_hit - D
		state_machine.travel("LegHit")
	elif Input.is_action_pressed("ui_right") and canMove:
		velocity.x = SPEED
		state_machine.travel("Run")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left") and canMove:
		velocity.x = -SPEED
		state_machine.travel("Run")
		$AnimatedSprite.flip_h = true
	else:
		velocity.x = 0
		state_machine.travel("Idle")
		
	if Input.is_action_pressed("ui_up"):
		if on_ground == true:
			velocity.y = JUMP_POWER
			on_ground = false
	
	velocity.y += GRAVITY
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
		if velocity.y < 0:
			state_machine.travel("Jump")
		else:
			state_machine.travel("Fall")
		
		
	velocity = move_and_slide(velocity, FLOOR)

