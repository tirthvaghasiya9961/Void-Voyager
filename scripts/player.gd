extends CharacterBody2D
class_name Player

@onready var game: Node = %GameManager
@onready var camera: Camera2D = $"../Camera2D"

# Movement settings
@export var speed: float = 300.0
@export var acceleration: float = 25.0
@export var friction: float = 2.0

@export var health: float = 100

var enable_player_movement: bool = true

## Screen bounds (adjust based on your camera/viewport)
#@export var top_limit: float = 50.0
#@export var bottom_limit: float = 550.0
#
#func handle_movement(delta):
	#var input_direction = Vector2.ZERO
	#
	## Check for vertical input (W and S keys)
	#if Input.is_action_pressed("move_up"):
		#input_direction.y = -1  # Negative Y moves up in Godot
	#elif Input.is_action_pressed("move_down"):
		#input_direction.y = 1   # Positive Y moves down
	#
	## Apply movement with acceleration/friction for smooth feel
	#if input_direction.y != 0:
		#velocity.y = move_toward(velocity.y, input_direction.y * speed, acceleration * delta)
	#else:
		#velocity.y = move_toward(velocity.y, 0, friction * delta)
#
#func apply_screen_bounds():
	## Keep player within screen bounds
	#if position.y <= top_limit:
		#position.y = top_limit
		#velocity.y = max(velocity.y, 0)  # Stop upward movement
	#elif position.y >= bottom_limit:
		#position.y = bottom_limit
		#velocity.y = min(velocity.y, 0)  # Stop downward movement
#
#func _ready():
	## Connect collision signals
	## OR use collision detection in _physics_process if using CharacterBody2D
	#pass
#
#func _physics_process(delta):
	#handle_movement(delta)
	#apply_screen_bounds()
#
	## Check for collisions after movement
	#move_and_slide()
#
	## Check if we hit any asteroids
	#for i in get_slide_collision_count():
		#var collision = get_slide_collision(i)
		#var collider = collision.get_collider()
		#
		#if collider is Asteroid:
			#_handle_asteroid_collision(collider)
#
#func _handle_asteroid_collision(asteroid: Asteroid):
	#print("Hit asteroid!")
	## Add your collision response here:
	## - Reduce health
	## - Play explosion effect  
	## - Game over
	## - Etc.

func _physics_process(delta):
	velocity = Vector2.ZERO
	
	if enable_player_movement:
		handle_movement(delta)
	#EDIT THIS METHOD LATER FOR SMOOTHER MOVEMENT
	
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		
		if collider is Asteroid:
			handle_asteroid_collision(collider)
		elif collider is Fuel:
			handle_fuel_collision(collider)
	
	if is_alive():
		game.handle_score(delta)
		game.handle_fuel(delta)
	else:
		handle_death()

func handle_movement(delta):
	
	var input_direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		input_direction.y = -1
	if Input.is_action_pressed("move_down"):
		input_direction.y = 1
	
	if input_direction.y != 0:
		#velocity.y += input_direction.y * speed
		velocity.y = lerp(velocity.y, speed * input_direction.y, acceleration * delta)
	else:
		velocity.y = lerp(velocity.y, 0.0, friction * delta)

func handle_asteroid_collision(collider: Object):
	health -= 10
	
	collider.queue_free()
	
	print(health)
	
	#if health < 1:
		#handle_death()

func handle_death():
	#print("You Died!")
	game.death.visible = true

func handle_fuel_collision(collider: Object):
	game.add_fuel()
	collider.queue_free()

func is_alive() -> bool:
	
	if health <= 0 or game.current_fuel <= 0:
		return false
	
	return true 

func entered_space_station():
	game.toggle_label_visibility(false)
	enable_player_movement = false
	position.y = 257.0
	
	#stop score and fuel calculations
	game.toggle_fuel = false
	game.toggle_score = false

func exited_space_station():
	game.toggle_label_visibility(true)
	enable_player_movement = true
	
	game.toggle_fuel = true
	game.toggle_score = true
