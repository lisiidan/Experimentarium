extends Control

signal next_pressed
signal retry_pressed
signal menu_pressed

@onready var background: TextureRect = $TextureRect
@onready var title_label: Label = $TitleLabel
@onready var next_button: Button = $NextButton
@onready var retry_button: Button = $RetryButton
@onready var menu_button: Button = $MenuButton

var texture_win = preload("res://assets/sprites/level_complete_menu.png")
var texture_fail = preload("res://assets/sprites/menu_failed.png")

func _ready():
	hide()
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED

	next_button.pressed.connect(func(): next_pressed.emit())
	retry_button.pressed.connect(func(): retry_pressed.emit())
	menu_button.pressed.connect(func(): menu_pressed.emit())

func show_for_level_complete(level_index: int):
	_show_menu(texture_win, "Experiment Complete", true, true, true)

func show_for_level_failed(level_index: int):
	_show_menu(texture_fail, "Experiment Failed", false, true, true)

func show_for_game_complete():
	_show_menu(null, "All Experiments Complete", false, false, true)

func _show_menu(texture: Texture, title: String, next_visible: bool, retry_visible: bool, menu_visible: bool) -> void:
	if texture != null:
		background.texture = texture

	title_label.text = title
	next_button.visible = next_visible
	retry_button.visible = retry_visible
	menu_button.visible = menu_visible

	show()
	get_tree().paused = true

func close_menu():
	hide()
	get_tree().paused = false
