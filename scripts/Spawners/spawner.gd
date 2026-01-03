extends Node2D
class_name SPAWNER

@export var scene_to_spawn: PackedScene
@export var spawn_interval_min: float
@export var spawn_interval_max: float
@export var spawn_height_variance: float
@export var spawn_speed_variation: float

@onready var marker: Marker2D = $Marker2D
@onready var timer: Timer = $Timer

var instance : Node = null

#var speed: float
var active_spawns: Array = []
var start_spawning: bool = true

#Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#timer.timeout.connect(spawn)
	#reset_timer()

func spawn():
	instance = scene_to_spawn.instantiate()
	# Set random spawn position (right side of screen, random Y)
	var spawn_pos = marker.global_position
	spawn_pos.y += randf_range(-spawn_height_variance, spawn_height_variance)
	instance.global_position = spawn_pos
	
	# Add some speed variation
	instance.speed *= randf_range(1 - spawn_speed_variation, 1 + spawn_speed_variation)
	
	# Add to scene
	get_tree().current_scene.add_child(instance)
	
	#Add in list
	active_spawns.append(instance)
	instance.spawner = self
	
	# Reset timer for next spawn
	reset_timer()

func reset_timer():
	var next_spawn = randf_range(spawn_interval_min, spawn_interval_max)
	timer.wait_time = next_spawn
	timer.start()

func get_spawn_count() -> int:
	return active_spawns.size()

func has_any_spawns() -> bool:
	return active_spawns.size() > 0

func pause_spawning(switch: bool):
	timer.set_paused(switch)

func on_spawn_removed(spawn: Node):
	active_spawns.erase(spawn)
