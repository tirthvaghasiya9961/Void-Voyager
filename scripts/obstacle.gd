extends RigidBody2D
class_name OBSTACLE

@export var speed: float
@export var rotation_speed: float

var spawner: Node = null

func _ready():
	# Set up physics properties
	gravity_scale = 0  # No gravity in space
	linear_damp = 0    # No air resistance
	angular_damp = 0   # Smooth rotation	
	
	# Set initial movement (moving left for sidescroller)
	linear_velocity = Vector2(-speed, 0)
	angular_velocity = rotation_speed * randf_range(-1.0, 1.0)
	
	# Connect cleanup signal
	$VisibleOnScreenNotifier2D.screen_exited.connect(_on_screen_exited)

#func _process(delta: float) -> void:
	#linear_velocity = Vector2(-speed, 0)

func _on_screen_exited():
	# Remove asteroid when it goes off-screen
	queue_free()

func _exit_tree() -> void:
	if spawner != null:
		spawner.on_spawn_removed(self)
