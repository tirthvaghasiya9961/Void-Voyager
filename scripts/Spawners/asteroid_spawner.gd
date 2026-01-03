extends SPAWNER
class_name AsteroidSpawner

func _ready() -> void:
	timer.timeout.connect(spawn)
	reset_timer()

#@onready var game: Node = %GameManager
#@onready var timer_2: Timer = $Timer2
#
#var patterns: Array = [
	#"wall",
	#"w",
	#"diagonal",
	#"cluster",
	#"spread",
	#
#]
#
#var wave_count: int = 1
#var wave_distance: float = 1000
#var wave_started: bool = false
#var speed_multiplier: float = 1.0
#var pattern: String
#
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#timer.timeout.connect(spawn_wave)
	##timer_2.timeout.connect(spawn_pattern.bind(pattern))
	#reset_timer()
	##spawn_pattern("diagonal")
#
#func _process(delta: float) -> void:
	#if game.current_score >= wave_count * wave_distance:
		#wave_count += 1
		#speed_multiplier += 0.2
	#
	#
#
#func spawn():
	#get_tree().current_scene.add_child.call_deferred(instance)
	#active_spawns.append(instance)
	#instance.spawner = self
#
#func spawn_pattern(pattern_name):
	#match pattern_name:
		#"wall":
			#var random = randi() % 6
			#var missing: int = 0
			#for y in [90, 270, 450, 630, 810, 990]:
				#
				#if random == missing:
					#missing += 1
					#continue
				#
				#missing += 1
				#var spawnPos = Vector2(marker.global_position.x, y)
				#
				#instance = scene_to_spawn.instantiate()
				#instance.global_position = spawnPos
				#
				#spawn()
		#
		#"w":
			#var flag = randi() % 2
			#for y in [90, 270, 450, 630, 810, 990]:
				#
				#var spawnPos = Vector2(marker.global_position.x, y)
				#flag = !flag
				#
				#if flag:
					#spawnPos.x += 180
				#
				#instance = scene_to_spawn.instantiate()
				#instance.global_position = spawnPos
				#
				#spawn()
		#
		#"diagonal":
			#var dir = randi() % 2
			#var displacement = 180
			#var i = 0 if dir else 5
			#for y in [90, 270, 450, 630, 810, 990]:
				#
				#var spawnPos = Vector2(marker.global_position.x, y)
				#
				#if dir:
					#spawnPos.x += float(displacement * i)
					#i += 1
				#else:
					#spawnPos.x += float(displacement * i)
					#i -= 1
				#
				#instance = scene_to_spawn.instantiate()
				#instance.speed *= speed_multiplier
				#instance.global_position = spawnPos
				#
				#spawn()
#
#func spawn_wave():
	#
	#var ast_in_wave =  randi_range(3 + wave_count, 6 + wave_count)
	#var pat_num = randi() % 3
	#
	#match pat_num:
		#0:
			#pattern = "wall"
		#1:
			#pattern = "w"
		#2:
			#pattern = "diagonal"
	#
	#for i in range(ast_in_wave):
		#timer_2.wait_time = 3.0
		#timer_2.start()
		#await timer_2.timeout
		#spawn_pattern(pattern)
		#
	#reset_timer()
#
#func reset_timer():
	#timer.wait_time = 5.0
	#timer.start()
