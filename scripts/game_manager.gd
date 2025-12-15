extends Node

@onready var score: Label = $Score
@onready var death: Label = $Death
@onready var fuel: Label = $Fuel

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

func handle_score(delta):
	
	if toggle_score:
		current_score += (score_multiplier * delta)
	
	score.text = "Score: " + str(int(current_score))

func handle_fuel(delta):
	
	if toggle_fuel:
		current_fuel -= (fuel_consumption_rate * delta)
		
	fuel.text = "Fuel: " + str(int(current_fuel))

func add_fuel():
	current_fuel += fuel_increase
	
	if current_fuel >= max_fuel:
		current_fuel = max_fuel

func toggle_label_visibility(switch: bool):
	score.visible = switch
	fuel.visible = switch
