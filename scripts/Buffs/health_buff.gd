extends Buff
class_name HealthBuff

func _init() -> void:
	
	id = "health_buff"
	name = "Increase Health"
	amount = 100

func effect(player: Node):
	
	player.max_health += amount
	player.health += amount
	player.game.handle_health()
