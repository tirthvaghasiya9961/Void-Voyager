extends SPAWNER
class_name SpaceStationSpawner

@onready var fuel: FuelSpawner = $"../FuelSpawner"
@onready var asteroid: AsteroidSpawner = $"../AsteroidSpawner"
@onready var coin: CoinSpawner = $"../CoinSpawner"
@onready var alien: AlienSpawner = $"../AlienSpawner"


@onready var game: Node = %GameManager

@export var space_station_spawn_interval: float = 50.0

func space_station_spawner():
	
	if game.current_score > space_station_spawn_interval:
		spawn()
		
		for i in active_spawns:
			i.shop = game.shop
		
		#random increase the spawn condition of the next space station
		space_station_spawn_interval += (space_station_spawn_interval * randf_range(0.8, 1.2))

func _process(delta: float) -> void:
	
	space_station_spawner()
	
	if has_any_spawns():
		fuel.pause_spawning(true)
		asteroid.pause_spawning(true)
		coin.pause_spawning(true)
		alien.pause_spawning(true)
	else:
		fuel.pause_spawning(false)
		asteroid.pause_spawning(false)
		coin.pause_spawning(false)
		alien.pause_spawning(false)

func reset_timer():
	pass
