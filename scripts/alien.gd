extends CharacterBody2D

var spawner: Node = null
var player: Node = null

#@onready var marker: Marker2D = $Marker2D
@onready var timer = $Timer

@export var projectile: PackedScene
@export var speed: float = 200.0
@export var health: float = 10.0

func _ready():
	# Connect cleanup signal
	$VisibleOnScreenNotifier2D.screen_exited.connect(_on_screen_exited)
	
	timer.timeout.connect(shoot)
	shooting_time()
	
	spawner = get_tree().current_scene.get_node("AlienSpawner")
	player = spawner.player

func _on_screen_exited():
	# Remove asteroid when it goes off-screen
	queue_free()

func _physics_process(delta: float) -> void:
	velocity = Vector2(-speed, 0)
	move_and_slide()
	
	if health <= 0:
		queue_free()

func shoot():
	
	var instance = projectile.instantiate()
	
	instance.dir = (player.global_position - global_position).normalized()
	instance.spawnPos = global_position
	instance.zdex = z_index - 1
	
	spawner.add_child.call_deferred(instance)
	
	shooting_time()

func shooting_time():
	
	timer.wait_time = 0.5
	timer.start()

func take_damage(damage: float):
	health -= damage
