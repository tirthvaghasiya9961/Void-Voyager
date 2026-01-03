extends Node
class_name BuffManager

var buff_registry: Dictionary = {}
var active_buffs: Dictionary = {}

var player: Node

func _init(p: Node) -> void:
	player = p
	register_buffs()

func register_buffs():
	buff_registry = {
		"health_buff": HealthBuff,
		"score_buff": ScoreBuff,
		
	}

func activate_buff(buff_id: String):
	
	if not active_buffs.has(buff_id) and buff_registry.has(buff_id):
		active_buffs[buff_id] = 0
	elif not buff_registry.has(buff_id):
		push_warning("Unknown buff id: %s" % buff_id)
		return
		
	var buff = buff_registry[buff_id].new()
	buff.activate(player)
	
	active_buffs[buff_id] += 1

func deactivate_buff(buff_id: String):
	
	#code for buff deactivation
	pass
