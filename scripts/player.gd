extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var roll_timer = $Timer

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var rolling = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite.play("jump")
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	
	if Input.is_action_just_pressed("roll") and not rolling:
		PlayerManager.grant_immunity(0.5)
		animated_sprite.play("roll")
		roll_timer.start()
		rolling = true
		


func _on_timer_timeout():
	rolling = false
	animated_sprite.play("idle")
