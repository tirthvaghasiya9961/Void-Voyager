extends SPAWNER
class_name FuelSpawner


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timeout.connect(spawn)
	reset_timer()
