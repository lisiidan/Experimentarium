extends Node

const SAVE_PATH := "user://save.json"

var unlocked_journal: Array[String] = []

func save_game() -> void:
	var data := {
		"unlocked_journal": unlocked_journal
	}

	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	file.close()

func load_game() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return

	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	var text := file.get_as_text()
	file.close()

	var data = JSON.parse_string(text)
	if typeof(data) != TYPE_DICTIONARY:
		return

	unlocked_journal.clear()

	for entry in data.get("unlocked_journal", []):
		unlocked_journal.append(entry)

func reset_save() -> void:
	unlocked_journal.clear()

	if FileAccess.file_exists(SAVE_PATH):
		DirAccess.remove_absolute(SAVE_PATH)
