extends Node

@onready var score: Label = $"../CanvasLayer/PanelContainer/MarginContainer/GridContainer/Score"
@onready var fuel: Label = $"../CanvasLayer/PanelContainer/MarginContainer/GridContainer/Fuel"
@onready var coin: Label = $"../CanvasLayer/PanelContainer/MarginContainer/GridContainer/Coin"
@onready var death: Label = $"../CanvasLayer/Death"
@onready var shop: Shop = $"../Shop"
@onready var health_num: Label = $"../CanvasLayer/PanelContainer2/MarginContainer/GridContainer/HealthNUM"

var player: Node

#score variables
var current_score: float = 0
var score_multiplier: float = 5
#fuel variables
var current_fuel: float = 100
var fuel_increase: float = 25.0
var fuel_consumption_rate: float = 1.5
var max_fuel: float = 100
#flag switch
var toggle_score: bool = true
var toggle_fuel: bool = true

#coin variables
var gold: int = -1

#instances of classes
var buff_manager

func _ready() -> void:
	player = $"../Player"
	buff_manager = BuffManager.new(player)
	
	handle_coin()


func handle_score(delta):
	
	if toggle_score:
		current_score += (score_multiplier * delta)
	
	score.text = "Score: " + str(int(current_score))

func handle_fuel(delta):
	
	if toggle_fuel:
		current_fuel -= (fuel_consumption_rate * delta)
		
	fuel.text = "Fuel: " + str(int(current_fuel))

func handle_health():
	var ch = player.health
	var mh = player.max_health
	health_num.text = str(int(ch)) + "/" + str(int(mh))

func handle_coin():
	
	gold += 1
	
	coin.text = "Gold: " + str(gold)

func add_fuel():
	current_fuel += fuel_increase
	
	if current_fuel >= max_fuel:
		current_fuel = max_fuel

func toggle_label_visibility(switch: bool):
	$"../CanvasLayer/PanelContainer".hide()
