extends Node

var counter: int = 0
const MAX_COUNT: int = 10

func _ready() -> void:
	# Load the saved counter value
	if FileAccess.file_exists("user://counter.save"):
		var file = FileAccess.open("user://counter.save", FileAccess.READ)
		counter = file.get_32()
		file.close()

func increment_counter() -> void:
	counter += 1
	if counter >= MAX_COUNT:
		counter = 0

	# Save the updated counter value
	var file = FileAccess.open("user://counter.save", FileAccess.WRITE)
	file.store_32(counter)
	file.close()
