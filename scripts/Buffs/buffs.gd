class_name Buff

var id: String
var name: String
var amount

var cooldown: float = -1.0
var active: bool = false

func activate(player: Node) -> void:
	
	active = true
	effect(player)

func deactivate(player: Node) -> void:
	
	active = false



func effect(player: Node):
	pass
