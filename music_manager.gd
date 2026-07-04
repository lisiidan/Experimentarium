extends AudioStreamPlayer

func _ready() -> void:
	stream = preload("res://assets/background_music_new.mp3")
	volume_db = -10
	play()

	print("BGM stream = ", stream)
	print("BGM playing = ", playing)
