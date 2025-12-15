extends RigidBody2D

@onready var area: Area2D = $Area1
@onready var camera: Camera2D = $Camera2D
@onready var area2: Area2D = $Area2
@onready var savemenu: Window = $"Save Menu"
@onready var shop: Window = $Shop
@onready var collision_shape2_2d: CollisionShape2D = $Area2/CollisionShape2D

@export var speed: float = 200.0
var cutscene_speed: float = 150.0

var spawner: Node = null
var player: Node = null

func _ready():
	# Set up physics properties
	gravity_scale = 0  # No gravity in space
	linear_damp = 0    # No air resistance
	angular_damp = 0   # Smooth rotation
	
	# Set movement (moving left for sidescroller)
	linear_velocity = Vector2(-speed, 0)
	
	savemenu.hide()
	shop.hide()
	
	$VisibleOnScreenNotifier2D.screen_exited.connect(_on_screen_exited)

func _on_screen_exited():
	queue_free()

func _exit_tree() -> void:
	if spawner != null:
		spawner.on_spawn_removed(self)

func start_cutscene():
	
	#manage camera
	player.camera.enabled = false
	camera.enabled = true
	
	player.entered_space_station()
	
	linear_velocity = Vector2(-cutscene_speed, 0)

func space_rest_stop():
	savemenu.show()
	

func _on_area_1_body_entered(body: Node2D) -> void:
	
	if body.name == "Player":
		player = body
		start_cutscene()


func _on_area_2_body_entered(body: Node2D) -> void:
	
	if body.name == "Player":
		linear_velocity = Vector2(0,0)
		space_rest_stop()


func _on_shop_button_pressed() -> void:
	savemenu.hide()
	shop.show()


func _on_shop_close_requested() -> void:
	shop.hide()
	savemenu.show()


func _on_continue_button_pressed() -> void:
	savemenu.hide()
	
	#handle starting position
	var skip_pos = collision_shape2_2d.get_shape().size.x / 2
	global_position.x -= skip_pos
	#print(skip_pos)
	
	linear_velocity = Vector2(-cutscene_speed, 0)

func end_cutscene():
	camera.enabled = false
	player.camera.enabled = true
	
	player.exited_space_station()


func _on_area_1_body_exited(body: Node2D) -> void:
	
	if body.name == "Player":
		end_cutscene()
