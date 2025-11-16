extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var Visor_On = false;
var Idle = true;
var Visor_change = 0;

func _ready():
	$Helmet.hide()
	$Helmet_Off.hide()

func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	_Animations();

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	

func _Animations():
	# Other animations
	if Input.is_action_pressed("visor_on"):
		#if Visor_change == 0:
		$AnimatedSprite2D.play("Visor On")
		$Redscreen.show()
			#Visor_On = true;
			#Idle = true;
			#Visor_change = 1;
			#$Wait_Timer_Helmet_Animation.start()
		
	
	if Input.is_action_pressed("visor_off"):
	#	if Visor_change == 0:
		$AnimatedSprite2D.play("Visor Off")
		$Redscreen.hide()
			#Visor_On = false;
			#Idle = true;
			#Visor_change = 1;
			#$Wait_Timer_Helmet_Animation.start()
	
	#if Idle && Visor_On == true && Visor_change == 0:
		#$AnimatedSprite2D.play("Idle without visor")
		#$Helmet.show()
		#$Helmet_Off.hide()
		#Visor_change = 1;
		#$Wait_Timer_Helmet_Animation.start()
	#else:
		#$AnimatedSprite2D.play("Idle without visor")
		#$Helmet.hide()
		#$Helmet_Off.show()
		#Visor_change = 1;
		#$Wait_Timer_Helmet_Animation.start()


func _on_wait_timer_helmet_animation_timeout():
	#Visor_change = 0;
	print("Done")


func _on_level_1_visor_on():
	$Helmet_Off.show()
