extends Node

signal entry_unlocked(entry_id: String)

var unlocked_entries: Array[String] = []

var default_entries: Array[String] = [
	"H2", "O2", "N2", "Cl2",
	"C", "Na", "S", "Ca"
]

func _ready():
	SaveManager.load_game()

	if SaveManager.unlocked_journal.is_empty():
		reset_to_default()
	else:
		unlocked_entries.clear()

		for entry in SaveManager.unlocked_journal:
			unlocked_entries.append(entry)

func reset_to_default():
	unlocked_entries.clear()

	for entry in default_entries:
		unlocked_entries.append(entry)

	SaveManager.unlocked_journal.clear()

	for entry in unlocked_entries:
		SaveManager.unlocked_journal.append(entry)

	SaveManager.save_game()

func unlock_entry(entry_id: String) -> bool:
	if entry_id == "":
		return false

	if unlocked_entries.has(entry_id):
		return false

	unlocked_entries.append(entry_id)

	SaveManager.unlocked_journal.clear()

	for entry in unlocked_entries:
		SaveManager.unlocked_journal.append(entry)

	SaveManager.save_game()

	entry_unlocked.emit(entry_id)
	return true

func is_unlocked(entry_id: String) -> bool:
	return unlocked_entries.has(entry_id)

func get_unlocked_entries() -> Array[String]:
	return unlocked_entries.duplicate()
