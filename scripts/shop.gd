extends CanvasLayer
class_name Shop

var gridcont: GridContainer

var buff_registry: Dictionary = {}

var items = ShopItems.new().Items

@onready var game: Node = %GameManager
@onready var close_button: Button = $PanelContainer/MarginContainer/CloseButton

func _ready() -> void:
	#register_buffs()
	
	gridcont = $PanelContainer/MarginContainer/GridContainer
	
	create_shop_items()
	hide()

#func register_buffs():
	#buff_registry = {
		#"health_buff": HealthBuff,
		#"ScoreBuff": ScoreBuff,
		#
	#}

func create_shop_items():
	
	for i in items:
		var button = Button.new()
		button.text = items[i]["name"]
		var icon: Texture2D = load(items[i]["icon"])
		button.icon = icon
		button.icon_alignment = HORIZONTAL_ALIGNMENT_LEFT
		button.pressed.connect(on_button_pressed.bind(i))
		
		button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		button.custom_minimum_size = Vector2(100, 40)
		button.mouse_filter = Control.MOUSE_FILTER_STOP
		
		gridcont.add_child(button)

func on_button_pressed(buff_id: String):
	
	var buff_manager = game.buff_manager
	
	buff_manager.activate_buff(buff_id)
