extends Buff
class_name ScoreBuff

func _init() -> void:
	
	id = "score_buff"
	name = "Increase Score Gain"
	amount = 2.0

func effect(player: Node):
	
	var game = player.game
	game.score_multiplier += amount
