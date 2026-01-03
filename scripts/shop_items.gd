extends Node
class_name ShopItems

var Items := {
	"health_buff": {
		"name": "Increase Health",
		"cost": 2,
		"icon": "res://icon.svg",
		"count": 0,
		"type": HealthBuff
	},
	"score_buff": {
		"name": "Score Boost",
		"cost": 1,
		"icon": "res://icon.svg",
		"count": 0,
		"type": ScoreBuff
	},
	#"h_buff": {
		#"name": "Increase Health",
		#"cost": 2,
		#"icon": Node,
		#"count": 0,
		#"type": HealthBuff
	#},
}
