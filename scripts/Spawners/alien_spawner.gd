extends SPAWNER
class_name AlienSpawner

var player: Node = null

func _ready():
	
	player = $"../Player"
	timer.timeout.connect(spawn)
	reset_timer()

#func spawn():
	#super.spawn()
	#for i in active_spawns:
		#i.player = player
