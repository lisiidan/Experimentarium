extends AudioStreamPlayer2D

func _ready() -> void:
	print("BGM ready")
	print("stream = ", stream)

	volume_db = -10
	play()
