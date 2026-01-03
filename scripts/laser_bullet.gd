extends RigidBody2D
class_name LaserBullet

@export var speed: float = 500.0
@export var damage: float = 10.0

var velocity: = Vector2.ZERO
var dir
var spawnPos: Vector2
var zdex: int

func _ready() -> void:
	
	global_position = spawnPos
	velocity = dir * speed
	
	rotate(dir.angle())

func _process(delta: float) -> void:
	
	linear_velocity = velocity



func _on_area_2d_body_entered(body: Node2D) -> void:
	pass
