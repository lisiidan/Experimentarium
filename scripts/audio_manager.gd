extends Node

var click_player: AudioStreamPlayer
var happy_cat_player: AudioStreamPlayer
var angry_cat_player: AudioStreamPlayer
var scared_cat_player: AudioStreamPlayer

func _ready() -> void:
	click_player = AudioStreamPlayer.new()
	happy_cat_player = AudioStreamPlayer.new()
	angry_cat_player = AudioStreamPlayer.new()
	scared_cat_player = AudioStreamPlayer.new()
	
	add_child(click_player)
	add_child(happy_cat_player)
	add_child(angry_cat_player)
	add_child(scared_cat_player)
	
	click_player.stream = preload("res://assets/button_click_sound.mp3")
	click_player.volume_db = -5
	
	happy_cat_player.stream = preload("res://assets/happy_cat_sound.wav")
	happy_cat_player.volume_db = -5
	
	angry_cat_player.stream = preload("res://assets/cat_purr.mp3")
	angry_cat_player.volume_db = -5
	
	scared_cat_player.stream = preload("res://assets/cat_meow.mp3")
	scared_cat_player.volume_db = -5

func play_click() -> void:
	if click_player == null:
		return

	click_player.stop()
	click_player.play()

func play_happy_cat() -> void:
	if happy_cat_player == null:
		return
	happy_cat_player.stop()
	happy_cat_player.play()

func play_angry_cat() -> void:
	if angry_cat_player == null:
		return
	angry_cat_player.stop()
	angry_cat_player.play()

func play_scared_cat() -> void:
	if scared_cat_player == null:
		return
	scared_cat_player.stop()
	scared_cat_player.play()
